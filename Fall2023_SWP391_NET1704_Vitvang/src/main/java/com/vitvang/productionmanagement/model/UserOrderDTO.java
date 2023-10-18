/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vitvang.productionmanagement.model;

/**
 *
 * @author Admin
 */
public class UserOrderDTO {
      private String UserID;
      private String OrderID;

      public UserOrderDTO(String UserID, String OrderID) {
            this.UserID = UserID;
            this.OrderID = OrderID;
      }

      public UserOrderDTO() {
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
      
}
