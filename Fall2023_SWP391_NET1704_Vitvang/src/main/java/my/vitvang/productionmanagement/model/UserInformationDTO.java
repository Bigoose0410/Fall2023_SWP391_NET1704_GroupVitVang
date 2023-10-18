/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package my.vitvang.productionmanagement.model;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class UserInformationDTO {

      private String UserID;
      private String Name;
      private String PhoneNumber;
      private String Sex;
      private String Adress;
      private Date BirthDate;
      private String Email;
      private String Username;
      private String Password;
      private int RoleID;
      private String OrderID;
      private String CageID;
      private int Quantity;
      private String OrderDetailStatus;

      public UserInformationDTO() {
      }

      public UserInformationDTO(String UserID, String Name, String PhoneNumber, String Sex, String Adress, Date BirthDate, String Email, String Username, String Password, int RoleID, String OrderID, String CageID, int Quantity, String OrderDetailStatus) {
            this.UserID = UserID;
            this.Name = Name;
            this.PhoneNumber = PhoneNumber;
            this.Sex = Sex;
            this.Adress = Adress;
            this.BirthDate = BirthDate;
            this.Email = Email;
            this.Username = Username;
            this.Password = Password;
            this.RoleID = RoleID;
            this.OrderID = OrderID;
            this.CageID = CageID;
            this.Quantity = Quantity;
            this.OrderDetailStatus = OrderDetailStatus;
      }

      public String getUserID() {
            return UserID;
      }

      public void setUserID(String UserID) {
            this.UserID = UserID;
      }

      public String getName() {
            return Name;
      }

      public void setName(String Name) {
            this.Name = Name;
      }

      public String getPhoneNumber() {
            return PhoneNumber;
      }

      public void setPhoneNumber(String PhoneNumber) {
            this.PhoneNumber = PhoneNumber;
      }

      public String getSex() {
            return Sex;
      }

      public void setSex(String Sex) {
            this.Sex = Sex;
      }

      public String getAdress() {
            return Adress;
      }

      public void setAdress(String Adress) {
            this.Adress = Adress;
      }

      public Date getBirthDate() {
            return BirthDate;
      }

      public void setBirthDate(Date BirthDate) {
            this.BirthDate = BirthDate;
      }

      public String getEmail() {
            return Email;
      }

      public void setEmail(String Email) {
            this.Email = Email;
      }

      public String getUsername() {
            return Username;
      }

      public void setUsername(String Username) {
            this.Username = Username;
      }

      public String getPassword() {
            return Password;
      }

      public void setPassword(String Password) {
            this.Password = Password;
      }

      public int getRoleID() {
            return RoleID;
      }

      public void setRoleID(int RoleID) {
            this.RoleID = RoleID;
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

      public int getQuantity() {
            return Quantity;
      }

      public void setQuantity(int Quantity) {
            this.Quantity = Quantity;
      }

      public String getOrderDetailStatus() {
            return OrderDetailStatus;
      }

      public void setOrderDetailStatus(String OrderDetailStatus) {
            this.OrderDetailStatus = OrderDetailStatus;
      }

}
