import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'Client';
  constructor(private router: Router){
  }

  submit(){
    console.log('clicked');
    this.router.navigateByUrl("Home");
  }
}
