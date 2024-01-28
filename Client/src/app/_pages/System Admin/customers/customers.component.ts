import { CommonModule, DatePipe } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import {
  FormsModule,
  ReactiveFormsModule,
  FormGroup,
  FormControl,
  UntypedFormGroup,
  UntypedFormBuilder,
  FormBuilder,
  Validators,
  AbstractControl,
} from '@angular/forms';
import { NgbPaginationModule, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { FeatherModule } from 'angular-feather';

import Validation from '../../../_components/form-validation/validation';
import { CustomerService } from '../../../_services/customer-service.service';
import { Customer } from './customer';



@Component({
  selector: 'app-customers',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    NgbPaginationModule,
    FeatherModule,
  ],
  templateUrl: './customers.component.html',
  styleUrl: './customers.component.scss'
})
export class CustomersComponent implements OnInit {
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
  editCustomer: UntypedFormGroup | any;

  constructor(
    private customerService: CustomerService,
    private fb: UntypedFormBuilder,
    private modalService: NgbModal,
    private datePipe: DatePipe,
    private formBuilder: FormBuilder
  ) {
    this.filterArray = this.customerList;
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

  customerList: Customer[] = this.customerService.getcustomers();
  config: any;
  //editUser: FormGroup | null = null;
  customerDetail: Customer | null = null;

  filterArray: Customer[] | null = null;

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

    this.editCustomer = this.fb.group({
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
    return this.customerList.filter(
      (x) =>
        x.Name.toLowerCase().indexOf(v.toLowerCase()) !== -1 ||
        x.Email.toLowerCase().indexOf(v.toLowerCase()) !== -1
    );
  }

  deleteCustomer(id: number): void {
    if (this.filterArray) {
      this.filterArray = this.filterArray.filter(
        (customer) => customer.id !== id
      );
    }
  }

  openModal(editCustomerModal: any, customer: Customer | null) {
    this.modalService.open(editCustomerModal, {
      centered: true,
      backdrop: 'static',
    });

    if (customer != null) {
      if (customer.DateOfJoining) {
        this.joiningDate = this.datePipe.transform(
          new Date(customer.DateOfJoining),
          'yyyy-MM-dd'
        );
      }
      this.customerDetail = customer;
      this.editCustomer?.patchValue({
        Name: customer.Name,
        Position: customer.Position,
        Email: customer.Email,
        Mobile: customer.Mobile,
        DateOfJoining: customer.DateOfJoining,
        Salary: customer.Salary,
        Projects: customer.Projects,
      });
    }
  }

  onSubmit() {
    //this.submitted = true;

    if (this.customerDetail != null) {
      const index = this.customerService
        .getcustomers()
        .indexOf(this.customerDetail);

      if (this.editCustomer != null) {
        this.customerDetail.Name = this.editCustomer.get('Name')?.value;
        this.customerDetail.Position = this.editCustomer.get('Position')?.value;
        this.customerDetail.Email = this.editCustomer.get('Email')?.value;
        this.customerDetail.Mobile = this.editCustomer.get('Mobile')?.value;
        this.customerDetail.DateOfJoining =
          this.editCustomer.get('DateOfJoining')?.value;
        this.customerDetail.Salary = this.editCustomer.get('Salary')?.value;
        this.customerDetail.Projects = this.editCustomer.get('Projects')?.value;
      }

      this.customerService.getcustomers()[index] = this.customerDetail;
    } else {
      this.customerDetail = new Customer();

      this.customerDetail.id =
        Math.max.apply(
          Math,
          this.customerService.getcustomers().map(function (o) {
            return o.id;
          })
        ) + 1;

      this.customerDetail.Name = this.editCustomer?.get('Name')?.value;
      this.customerDetail.Position = this.editCustomer?.get('Position')?.value;
      this.customerDetail.Email = this.editCustomer?.get('Email')?.value;
      this.customerDetail.Mobile = this.editCustomer?.get('Mobile')?.value;
      this.customerDetail.DateOfJoining = new Date();
      this.customerDetail.Salary = this.editCustomer?.get('Salary')?.value;
      this.customerDetail.Projects = this.editCustomer?.get('Projects')?.value;
      this.customerDetail.imagePath = 'assets/images/users/user3.jpg';
      this.filterArray?.push(this.customerDetail);
    }
    this.modalService.dismissAll();
    this.customerDetail = null;

    this.joiningDate = '';
    this.ngOnInit();
  }

  closeBtnClick() {
    this.modalService.dismissAll();
    this.ngOnInit();
  }
}

