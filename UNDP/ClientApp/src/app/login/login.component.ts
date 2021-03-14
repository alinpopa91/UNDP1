import { Component, Inject, OnInit } from '@angular/core';
import { FormGroup, FormControl, FormBuilder, Validators } from '@angular/forms';
import { HttpParams, HttpClient, HttpErrorResponse, HttpHeaders } from '@angular/common/http';
import { Router } from '@angular/router';

@Component({
  selector: 'login-component',
  templateUrl: './login.component.html'
})
export class LoginComponent implements OnInit {
  public loginUrl: string;
  loginForm: FormGroup;
  formBuilder: FormBuilder;
  username: string;
  password: string;
  _http: HttpClient;

  constructor(http: HttpClient, @Inject('BASE_URL') baseUrl: string, private router: Router) {
    this.loginUrl = baseUrl + "api/login";
    this._http = http;
  }

  ngOnInit() {
    this.loginForm = new FormGroup({
      username: new FormControl(),
      password: new FormControl()
    });

    // get return url from route parameters or default to '/'
    //this.returnUrl = this.route.snapshot.queryParams['returnUrl'] || '/';
  }

  onSubmit() {
    this.username = this.loginForm.controls['username'].value;
    this.password = this.loginForm.controls['password'].value;

    const headers = { 'content-type': 'application/json' }
    const body = this.loginForm.value;

    this._http.post(this.loginUrl, body, { 'headers': headers }).subscribe(
      data => this.router.navigate(['/']),
      error => alert('Error')
    );

  }

}
