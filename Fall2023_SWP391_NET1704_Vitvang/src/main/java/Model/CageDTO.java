/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class CageDTO {
      private String CageID;
      private String Name;
      private int Price;
      private String Origin;
      private String Description;

      public CageDTO() {
      }

      public CageDTO(String CageID, String Name, int Price, String Origin, String Description) {
            this.CageID = CageID;
            this.Name = Name;
            this.Price = Price;
            this.Origin = Origin;
            this.Description = Description;
      }

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
      
      
              
}
