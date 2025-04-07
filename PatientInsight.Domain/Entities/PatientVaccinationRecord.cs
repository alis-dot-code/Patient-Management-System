namespace PatientInsight.Domain.Entities;

public partial class PatientVaccinationRecord
{
    public int Id { get; set; }
    public int? PatientId { get; set; }
    public string? VaccineName { get; set; }
    public DateTime? VaccineDate { get; set; }
    public string? VaccineValidity { get; set; }
    public string? AdministeredBy { get; set; }
    public DateTime? CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }
}
