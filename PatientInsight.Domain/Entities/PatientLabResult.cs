using System.ComponentModel.DataAnnotations.Schema;

namespace PatientInsight.Domain.Entities;

public partial class PatientLabResult
{
    public int Id { get; set; }
    public int? LabVisitId { get; set; }
    public string? TestName { get; set; }
    public string? TestResult { get; set; }
    public string? TestObservation { get; set; }
    public string? Attachments { get; set; }
    public DateTime? CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }

    [ForeignKey("LabVisitId")]
    public PatientLabVisit LabVisit { get; set; } = null!;
}
