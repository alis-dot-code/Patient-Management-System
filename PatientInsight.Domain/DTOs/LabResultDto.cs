namespace PatientInsight.Domain.DTOs;

public class LabResultDto
{
    public int LabVisitId { get; set; }
    public string TestName { get; set; } = null!;
    public string TestResult { get; set; } = null!;
    public string? TestObservation { get; set; }
    public List<string>? Attachments { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime UpdatedAt { get; set; }
}
