import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { Router, RouterModule } from '@angular/router';
import { AccountService } from '../../_services/account-service.service';
import { FormsModule } from '@angular/forms';
import { Accountdto } from './accountdto';
import { map } from 'rxjs';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [RouterModule, CommonModule, FormsModule],
  templateUrl: './login.component.html',
  styleUrl: './login.component.scss',
})
export class LoginComponent {
  loginform = true;
  recoverform = false;
  model: any = {};

  constructor(private accountService: AccountService, private router: Router) {
    this.model.username = "noufil"
    this.model.password = "P@$$w0rd"
  }

  showRecoverForm() {
    this.loginform = !this.loginform;
    this.recoverform = !this.recoverform;
  }

  login() {
    this.accountService.login(this.model).subscribe({
      next: (response) => {
        console.log(response);        
        this.router.navigateByUrl('Home');
      },
      error: (err) => console.log(err),
    });
  }
}
