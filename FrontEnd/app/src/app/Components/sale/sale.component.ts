import { CommonModule } from '@angular/common';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { NavbarComponent } from '../navbar/navbar.component';

@Component({
  selector: 'app-sale',
  standalone: true,
  imports: [
    CommonModule,
    HttpClientModule,
    FormsModule,
    RouterLink,
    NavbarComponent,
  ],
  templateUrl: './sale.component.html',
  styleUrl: './sale.component.css',
})
export class SaleComponent {
  saleObj: any = {
    salesId: 0,
    invoiceNo: '',
    customerName: '',
    mobileNo: 0,
    saledate: '2024-05-09T18:06:45.093Z',
    productId: 0,
    quantity: 0,
    totalAmt: 0,
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
      .post('https://localhost:7118/api/Inventory/CreateNewSale', this.saleObj)
      .subscribe(
        (res: any) => {
          console.log(res);

          if (res) {
            alert('Sale Success');
          }
        },
        (error) => {
          alert('api error' + error.message);
        }
      );
  }
  checkStock() {
    this.http
      .get(
        'https://localhost:7118/api/Inventory/checkStockByProductId?productId=' +
          this.saleObj.productId
      )
      .subscribe((res: any) => {
        if (!res) {
          alert('Not available');
          this.saleObj.productId = 0;
        }
      });
  }
}
