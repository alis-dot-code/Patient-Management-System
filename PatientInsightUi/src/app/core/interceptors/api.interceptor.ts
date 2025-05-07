import { HttpErrorResponse, HttpInterceptorFn } from '@angular/common/http';
import { catchError, throwError } from 'rxjs';

export const apiInterceptor: HttpInterceptorFn = (req, next) => {
  const clonedRequest = req.clone({
    headers: req.headers.set('Accept', 'application/json')
  });

  return next(clonedRequest).pipe(
    catchError((error: HttpErrorResponse) => {
      // Handles RFC 7807 ProblemDetails returned by our GlobalExceptionMiddleware
      console.error('[API Error]:', error.error?.title || error.message);
      
      // We can later inject a Snackbar service here for global user feedback
      return throwError(() => error);
    })
  );
};
