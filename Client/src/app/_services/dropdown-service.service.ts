import { Injectable } from '@angular/core';
import { Dropdown } from '../_pages/System Admin/dropdownvalues/dropdown';
import { dropdowns } from '../_pages/System Admin/dropdownvalues/dropdown-data';


@Injectable({
  providedIn: 'root'
})
export class DropdownService {

  public dropdowns: Dropdown[] = dropdowns;

  public getdropdown() {
    return this.dropdowns;
  }
}
