import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './login.component.html',
  styleUrl: './login.component.css'
})
export class LoginComponent {
  loginObj : loginDto;

  constructor(private router: Router){
    this.loginObj = new loginDto();
  }

  login(){    
    this.router.navigateByUrl('dashboard');
  }
}

class loginDto {
  username : string;
  password: string;

  constructor(){
    this.username = '';
    this.password = ''
  }


}