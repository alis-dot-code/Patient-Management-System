namespace PatientInsight.Domain.DTOs;

public class PatientDto
{
    public int? Id { get; set; }
    public string FirstName { get; set; } = null!;
    public string? MiddleName { get; set; }
    public string LastName { get; set; } = null!;
    public DateTime? Dob { get; set; }
    public string Ssn { get; set; } = null!;
    public string? Address { get; set; }
    public string? City { get; set; }
    public string? Zip { get; set; }
    public string? State { get; set; }
}
