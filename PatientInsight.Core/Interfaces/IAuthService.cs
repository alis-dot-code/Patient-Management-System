namespace PatientInsight.Core.Interfaces;

public interface IAuthService
{
    Task<string> GetAuthTokenAsync(CancellationToken cancellationToken = default);
}
