using Microsoft.EntityFrameworkCore;
using PatientInsight.Domain.Entities;
using PatientInsight.Infrastructure.Interfaces;
using PatientInsight.Infrastructure.Persistence;

namespace PatientInsight.Infrastructure.Repositories;

public class PatientRepository : IPatientRepository
{
    private readonly AppDbContext _context;

    public PatientRepository(AppDbContext context)
    {
        _context = context;
    }

    public async Task<int?> IsExistingPatientAsync(string ssn, CancellationToken cancellationToken = default)
    {
        return await _context.PatientDetails
            .Where(p => p.Ssn == ssn)
            .Select(p => (int?)p.Id)
            .FirstOrDefaultAsync(cancellationToken);
    }

    public async Task<PatientDetail?> GetPatientDetailAsync(int id, CancellationToken cancellationToken = default)
    {
        return await _context.PatientDetails.FindAsync(new object[] { id }, cancellationToken);
    }

    public async Task<int> AddPatientAsync(PatientDetail patient, CancellationToken cancellationToken = default)
    {
        _context.PatientDetails.Add(patient);
        await _context.SaveChangesAsync(cancellationToken);
        return patient.Id;
    }

    public async Task AddPatientLabVisitsAsync(IEnumerable<PatientLabVisit> labVisits, CancellationToken cancellationToken = default)
    {
        _context.PatientLabVisits.AddRange(labVisits);
        await _context.SaveChangesAsync(cancellationToken);
    }

    public async Task AddPatientLabResultsAsync(IEnumerable<PatientLabResult> labResults, CancellationToken cancellationToken = default)
    {
        _context.PatientLabResults.AddRange(labResults);
        await _context.SaveChangesAsync(cancellationToken);
    }

    public async Task AddPatientMedicationsAsync(IEnumerable<PatientMedication> medications, CancellationToken cancellationToken = default)
    {
        _context.PatientMedications.AddRange(medications);
        await _context.SaveChangesAsync(cancellationToken);
    }

    public async Task AddPatientVaccinationsAsync(IEnumerable<PatientVaccinationRecord> vaccinations, CancellationToken cancellationToken = default)
    {
        _context.PatientVaccinationRecords.AddRange(vaccinations);
        await _context.SaveChangesAsync(cancellationToken);
    }
}
