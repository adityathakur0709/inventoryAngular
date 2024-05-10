import { CommonModule } from '@angular/common';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { NavbarComponent } from '../navbar/navbar.component';

@Component({
  selector: 'app-purchase',
  standalone: true,
  imports: [
    CommonModule,
    HttpClientModule,
    FormsModule,
    RouterLink,
    NavbarComponent,
  ],
  templateUrl: './purchase.component.html',
  styleUrl: './purchase.component.css',
})
export class PurchaseComponent {
  purchaseObj: any = {
    purchaseId: 0,
    purchaseDate: '2024-05-09T16:34:00.404Z',
    productId: 0,
    quantity: 0,
    supplierName: '',
    invoiceAmt: 0,
    invoiceNo: '',
  };
  productList: any[] = [];
  constructor(private http: HttpClient, private route: Router) {}
  ngOnInit(): void {
    this.getAllProduct();
  }
  getAllProduct() {
    this.http
      .get('https://localhost:7118/api/Inventory/GetAllProducts')
      .subscribe((res: any) => {
        this.productList = res;
      });
  }
  onSave() {
    this.http
      .post(
        'https://localhost:7118/api/Inventory/CreateNewPurchase',
        this.purchaseObj
      )
      .subscribe(
        (res: any) => {
          console.log(res);
          if (res || res.result) {
            alert('Purchase Success');
          } else {
            alert('Purchase error');
          }
        },
        (error) => {
          alert('api error' + error.message);
        }
      );
  }
}
