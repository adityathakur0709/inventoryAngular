import { CommonModule } from '@angular/common';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-sign-up',
  standalone: true,
  imports: [CommonModule, FormsModule, HttpClientModule],
  templateUrl: './sign-up.component.html',
  styleUrl: './sign-up.component.css',
})
export class SignUpComponent {
  username: string = '';
  password: string = '';
  email: string = ' ';

  constructor(private http: HttpClient, private router: Router) {}
  ngOnInit() {
    var JwtToken = sessionStorage.getItem('JwtToken');
    if (JwtToken == null) {
      this.router.navigate(['Signup']);
    } else {
      this.router.navigate(['']);
    }
  }

  SignUp() {
    this.http
      .post<any>('https://localhost:7118/api/User/Register', {
        Name: this.username,
        password: this.password,
        email: this.email,
      })
      .subscribe((data) => {
        console.log('SignUp successful:', data);
        this.router.navigate(['']);
      });
  }
  signIn() {
    this.router.navigate(['']);
  }
}
