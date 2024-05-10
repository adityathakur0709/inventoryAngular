import { CommonModule } from '@angular/common';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { NavbarComponent } from '../navbar/navbar.component';

@Component({
  selector: 'app-sale-list',
  standalone: true,
  imports: [
    RouterLink,
    CommonModule,
    FormsModule,
    HttpClientModule,
    NavbarComponent,
  ],
  templateUrl: './sale-list.component.html',
  styleUrl: './sale-list.component.css',
})
export class SaleListComponent {
  saleList: any[] = [];

  constructor(private http: HttpClient, private route: Router) {}

  ngOnInit(): void {
    const JwtToken = sessionStorage.getItem('JwtToken');
    if (JwtToken == null) {
      this.route.navigate(['']);
    } else {
      this.loadSales();
    }
  }

  loadSales() {
    this.http
      .get('https://localhost:7118/api/Inventory/GetAllSale')
      .subscribe((res: any) => {
        this.saleList = res;
        console.log('Purchase List:', this.saleList);
      });
  }
}
