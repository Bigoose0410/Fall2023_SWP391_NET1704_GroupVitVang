/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vitvang.productionmanagement.model;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


public class MaterialDTO implements Serializable{
      private String NameMaterial;
      private int Price;
      private int Quantity;
      private String Origin;
      private String Unit;
      private String MaterialID;

      public MaterialDTO(String NameMaterial, int Price, int Quantity, String Origin, String Unit) {
            this.NameMaterial = NameMaterial;
            this.Price = Price;
            this.Quantity = Quantity;
            this.Origin = Origin;
            this.Unit = Unit;
      }

      public MaterialDTO(String NameMaterial, int Price, int Quantity, String Origin, String Unit, String MaterialID) {
            this.NameMaterial = NameMaterial;
            this.Price = Price;
            this.Quantity = Quantity;
            this.Origin = Origin;
            this.Unit = Unit;
            this.MaterialID = MaterialID;
      }

      public String getNameMaterial() {
            return NameMaterial;
      }

      public void setNameMaterial(String NameMaterial) {
            this.NameMaterial = NameMaterial;
      }

      public int getPrice() {
            return Price;
      }

      public void setPrice(int Price) {
            this.Price = Price;
      }

      public int getQuantity() {
            return Quantity;
      }

      public void setQuantity(int Quantity) {
            this.Quantity = Quantity;
      }

      public String getOrigin() {
            return Origin;
      }

      public void setOrigin(String Origin) {
            this.Origin = Origin;
      }

      public String getUnit() {
            return Unit;
      }

      public void setUnit(String Unit) {
            this.Unit = Unit;
      }

      public String getMaterialID() {
            return MaterialID;
      }

      public void setMaterialID(String MaterialID) {
            this.MaterialID = MaterialID;
      }
      
}
