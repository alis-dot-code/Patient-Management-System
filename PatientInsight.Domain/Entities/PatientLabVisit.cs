namespace PatientInsight.Domain.Entities;

public partial class PatientLabVisit
{
    public int Id { get; set; }
    public int? PatientId { get; set; }
    public string? LabName { get; set; }
    public string? LabTestRequest { get; set; }
    public string? ResultDate { get; set; }
    public DateTime? CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }
    public List<PatientLabResult> LabResults { get; set; } = new();
}
