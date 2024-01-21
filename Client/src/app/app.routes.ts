import { Routes } from '@angular/router';
import { LoginComponent } from './_pages/login/login.component';
import { LayoutComponent } from './_pages/layout/layout.component';
import { HomeComponent } from './_pages/home/home.component';

export const routes: Routes = [
  { path: '', redirectTo: 'login', pathMatch: 'full' },
  { path: 'login', component: LoginComponent },
  {
    path: '',
    component: LayoutComponent,
    children: [
      {
        path: 'dashboard',
        component: HomeComponent,
      },
    ],
  },
];
