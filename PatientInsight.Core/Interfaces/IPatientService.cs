using PatientInsight.Domain.DTOs;

namespace PatientInsight.Core.Interfaces;

public interface IPatientService
{
    Task<int?> IsExistingPatientAsync(string ssn, CancellationToken cancellationToken = default);
    Task<PatientDto?> GetPatientAsync(int id, CancellationToken cancellationToken = default);
    Task<int> RegisterPatientAsync(PatientDto patientDto, CancellationToken cancellationToken = default);
    Task SyncLabVisitsAsync(string ssn, int patientId, string token, CancellationToken cancellationToken = default);
    Task SyncMedicationsAsync(string ssn, int patientId, string token, CancellationToken cancellationToken = default);
    Task SyncVaccinationsAsync(string ssn, int patientId, string token, CancellationToken cancellationToken = default);
}
