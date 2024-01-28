import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class AccountService {
  private basseUrl = 'https://localhost:5001/api/';
  private loginUrl = this.basseUrl + 'account/login';

  constructor(private httpClient: HttpClient) {}

  login(model: any) {
    return this.httpClient.post(this.loginUrl, model);
  }
  
}
