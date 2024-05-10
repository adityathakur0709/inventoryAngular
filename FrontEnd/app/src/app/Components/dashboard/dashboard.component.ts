import { Component } from '@angular/core';
import { NavbarComponent } from '../navbar/navbar.component';
import { Router, RouterModule } from '@angular/router';

@Component({
  selector: 'app-dashboard',
  standalone: true,
  imports: [NavbarComponent, RouterModule],
  templateUrl: './dashboard.component.html',
  styleUrl: './dashboard.component.css',
})
export class DashboardComponent {
  constructor(private route: Router) {}
  // ngOnInit() {
  //   const JwtToken = sessionStorage.getItem('JwtToken');
  //   if (JwtToken == null) {
  //     this.route.navigate(['']);
  //   }
  // }
  // logout() {
  //   sessionStorage.removeItem('JwtToken');
  //   this.route.navigate(['']);
  // }
}
