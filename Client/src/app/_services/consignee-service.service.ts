import { Injectable } from '@angular/core';
import { Consignee } from '../_pages/System Admin/consignees/consignee';
import { consignees } from '../_pages/System Admin/consignees/consignee-data';

@Injectable({
  providedIn: 'root'
})
export class ConsigneeService {

  public consignees: Consignee[] = consignees;

  public getconsignees() {
    return this.consignees;
  }
}
