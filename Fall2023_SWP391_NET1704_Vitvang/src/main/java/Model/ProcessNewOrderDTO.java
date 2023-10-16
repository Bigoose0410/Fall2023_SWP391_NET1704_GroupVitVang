/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class ProcessNewOrderDTO {

      private String UserID;
      private String OrderID;
      private String CageID;
      private Date StartDate;
      private int Quantity;
      private String StatusProgress;

      public ProcessNewOrderDTO() {
      }

      public ProcessNewOrderDTO(String UserID, String OrderID, String CageID, Date StartDate, int Quantity, String StatusProgress) {
            this.UserID = UserID;
            this.OrderID = OrderID;
            this.CageID = CageID;
            this.StartDate = StartDate;
            this.Quantity = Quantity;
            this.StatusProgress = StatusProgress;
      }

      public String getUserID() {
            return UserID;
      }

      public void setUserID(String UserID) {
            this.UserID = UserID;
      }

      public String getOrderID() {
            return OrderID;
      }

      public void setOrderID(String OrderID) {
            this.OrderID = OrderID;
      }

      public String getCageID() {
            return CageID;
      }

      public void setCageID(String CageID) {
            this.CageID = CageID;
      }

      public Date getStartDate() {
            return StartDate;
      }

      public void setStartDate(Date StartDate) {
            this.StartDate = StartDate;
      }

      public int getQuantity() {
            return Quantity;
      }

      public void setQuantity(int Quantity) {
            this.Quantity = Quantity;
      }

      public String getStatusProgress() {
            return StatusProgress;
      }

      public void setStatusProgress(String StatusProgress) {
            this.StatusProgress = StatusProgress;
      }

}