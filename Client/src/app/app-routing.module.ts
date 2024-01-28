import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { FullComponent } from './layouts/full/full.component';
import { LoginComponent } from './_pages/login/login.component';
import { DashboardComponent } from './_pages/dashboard/dashboard.component';
import { ConsigneesComponent } from './_pages/System Admin/consignees/consignees.component';
import { CustomersComponent } from './_pages/System Admin/customers/customers.component';
import { DropdownvaluesComponent } from './_pages/System Admin/dropdownvalues/dropdownvalues.component';
import { UsersComponent } from './_pages/System Admin/users/users.component';
import { authGuard } from './_guards/auth.guard';

export const Approutes: Routes = [
  { path: '', redirectTo: 'login', pathMatch: 'full' },
  { path: 'login', component: LoginComponent },
  {
    path: 'Home',
    component: FullComponent,
    children: [{ path: '', component: DashboardComponent }],
    canActivate: [authGuard],
  },
  {
    path: 'Admin',
    component: FullComponent,
    canActivate: [authGuard],
    children: [
      { path: '', redirectTo: 'Users', pathMatch: 'full' },
      { path: 'Users', component: UsersComponent },
      { path: 'Dropdown', component: DropdownvaluesComponent },
      { path: 'Customers', component: CustomersComponent },
      { path: 'Consignee', component: ConsigneesComponent },
    ],
  },
];

@NgModule({
  imports: [RouterModule.forRoot(Approutes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
