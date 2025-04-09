using PatientInsight.Domain.Entities;
using PatientInsight.Infrastructure.Interfaces;

namespace PatientInsight.Infrastructure.Interfaces;

public interface IPatientRepository
{
    Task<int?> IsExistingPatientAsync(string ssn, CancellationToken cancellationToken = default);
    Task<PatientDetail?> GetPatientDetailAsync(int id, CancellationToken cancellationToken = default);
    Task<int> AddPatientAsync(PatientDetail patient, CancellationToken cancellationToken = default);
    Task AddPatientLabVisitsAsync(IEnumerable<PatientLabVisit> labVisits, CancellationToken cancellationToken = default);
    Task AddPatientLabResultsAsync(IEnumerable<PatientLabResult> labResults, CancellationToken cancellationToken = default);
    Task AddPatientMedicationsAsync(IEnumerable<PatientMedication> medications, CancellationToken cancellationToken = default);
    Task AddPatientVaccinationsAsync(IEnumerable<PatientVaccinationRecord> vaccinations, CancellationToken cancellationToken = default);
}
