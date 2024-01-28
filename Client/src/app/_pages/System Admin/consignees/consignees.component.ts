import { Component, OnInit } from '@angular/core';
import { ConsigneeService } from '../../../_services/consignee-service.service';
import {
  UntypedFormBuilder,
  UntypedFormGroup,
  Validators,
  AbstractControl,
  FormBuilder,
  FormGroup,
  FormControl,
  FormsModule,
  ReactiveFormsModule,
} from '@angular/forms';
import { CommonModule, DatePipe } from '@angular/common';
import { NgbModal, NgbPaginationModule } from '@ng-bootstrap/ng-bootstrap';
import { FeatherModule } from 'angular-feather';
import Validation from '../../../_components/form-validation/validation';
import { Consignee } from './consignee';

@Component({
  selector: 'app-consignees',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    NgbPaginationModule,
    FeatherModule,
  ],
  templateUrl: './consignees.component.html',
  styleUrl: './consignees.component.scss'
})
export class ConsigneesComponent implements OnInit {
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
  editConsignee: UntypedFormGroup | any;

  constructor(
    private consigneeService: ConsigneeService,
    private fb: UntypedFormBuilder,
    private modalService: NgbModal,
    private datePipe: DatePipe,
    private formBuilder: FormBuilder
  ) {
    this.filterArray = this.consigneeList;
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

  consigneeList: Consignee[] = this.consigneeService.getconsignees();
  config: any;
  //editUser: FormGroup | null = null;
  consigneeDetail: Consignee | null = null;

  filterArray: Consignee[] | null = null;

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

    this.editConsignee = this.fb.group({
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
    return this.consigneeList.filter(
      (x) =>
        x.Name.toLowerCase().indexOf(v.toLowerCase()) !== -1 ||
        x.Email.toLowerCase().indexOf(v.toLowerCase()) !== -1
    );
  }

  deleteConsignee(id: number): void {
    if (this.filterArray) {
      this.filterArray = this.filterArray.filter(
        (consignee) => consignee.id !== id
      );
    }
  }

  openModal(editConsigneeModal: any, consignee: Consignee | null) {
    this.modalService.open(editConsigneeModal, {
      centered: true,
      backdrop: 'static',
    });

    if (consignee != null) {
      if (consignee.DateOfJoining) {
        this.joiningDate = this.datePipe.transform(
          new Date(consignee.DateOfJoining),
          'yyyy-MM-dd'
        );
      }
      this.consigneeDetail = consignee;
      this.editConsignee?.patchValue({
        Name: consignee.Name,
        Position: consignee.Position,
        Email: consignee.Email,
        Mobile: consignee.Mobile,
        DateOfJoining: consignee.DateOfJoining,
        Salary: consignee.Salary,
        Projects: consignee.Projects,
      });
    }
  }

  onSubmit() {
    //this.submitted = true;

    if (this.consigneeDetail != null) {
      const index = this.consigneeService
        .getconsignees()
        .indexOf(this.consigneeDetail);

      if (this.editConsignee != null) {
        this.consigneeDetail.Name = this.editConsignee.get('Name')?.value;
        this.consigneeDetail.Position =
          this.editConsignee.get('Position')?.value;
        this.consigneeDetail.Email = this.editConsignee.get('Email')?.value;
        this.consigneeDetail.Mobile = this.editConsignee.get('Mobile')?.value;
        this.consigneeDetail.DateOfJoining =
          this.editConsignee.get('DateOfJoining')?.value;
        this.consigneeDetail.Salary = this.editConsignee.get('Salary')?.value;
        this.consigneeDetail.Projects =
          this.editConsignee.get('Projects')?.value;
      }

      this.consigneeService.getconsignees()[index] = this.consigneeDetail;
    } else {
      this.consigneeDetail = new Consignee();

      this.consigneeDetail.id =
        Math.max.apply(
          Math,
          this.consigneeService.getconsignees().map(function (o) {
            return o.id;
          })
        ) + 1;

      this.consigneeDetail.Name = this.editConsignee?.get('Name')?.value;
      this.consigneeDetail.Position =
        this.editConsignee?.get('Position')?.value;
      this.consigneeDetail.Email = this.editConsignee?.get('Email')?.value;
      this.consigneeDetail.Mobile = this.editConsignee?.get('Mobile')?.value;
      this.consigneeDetail.DateOfJoining = new Date();
      this.consigneeDetail.Salary = this.editConsignee?.get('Salary')?.value;
      this.consigneeDetail.Projects =
        this.editConsignee?.get('Projects')?.value;
      this.consigneeDetail.imagePath = 'assets/images/users/user3.jpg';
      this.filterArray?.push(this.consigneeDetail);
    }
    this.modalService.dismissAll();
    this.consigneeDetail = null;

    this.joiningDate = '';
    this.ngOnInit();
  }

  closeBtnClick() {
    this.modalService.dismissAll();
    this.ngOnInit();
  }
}
