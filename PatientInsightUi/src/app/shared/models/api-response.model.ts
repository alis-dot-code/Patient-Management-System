export interface ApiResponse<T> {
  data: T | null;
  success: boolean;
  errorMessage: string | null;
}
