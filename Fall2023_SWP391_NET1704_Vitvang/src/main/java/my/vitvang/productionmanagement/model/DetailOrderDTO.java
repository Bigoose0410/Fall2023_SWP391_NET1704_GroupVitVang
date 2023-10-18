/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package my.vitvang.productionmanagement.model;

/**
 *
 * @author Admin
 */
public class DetailOrderDTO {
      private String DetailOrder;
      private String CageID;
      private int Quantity;

      public DetailOrderDTO() {
      }

      public DetailOrderDTO(String DetailOrder, String CageID, int Quantity) {
            this.DetailOrder = DetailOrder;
            this.CageID = CageID;
            this.Quantity = Quantity;
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
      
}
