/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vitvang.productionmanagement.model;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class UserDTO {

<<<<<<< HEAD
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


        public UserDTO() {
        }
=======
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
      private boolean UserStatus;

      public UserDTO() {
      }
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea

      public UserDTO(String UserID, String Name, String PhoneNumber, String Sex, String Adress, Date BirthDate, String Email, String Username, String Password, int RoleID) {
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
      }

<<<<<<< HEAD
=======
      public UserDTO(String UserID, String Name, String PhoneNumber, String Sex, String Adress, Date BirthDate, String Email, String Username, String Password, int RoleID, boolean UserStatus) {
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
            this.UserStatus = UserStatus;
      }

>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
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
<<<<<<< HEAD
            if(Sex.trim().equals("F")){
                  Sex = "Female";
            }else {
=======
            if (Sex.trim().equals("F")) {
                  Sex = "Female";
            } else {
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
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
<<<<<<< HEAD
      
       
=======

      public boolean isUserStatus() {
            return UserStatus;
      }

      public void setUserStatus(boolean UserStatus) {
            this.UserStatus = UserStatus;
      }

>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
}
