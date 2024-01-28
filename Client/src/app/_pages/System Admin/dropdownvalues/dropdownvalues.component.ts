import { Component, OnInit } from '@angular/core';
import { DropdownService } from '../../../_services/dropdown-service.service';
import {
  UntypedFormBuilder,
  UntypedFormGroup,
  Validators,
  AbstractControl,
  FormBuilder,
  FormGroup,
  FormControl,
  FormsModule,
  ReactiveFormsModule
} from '@angular/forms';
import { CommonModule, DatePipe } from '@angular/common';
import { NgbModal, NgbPaginationModule } from '@ng-bootstrap/ng-bootstrap';
import { Dropdown } from './dropdown';

import { FeatherModule } from 'angular-feather';
import Validation from '../../../_components/form-validation/validation';


@Component({
  selector: 'app-dropdownvalues',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    NgbPaginationModule,
    FeatherModule,
  ],
  templateUrl: './dropdownvalues.component.html',
  styleUrl: './dropdownvalues.component.scss'
})
export class DropdownvaluesComponent implements OnInit {
  // 2
  
  form: FormGroup = new FormGroup({
    Name: new FormControl(''),
    Position: new FormControl(''),
    Email: new FormControl(''),
    Mobile: new FormControl(''),
    DateOfJoining: new FormControl(''),
    Salary: new FormControl(''),
    Projects: new FormControl(''),
  });
  submitted = false;
  editDropdown: UntypedFormGroup | any;

  constructor(
    private dropdownService: DropdownService,
    private fb: UntypedFormBuilder,
    private modalService: NgbModal,
    private datePipe: DatePipe,
    private formBuilder: FormBuilder
  ) {
    this.filterArray = this.dropdownList;
  }
  get searchTerm(): string {
    return this._searchTerm;
  }
  set searchTerm(val: string) {
    this._searchTerm = val;
    this.filterArray = this.filter(val);
  }
  page = 1;
  pageSize = 7;

  dropdownList: Dropdown[] = this.dropdownService.getdropdown();
  config: any;
  //editUser: FormGroup | null = null;
  dropdownDetail: Dropdown | null = null;

  filterArray: Dropdown[] | null = null;

  joiningDate: string | null = null;

  _searchTerm = '';

  ngOnInit() {
    this.form = this.formBuilder.group(
      {
        Name: ['', Validators.required],
        Position: ['', Validators.required],
        DateOfJoining: ['', Validators.required],
        Salary: ['', Validators.required],
        Projects: ['', Validators.required],
        Mobile: [
          '',
          [
            Validators.required,
            Validators.minLength(10),
            Validators.maxLength(10),
          ],
        ],
        Email: ['', [Validators.required, Validators.email]],
      },
      {
        validators: [Validation.match('password', 'confirmPassword')],
      }
    );

    this.editDropdown = this.fb.group({
      id: [''],
      Name: ['', Validators.required],
      Position: ['', Validators.required],
      Email: ['', Validators.required],
      Mobile: ['', Validators.required],
      DateOfJoining: ['', Validators.required],
      Salary: ['', Validators.required],
      Projects: ['', Validators.required],
    });
  }

  get f(): { [key: string]: AbstractControl } {
    return this.form.controls;
  }

  filter(v: any) {
    return this.dropdownList.filter(
      (x) =>
        x.Name.toLowerCase().indexOf(v.toLowerCase()) !== -1 ||
        x.Email.toLowerCase().indexOf(v.toLowerCase()) !== -1
    );
  }

  deleteDropdown(id: number): void {
    if (this.filterArray) {
      this.filterArray = this.filterArray.filter((dropdown) => dropdown.id !== id);
    }
  }

  openModal(editdropdownModal: any, dropdown: Dropdown | null) {
    this.modalService.open(editdropdownModal, {
      centered: true,
      backdrop: 'static',
    });

    if (dropdown != null) {
      if (dropdown.DateOfJoining) {
        this.joiningDate = this.datePipe.transform(
          new Date(dropdown.DateOfJoining),
          'yyyy-MM-dd'
        );
      }
      this.dropdownDetail = dropdown;
      this.editDropdown?.patchValue({
        Name: dropdown.Name,
        Position: dropdown.Position,
        Email: dropdown.Email,
        Mobile: dropdown.Mobile,
        DateOfJoining: dropdown.DateOfJoining,
        Salary: dropdown.Salary,
        Projects: dropdown.Projects,
      });
    }
  }

  onSubmit() {
    //this.submitted = true;

    if (this.dropdownDetail != null) {
      const index = this.dropdownService.getdropdown().indexOf(this.dropdownDetail);

      if (this.editDropdown != null) {
        this.dropdownDetail.Name = this.editDropdown.get('Name')?.value;
        this.dropdownDetail.Position = this.editDropdown.get('Position')?.value;
        this.dropdownDetail.Email = this.editDropdown.get('Email')?.value;
        this.dropdownDetail.Mobile = this.editDropdown.get('Mobile')?.value;
        this.dropdownDetail.DateOfJoining =
          this.editDropdown.get('DateOfJoining')?.value;
        this.dropdownDetail.Salary = this.editDropdown.get('Salary')?.value;
        this.dropdownDetail.Projects = this.editDropdown.get('Projects')?.value;
      }

      this.dropdownService.getdropdown()[index] = this.dropdownDetail;
    } else {
      this.dropdownDetail = new Dropdown();

      this.dropdownDetail.id =
        Math.max.apply(
          Math,
          this.dropdownService.getdropdown().map(function (o) {
            return o.id;
          })
        ) + 1;

      this.dropdownDetail.Name = this.editDropdown?.get('Name')?.value;
      this.dropdownDetail.Position = this.editDropdown?.get('Position')?.value;
      this.dropdownDetail.Email = this.editDropdown?.get('Email')?.value;
      this.dropdownDetail.Mobile = this.editDropdown?.get('Mobile')?.value;
      this.dropdownDetail.DateOfJoining = new Date();
      this.dropdownDetail.Salary = this.editDropdown?.get('Salary')?.value;
      this.dropdownDetail.Projects = this.editDropdown?.get('Projects')?.value;
      this.dropdownDetail.imagePath = '../assets/images/users/user3.jpg';
      this.filterArray?.push(this.dropdownDetail);
    }
    this.modalService.dismissAll();
    this.dropdownDetail = null;

    this.joiningDate = '';
    this.ngOnInit();
  }

  closeBtnClick() {
    this.modalService.dismissAll();
    this.ngOnInit();
  }
}

