import { Component, OnInit } from '@angular/core';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { NavbarComponent } from '../navbar/navbar.component';

// interface Purchase {
//   invoiceAmt: number;
//   invoiceNo: string;
//   productId: number;
//   purchaseDate: Date;
//   purchaseId: number;
//   quantity: number;
//   supplierName: string;
//   productName: string;
// }

@Component({
  selector: 'app-purchase-list',
  standalone: true,
  imports: [
    HttpClientModule,
    CommonModule,
    FormsModule,
    RouterLink,
    NavbarComponent,
  ],
  templateUrl: './purchase-list.component.html',
  styleUrls: ['./purchase-list.component.css'],
})
export class PurchaseListComponent implements OnInit {
  purchaseList: any[] = [];

  constructor(private http: HttpClient, private route: Router) {}

  ngOnInit(): void {
    const JwtToken = sessionStorage.getItem('JwtToken');

    if (JwtToken == null) {
      this.route.navigate(['']);
    } else {
      this.loadPurchase();
    }
  }

  loadPurchase() {
    this.http
      .get('https://localhost:7118/api/Inventory/GetAllPurchase')
      .subscribe((res: any) => {
        this.purchaseList = res;
        console.log('Purchase List:', this.purchaseList);
      });
  }
}
