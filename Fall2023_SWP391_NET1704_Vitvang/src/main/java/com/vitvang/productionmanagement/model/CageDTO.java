/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vitvang.productionmanagement.model;

/**
 *
 * @author Admin
 */
public class CageDTO {
<<<<<<< HEAD
=======

>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
      private String CageID;
      private String Name;
      private int Price;
      private String Origin;
      private String Description;
      private int quantityOrder;
<<<<<<< HEAD
      
=======
      private int CageQuantity;
      private String OrderDetailStatus;
      private String OrderStatus;
      private String OrderID;

>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
      public CageDTO() {
      }

      public CageDTO(String CageID, String Name, int Price, String Origin, String Description) {
            this.CageID = CageID;
            this.Name = Name;
            this.Price = Price;
            this.Origin = Origin;
            this.Description = Description;
      }

      public CageDTO(String CageID, String Name, int Price, String Origin, String Description, int quantityOrder) {
            this.CageID = CageID;
            this.Name = Name;
            this.Price = Price;
            this.Origin = Origin;
            this.Description = Description;
            this.quantityOrder = quantityOrder;
      }

<<<<<<< HEAD
=======
      public CageDTO(String CageID, String Name, int CageQuantity) {
            this.CageID = CageID;
            this.Name = Name;
            this.CageQuantity = CageQuantity;
      }

      public CageDTO(String CageID, String Name, int Price, String Origin, String Description, int quantityOrder, String OrderDetailStatus, String OrderStatus) {
            this.CageID = CageID;
            this.Name = Name;
            this.Price = Price;
            this.Origin = Origin;
            this.Description = Description;
            this.quantityOrder = quantityOrder;
            this.OrderDetailStatus = OrderDetailStatus;
            this.OrderStatus = OrderStatus;
      }

      public CageDTO(String OrderID, String CageID, String Name, int Price, String Origin, String Description, int quantityOrder, String OrderDetailStatus, String OrderStatus) {
            this.OrderID = OrderID;
            this.CageID = CageID;
            this.Name = Name;
            this.Price = Price;
            this.Origin = Origin;
            this.Description = Description;
            this.quantityOrder = quantityOrder;
            this.OrderDetailStatus = OrderDetailStatus;
            this.OrderStatus = OrderStatus;
      }

>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
      public int getQuantityOrder() {
            return quantityOrder;
      }

      public void setQuantityOrder(int quantityOrder) {
            this.quantityOrder = quantityOrder;
      }
<<<<<<< HEAD
      
      
=======

>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
      public String getCageID() {
            return CageID;
      }

      public void setCageID(String CageID) {
            this.CageID = CageID;
      }

      public String getName() {
            return Name;
      }

      public void setName(String Name) {
            this.Name = Name;
      }

      public int getPrice() {
            return Price;
      }

      public void setPrice(int Price) {
            this.Price = Price;
      }

      public String getOrigin() {
            return Origin;
      }

      public void setOrigin(String Origin) {
            this.Origin = Origin;
      }

      public String getDescription() {
            return Description;
      }

      public void setDescription(String Description) {
            this.Description = Description;
      }
<<<<<<< HEAD
      
      
      
              
=======

      public int getCageQuantity() {
            return CageQuantity;
      }

      public void setCageQuantity(int CageQuantity) {
            this.CageQuantity = CageQuantity;
      }

      public String getOrderDetailStatus() {
            return OrderDetailStatus;
      }

      public void setOrderDetailStatus(String OrderDetailStatus) {
            this.OrderDetailStatus = OrderDetailStatus;
      }

      public String getOrderStatus() {
            return OrderStatus;
      }

      public void setOrderStatus(String OrderStatus) {
            this.OrderStatus = OrderStatus;
      }

      public String getOrderID() {
            return OrderID;
      }

      public void setOrderID(String OrderID) {
            this.OrderID = OrderID;
      }

>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
}
