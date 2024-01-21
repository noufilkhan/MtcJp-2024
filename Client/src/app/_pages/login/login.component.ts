import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Constant } from 'src/app/_constant/constant';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  loginModel : any = {
    username : "",
    password : ""
  };
  
  constructor(private router: Router){
  }
  ngOnInit(): void {
    var username = localStorage.getItem(Constant.localStorage_username);
    if (username != null)
      this.router.navigateByUrl("/Home");
  }
  
  login(){
    //debugger;
    localStorage.setItem(Constant.localStorage_username,this.loginModel.username);
    localStorage.setItem(Constant.localStorage_password,this.loginModel.password);
    this.router.navigateByUrl("/Home");
  }
}
