using PatientInsight.Api.Controllers;
using PatientInsight.Api.Consumers;
using PatientInsight.Core.Interfaces;
using PatientInsight.Domain.DTOs;
using MassTransit;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Moq;

namespace PatientInsight.Tests;

public class PatientsControllerTests
{
    private readonly Mock<IPatientService> _mockPatientService;
    private readonly Mock<IPublishEndpoint> _mockPublishEndpoint;
    private readonly Mock<ILogger<PatientsController>> _mockLogger;
    private readonly PatientsController _controller;

    public PatientsControllerTests()
    {
        _mockPatientService = new Mock<IPatientService>();
        _mockPublishEndpoint = new Mock<IPublishEndpoint>();
        _mockLogger = new Mock<ILogger<PatientsController>>();
        _controller = new PatientsController(_mockPatientService.Object, _mockPublishEndpoint.Object, _mockLogger.Object);
    }

    [Fact]
    public async Task IsExistingPatient_ReturnsOkResult_WithPatientId()
    {
        var ssn = "123-45-6789";
        var patientId = 1;
        _mockPatientService.Setup(s => s.IsExistingPatientAsync(ssn, It.IsAny<CancellationToken>())).ReturnsAsync(patientId);

        var result = await _controller.IsExistingPatient(ssn, CancellationToken.None);

        var okResult = Assert.IsType<OkObjectResult>(result.Result);
        var apiResponse = Assert.IsType<ApiResponse<int?>>(okResult.Value);
        Assert.True(apiResponse.Success);
        Assert.Equal(patientId, apiResponse.Data);
    }

    [Fact]
    public async Task IsExistingPatient_ReturnsNotFound_WhenPatientNotFound()
    {
        var ssn = "123-45-6789";
        _mockPatientService.Setup(s => s.IsExistingPatientAsync(ssn, It.IsAny<CancellationToken>())).ReturnsAsync((int?)null);

        var result = await _controller.IsExistingPatient(ssn, CancellationToken.None);

        var notFoundResult = Assert.IsType<NotFoundObjectResult>(result.Result);
        var apiResponse = Assert.IsType<ApiResponse<int?>>(notFoundResult.Value);
        Assert.False(apiResponse.Success);
    }

    [Fact]
    public async Task GetPatient_ReturnsOkResult_WithPatientDto()
    {
        var patientId = 1;
        var patientDto = new PatientDto { Id = patientId, FirstName = "John", LastName = "Doe", Ssn = "123-45-6789" };
        _mockPatientService.Setup(s => s.GetPatientAsync(patientId, It.IsAny<CancellationToken>())).ReturnsAsync(patientDto);

        var result = await _controller.GetPatient(patientId, CancellationToken.None);

        var okResult = Assert.IsType<OkObjectResult>(result.Result);
        var apiResponse = Assert.IsType<ApiResponse<PatientDto>>(okResult.Value);
        Assert.True(apiResponse.Success);
        Assert.Equal(patientDto, apiResponse.Data);
    }

    [Fact]
    public async Task GetPatient_ReturnsNotFound_WhenPatientNotFound()
    {
        var patientId = 1;
        _mockPatientService.Setup(s => s.GetPatientAsync(patientId, It.IsAny<CancellationToken>())).ReturnsAsync((PatientDto?)null);

        var result = await _controller.GetPatient(patientId, CancellationToken.None);

        var notFoundResult = Assert.IsType<NotFoundObjectResult>(result.Result);
        var apiResponse = Assert.IsType<ApiResponse<PatientDto>>(notFoundResult.Value);
        Assert.False(apiResponse.Success);
    }

    [Fact]
    public async Task RegisterPatient_ReturnsCreatedAtActionResult()
    {
        var patientDto = new PatientDto { Ssn = "123-45-6789", FirstName = "John", LastName = "Doe" };
        var patientId = 1;
        _mockPatientService.Setup(s => s.RegisterPatientAsync(patientDto, It.IsAny<CancellationToken>())).ReturnsAsync(patientId);

        var result = await _controller.RegisterPatient(patientDto, CancellationToken.None);

        var createdAtActionResult = Assert.IsType<CreatedAtActionResult>(result.Result);
        Assert.Equal(nameof(_controller.GetPatient), createdAtActionResult.ActionName);
        Assert.Equal(patientId, createdAtActionResult.RouteValues!["id"]);
        
        var apiResponse = Assert.IsType<ApiResponse<int>>(createdAtActionResult.Value);
        Assert.True(apiResponse.Success);
        Assert.Equal(patientId, apiResponse.Data);
    }

    [Fact]
    public async Task RegisterPatient_PublishesPatientDataIngestEvent()
    {
        var patientDto = new PatientDto { Ssn = "123-45-6789", FirstName = "John", LastName = "Doe" };
        var patientId = 1;
        _mockPatientService.Setup(s => s.RegisterPatientAsync(patientDto, It.IsAny<CancellationToken>())).ReturnsAsync(patientId);

        await _controller.RegisterPatient(patientDto, CancellationToken.None);

        _mockPublishEndpoint.Verify(x => x.Publish(It.Is<PatientDataIngestEvent>(e =>
            e.PatientId == patientId && e.Ssn == patientDto.Ssn), It.IsAny<CancellationToken>()), Times.Once);
    }
}
