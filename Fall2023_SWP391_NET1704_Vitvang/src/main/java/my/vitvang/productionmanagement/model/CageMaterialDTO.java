/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package my.vitvang.productionmanagement.model;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class CageMaterialDTO implements Serializable{
      private String CageID;
      private int QuantityNeed;
      private String MaterialID;
      private String Name;
      private String Origin;
      private int Price;
      private int Quantity;
      private String Unit;
      private int TotalpriceOfMaterial;

      public CageMaterialDTO(String MaterialID, String Name, String Origin, int Price, String Unit) {
            this.MaterialID = MaterialID;
            this.Name = Name;
            this.Origin = Origin;
            this.Price = Price;
            this.Unit = Unit;
      }

     
      
      public CageMaterialDTO(String CageID, int QuantityNeed, String MaterialID, String Name, String Origin, int Price, int Quantity, String Unit) {
            this.CageID = CageID;
            this.QuantityNeed = QuantityNeed;
            this.MaterialID = MaterialID;
            this.Name = Name;
            this.Origin = Origin;
            this.Price = Price;
            this.Quantity = Quantity;
            this.Unit = Unit;
      }

      public String getCageID() {
            return CageID;
      }

      public void setCageID(String CageID) {
            this.CageID = CageID;
      }

      public int getQuantityNeed() {
            return QuantityNeed;
      }

      public void setQuantityNeed(int QuantityNeed) {
            this.QuantityNeed = QuantityNeed;
      }

      
      
      public CageMaterialDTO() {
      }

      public String getMaterialID() {
            return MaterialID;
      }

      public void setMaterialID(String MaterialID) {
            this.MaterialID = MaterialID;
      }

      public String getName() {
            return Name;
      }

      public void setName(String Name) {
            this.Name = Name;
      }

      public String getOrigin() {
            return Origin;
      }

      public void setOrigin(String Origin) {
            this.Origin = Origin;
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

      public String getUnit() {
            return Unit;
      }

      public void setUnit(String Unit) {
            this.Unit = Unit;
      }

      public int getTotalPriceOfMaterial() {
            return this.getPrice()*this.QuantityNeed;
      }

      public void setTotalPriceOfMaterial(int priceOfMaterial) {
            this.TotalpriceOfMaterial = priceOfMaterial;
      }


}
