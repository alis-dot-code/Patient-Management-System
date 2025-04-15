using AutoMapper;
using PatientInsight.Domain.DTOs;
using PatientInsight.Domain.Entities;

namespace PatientInsight.Api.Mappings;

public class MappingProfile : Profile
{
    public MappingProfile()
    {
        CreateMap<PatientDetail, PatientDto>().ReverseMap();
    }
}
