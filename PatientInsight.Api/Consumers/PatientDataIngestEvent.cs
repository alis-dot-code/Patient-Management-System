namespace PatientInsight.Api.Consumers;

public class PatientDataIngestEvent
{
    public int PatientId { get; set; }
    public string Ssn { get; set; } = null!;
    public DateTime OccurredAt { get; set; }
}
