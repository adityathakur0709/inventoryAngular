import { CommonModule } from '@angular/common';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [CommonModule, FormsModule, HttpClientModule],
  templateUrl: './login.component.html',
  styleUrl: './login.component.css',
})
export class LoginComponent {
  constructor(private http: HttpClient, private router: Router) {}

  username: string = '';
  password: string = '';
  ngOnInit() {
    const JwtToken = sessionStorage.getItem('JwtToken');
    if (JwtToken != null) {
      this.router.navigate(['/stock']);
    }
  }
  SignIn() {
    this.http
      .post(
        'https://localhost:7118/api/User/Login',
        {
          Name: this.username,
          Password: this.password,
        },
        { responseType: 'text' }
      )
      .subscribe((data: string) => {
        console.log('login', data);
        sessionStorage.setItem('JwtToken', data);

        this.router.navigate(['stock']);
      });
  }
  Signup() {
    this.router.navigate(['Signup']);
  }
}
