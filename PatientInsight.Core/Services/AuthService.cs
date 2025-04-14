using Microsoft.Extensions.Configuration;
using PatientInsight.Core.Interfaces;
using PatientInsight.Domain.Entities;
using System.Text;
using System.Text.Json;

namespace PatientInsight.Core.Services;

public class AuthService : IAuthService
{
    private readonly HttpClient _httpClient;
    private readonly IConfiguration _configuration;

    public AuthService(HttpClient httpClient, IConfiguration configuration)
    {
        _httpClient = httpClient;
        _configuration = configuration;
    }

    public async Task<string> GetAuthTokenAsync(CancellationToken cancellationToken = default)
    {
        var baseUrl = _configuration["ExternalApi:BaseUrl"];
        var authData = new
        {
            identifier = _configuration["Auth:Identifier"],
            password = _configuration["Auth:Password"]
        };

        var content = new StringContent(JsonSerializer.Serialize(authData), Encoding.UTF8, "application/json");
        var response = await _httpClient.PostAsync($"{baseUrl}/auth/local", content, cancellationToken);

        response.EnsureSuccessStatusCode();

        var jsonResponse = await response.Content.ReadAsStringAsync(cancellationToken);
        var authResponse = JsonSerializer.Deserialize<AuthResponse>(jsonResponse);

        return authResponse!.jwt;
    }
}
