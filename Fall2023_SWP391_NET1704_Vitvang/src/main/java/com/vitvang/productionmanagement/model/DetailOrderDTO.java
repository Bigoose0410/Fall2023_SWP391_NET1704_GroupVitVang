/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vitvang.productionmanagement.model;


public class DetailOrderDTO {
      private String DetailOrder;
      private String CageID;
      private String Name;
      private int Price;
      private String Origin;
      private int Quantity;
      private String Status;
      private String Description;

      public DetailOrderDTO(String DetailOrder, String CageID, String Name, int Price, String Origin, int Quantity, String Status, String Description) {
            this.DetailOrder = DetailOrder;
            this.CageID = CageID;
            this.Name = Name;
            this.Price = Price;
            this.Origin = Origin;
            this.Quantity = Quantity;
            this.Status = Status;
            this.Description = Description;
      }

      public DetailOrderDTO() {
      }

      
      public DetailOrderDTO(String DetailOrder, String CageID, int Quantity, String Status) {
            this.DetailOrder = DetailOrder;
            this.CageID = CageID;
            this.Quantity = Quantity;
            this.Status = Status;
      }
      
      public String getStatus() {
            return Status;
      }

      public void setStatus(String Status) {
            this.Status = Status;
      }

      public String getDetailOrder() {
            return DetailOrder;
      }

      public void setDetailOrder(String DetailOrder) {
            this.DetailOrder = DetailOrder;
      }

      public String getCageID() {
            return CageID;
      }

      public void setCageID(String CageID) {
            this.CageID = CageID;
      }

      public int getQuantity() {
            return Quantity;
      }

      public void setQuantity(int Quantity) {
            this.Quantity = Quantity;
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
      

}
