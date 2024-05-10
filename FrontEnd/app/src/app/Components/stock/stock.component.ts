import { CommonModule } from '@angular/common';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { NavbarComponent } from '../navbar/navbar.component';
import { Router } from '@angular/router';

@Component({
  selector: 'app-stock',
  standalone: true,
  imports: [CommonModule, FormsModule, HttpClientModule, NavbarComponent],
  templateUrl: './stock.component.html',
  styleUrl: './stock.component.css',
})
export class StockComponent {
  stockList: any[] = [];
  constructor(private http: HttpClient, private route: Router) {}
  ngOnInit() {
    const JwtToken = sessionStorage.getItem('JwtToken');
    if (JwtToken == null) {
      this.route.navigate(['']);
    } else {
      this.getStock();
    }
  }
  getStock() {
    this.http
      .get('https://localhost:7118/api/Inventory/GetAllStock')
      .subscribe((res: any) => {
        console.log(res);
        this.stockList = res;
      });
  }
  logout() {
    sessionStorage.removeItem('JwtToken');
    this.route.navigate(['']);
  }
}
