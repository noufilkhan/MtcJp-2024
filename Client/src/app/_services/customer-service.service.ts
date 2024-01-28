import { Injectable } from '@angular/core';

import { customers } from '../_pages/System Admin/customers/customers-data';
import { Customer } from '../_pages/System Admin/customers/customer';

@Injectable({
  providedIn: 'root'
})
export class CustomerService {

  public customers: Customer[] = customers;

  public getcustomers() {
    return this.customers;
  }
}
