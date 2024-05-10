import { Routes } from '@angular/router';
import { LoginComponent } from './Components/login/login.component';
import { SignUpComponent } from './Components/sign-up/sign-up.component';
import { DashboardComponent } from './Components/dashboard/dashboard.component';
import { PurchaseComponent } from './Components/purchase/purchase.component';
import { SaleComponent } from './Components/sale/sale.component';
import { PurchaseListComponent } from './Components/purchase-list/purchase-list.component';
import { SaleListComponent } from './Components/sale-list/sale-list.component';
import { StockComponent } from './Components/stock/stock.component';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';

export const routes: Routes = [
  {
    path: '',
    component: LoginComponent,
  },
  {
    path: 'Signup',
    component: SignUpComponent,
  },
  {
    path: 'dashboard',
    component: DashboardComponent,
  },
  {
    path: 'Purchase', //new purchase
    component: PurchaseComponent,
  },
  {
    path: 'Sale', //new sale
    component: SaleComponent,
  },
  {
    path: 'purchaseList',
    component: PurchaseListComponent,
  },
  {
    path: 'saleList',
    component: SaleListComponent,
  },
  {
    path: 'stock',
    component: StockComponent,
  },
];
