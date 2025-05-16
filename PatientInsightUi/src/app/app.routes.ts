import { Routes } from '@angular/router';

export const routes: Routes = [
  { 
    path: 'patients', 
    loadChildren: () => import('./features/patients/patients.routes').then(m => m.PATIENT_ROUTES) 
  },
  { path: '', redirectTo: 'patients', pathMatch: 'full' }
];
