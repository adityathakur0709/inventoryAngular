﻿// <auto-generated />
using System;
using AngularApi.Model;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

#nullable disable

namespace AngularApi.Migrations
{
    [DbContext(typeof(dbContext))]
    [Migration("20240510095838_intial")]
    partial class intial
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "8.0.4")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("AngularApi.Model.User", b =>
                {
                    b.Property<int>("userId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("userId"));

                    b.Property<string>("Email")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Password")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("userId");

                    b.ToTable("users");
                });

            modelBuilder.Entity("AngularApi.Model.stockProduct", b =>
                {
                    b.Property<int>("productId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("productId"));

                    b.Property<double>("Price")
                        .HasColumnType("float");

                    b.Property<DateTime?>("createdDate")
                        .HasColumnType("datetime2");

                    b.Property<string>("productDetail")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("productName")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("userId")
                        .HasColumnType("int");

                    b.HasKey("productId");

                    b.ToTable("stockProducts");
                });

            modelBuilder.Entity("AngularApi.Model.stockPurchase", b =>
                {
                    b.Property<int>("purchaseId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("purchaseId"));

                    b.Property<double>("invoiceAmt")
                        .HasColumnType("float");

                    b.Property<string>("invoiceNo")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("productId")
                        .HasColumnType("int");

                    b.Property<DateTime>("purchaseDate")
                        .HasColumnType("datetime2");

                    b.Property<int>("quantity")
                        .HasColumnType("int");

                    b.Property<string>("supplierName")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("purchaseId");

                    b.ToTable("stockPurchase");
                });

            modelBuilder.Entity("AngularApi.Model.stockSale", b =>
                {
                    b.Property<int>("salesId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("salesId"));

                    b.Property<string>("CustomerName")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("MobileNo")
                        .HasColumnType("int");

                    b.Property<string>("invoiceNo")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("productId")
                        .HasColumnType("int");

                    b.Property<int>("quantity")
                        .HasColumnType("int");

                    b.Property<DateTime>("saledate")
                        .HasColumnType("datetime2");

                    b.Property<int>("totalAmt")
                        .HasColumnType("int");

                    b.HasKey("salesId");

                    b.ToTable("stockSales");
                });

            modelBuilder.Entity("AngularApi.Model.stockTable", b =>
                {
                    b.Property<int>("stockId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("stockId"));

                    b.Property<DateTime>("createdDate")
                        .HasColumnType("datetime2");

                    b.Property<int>("productId")
                        .HasColumnType("int");

                    b.Property<int>("quantity")
                        .HasColumnType("int");

                    b.Property<DateTime>("updatedDate")
                        .HasColumnType("datetime2");

                    b.HasKey("stockId");

                    b.ToTable("stockTable");
                });
#pragma warning restore 612, 618
        }
    }
}
