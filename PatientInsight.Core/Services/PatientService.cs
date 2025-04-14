using PatientInsight.Core.Interfaces;
using PatientInsight.Domain.DTOs;
using PatientInsight.Domain.Entities;
using PatientInsight.Infrastructure.Interfaces;
using Microsoft.Extensions.Configuration;
using System.Text.Json;
using AutoMapper;

namespace PatientInsight.Core.Services;

public class PatientService : IPatientService
{
    private readonly IPatientRepository _patientRepository;
    private readonly HttpClient _httpClient;
    private readonly IMapper _mapper;
    private readonly string _externalApiBaseUrl;

    private static readonly JsonSerializerOptions JsonOptions = new()
    {
        PropertyNameCaseInsensitive = true
    };

    public PatientService(
        IPatientRepository patientRepository,
        HttpClient httpClient,
        IMapper mapper,
        IConfiguration configuration)
    {
        _patientRepository = patientRepository;
        _httpClient = httpClient;
        _mapper = mapper;
        _externalApiBaseUrl = configuration["ExternalApi:BaseUrl"]!;
    }

    public async Task<int?> IsExistingPatientAsync(string ssn, CancellationToken cancellationToken = default)
    {
        return await _patientRepository.IsExistingPatientAsync(ssn, cancellationToken);
    }

    public async Task<PatientDto?> GetPatientAsync(int id, CancellationToken cancellationToken = default)
    {
        var patient = await _patientRepository.GetPatientDetailAsync(id, cancellationToken);
        return _mapper.Map<PatientDto>(patient);
    }

    public async Task<int> RegisterPatientAsync(PatientDto patientDto, CancellationToken cancellationToken = default)
    {
        var patient = _mapper.Map<PatientDetail>(patientDto);
        patient.CreatedAt = DateTime.UtcNow;
        patient.UpdatedAt = DateTime.UtcNow;

        return await _patientRepository.AddPatientAsync(patient, cancellationToken);
    }

    public async Task SyncLabVisitsAsync(string ssn, int patientId, string token, CancellationToken cancellationToken = default)
    {
        var visitRequest = new HttpRequestMessage(HttpMethod.Get, $"{_externalApiBaseUrl}/patient-lab-visits?SSN={ssn}");
        visitRequest.Headers.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);

        var visitResponse = await _httpClient.SendAsync(visitRequest, cancellationToken);
        visitResponse.EnsureSuccessStatusCode();

        var visits = await visitResponse.Content.ReadAsStringAsync(cancellationToken);
        var labVisits = JsonSerializer.Deserialize<List<LabVisitDto>>(visits, JsonOptions) ?? new();

        var labVisitEntities = new List<PatientLabVisit>();

        foreach (var visit in labVisits)
        {
            var labVisitEntity = new PatientLabVisit
            {
                PatientId = patientId,
                LabName = visit.LabName,
                LabTestRequest = visit.LabTestRequest,
                CreatedAt = DateTime.UtcNow,
                UpdatedAt = DateTime.UtcNow
            };

            var resultRequest = new HttpRequestMessage(HttpMethod.Get, $"{_externalApiBaseUrl}/Patient-lab-results?lab_visit_id={visit.Id}");
            resultRequest.Headers.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);

            var resultResponse = await _httpClient.SendAsync(resultRequest, cancellationToken);
            resultResponse.EnsureSuccessStatusCode();

            var labResults = JsonSerializer.Deserialize<List<LabResultDto>>(await resultResponse.Content.ReadAsStringAsync(cancellationToken), JsonOptions) ?? new();

            foreach (var result in labResults)
            {
                labVisitEntity.LabResults.Add(new PatientLabResult
                {
                    LabVisit = labVisitEntity,
                    TestName = result.TestName,
                    TestResult = result.TestResult,
                    TestObservation = result.TestObservation,
                    CreatedAt = DateTime.UtcNow,
                    UpdatedAt = DateTime.UtcNow
                });
            }

            labVisitEntities.Add(labVisitEntity);
        }

        await _patientRepository.AddPatientLabVisitsAsync(labVisitEntities, cancellationToken);
    }

    public async Task SyncMedicationsAsync(string ssn, int patientId, string token, CancellationToken cancellationToken = default)
    {
        var request = new HttpRequestMessage(HttpMethod.Get, $"{_externalApiBaseUrl}/patient-medications?SSN={ssn}");
        request.Headers.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);

        var response = await _httpClient.SendAsync(request, cancellationToken);
        response.EnsureSuccessStatusCode();

        var medications = JsonSerializer.Deserialize<List<PatientMedication>>(await response.Content.ReadAsStringAsync(cancellationToken), JsonOptions) ?? new();

        foreach (var med in medications)
        {
            med.PatientId = patientId;
            med.CreatedAt = DateTime.UtcNow;
            med.UpdatedAt = DateTime.UtcNow;
        }

        await _patientRepository.AddPatientMedicationsAsync(medications, cancellationToken);
    }

    public async Task SyncVaccinationsAsync(string ssn, int patientId, string token, CancellationToken cancellationToken = default)
    {
        var request = new HttpRequestMessage(HttpMethod.Get, $"{_externalApiBaseUrl}/patient-vaccinations?SSN={ssn}");
        request.Headers.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);

        var response = await _httpClient.SendAsync(request, cancellationToken);
        response.EnsureSuccessStatusCode();

        var vaccinations = JsonSerializer.Deserialize<List<PatientVaccinationRecord>>(await response.Content.ReadAsStringAsync(cancellationToken), JsonOptions) ?? new();

        foreach (var vacc in vaccinations)
        {
            vacc.PatientId = patientId;
            vacc.CreatedAt = DateTime.UtcNow;
            vacc.UpdatedAt = DateTime.UtcNow;
        }

        await _patientRepository.AddPatientVaccinationsAsync(vaccinations, cancellationToken);
    }
}
