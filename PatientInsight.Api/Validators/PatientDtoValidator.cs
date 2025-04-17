using FluentValidation;
using PatientInsight.Domain.DTOs;

namespace PatientInsight.Api.Validators;

public class PatientDtoValidator : AbstractValidator<PatientDto>
{
    public PatientDtoValidator()
    {
        RuleFor(x => x.FirstName).NotEmpty();
        RuleFor(x => x.LastName).NotEmpty();
        RuleFor(x => x.Ssn).NotEmpty().Matches(@"^\d{3}-\d{2}-\d{4}$").WithMessage("SSN must match XXX-XX-XXXX format");
    }
}
