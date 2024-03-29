/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vitvang.productionmanagement.model;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author Admin
 */
public class AccountDTO implements Serializable {

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
      private String RoleName;
      private boolean UserStatus;
      private String OrderID;
      private String CageID;
      private String OrderDetailStatus;

      public AccountDTO() {
      }

      public AccountDTO(String UserID, String Name, String PhoneNumber, String Sex, String Adress, Date BirthDate, String Email, String Username, String Password, int RoleID, String RoleName, boolean UserStatus) {
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
            this.RoleName = RoleName;
            this.UserStatus = UserStatus;
      }

      public AccountDTO(String UserID, String Name, String PhoneNumber, String Sex, String Adress, Date BirthDate, String Email, String Username, String Password, int RoleID, String RoleName, boolean UserStatus, String OrderID) {
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
            this.RoleName = RoleName;
            this.UserStatus = UserStatus;
            this.OrderID = OrderID;
      }

      public AccountDTO(String UserID, String OrderID, String CageID, String OrderDetailStatus) {
            this.UserID = UserID;
            this.OrderID = OrderID;
            this.CageID = CageID;
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
            if (Sex.trim().equals("F")) {
                  Sex = "Female";
            } else {
                  Sex = "Male";
            }
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

      public String getRoleName() {
            return RoleName;
      }

      public void setRoleName(String RoleName) {
            this.RoleName = RoleName;
      }

      public boolean isUserStatus() {
            return UserStatus;
      }

      public void setUserStatus(boolean UserStatus) {
            this.UserStatus = UserStatus;
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

      public String getOrderDetailStatus() {
            return OrderDetailStatus;
      }

      public void setOrderDetailStatus(String OrderDetailStatus) {
            this.OrderDetailStatus = OrderDetailStatus;
      }
}
