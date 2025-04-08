namespace PatientInsight.Domain.DTOs;

public class ApiResponse<T>
{
    public T? Data { get; set; }
    public bool Success { get; set; }
    public string? ErrorMessage { get; set; }

    public static ApiResponse<T> Ok(T data) => new() { Data = data, Success = true };
    public static ApiResponse<T> Fail(string error) => new() { ErrorMessage = error, Success = false };
}
