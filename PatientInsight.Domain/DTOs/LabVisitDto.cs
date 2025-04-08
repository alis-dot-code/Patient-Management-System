namespace PatientInsight.Domain.DTOs;

public class LabVisitDto
{
    public int Id { get; set; }
    public string Ssn { get; set; } = null!;
    public string LabName { get; set; } = null!;
    public string LabTestRequest { get; set; } = null!;
    public DateTime CollectionDate { get; set; }
    public DateTime ResultDate { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime UpdatedAt { get; set; }
}
