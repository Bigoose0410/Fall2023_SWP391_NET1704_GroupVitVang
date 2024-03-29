/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vitvang.productionmanagement.exception.users;

/**
 *
 * @author Admin
 */
public class UserCreateError {

      private String customerIDFormatErr;
      private String customerIDexistErr;
      private String nameLengthErr;
      private String usernameLengthErr;
      private String usernameExistErr;
      private String passwordLengthErr;
      private String confirmNotMatch;
      private String usernameIsExist;
      private String addressLenghtErr;
      private String birthDateVaildErr;
      private String phoneNumberTypeErr;
      private String gmailTypeErr;

      public UserCreateError() {
      }

      public UserCreateError(String usernameLengthErr, String usernameExistErr,String fullNameLengthErr,
              String confirmNotMatch, String usernameIsExist, String customerIDFormatErr,
              String customerIDexistErr, String addressLenghtErr, String birthDateVaildErr,String phoneNumberTypeErr
      , String gmailTypeErr) {
            this.usernameLengthErr = usernameLengthErr;
            this.usernameExistErr = usernameExistErr;
            this.passwordLengthErr = passwordLengthErr;
            this.confirmNotMatch = confirmNotMatch;
            this.usernameIsExist = usernameIsExist;
            this.customerIDFormatErr = customerIDFormatErr;
            this.customerIDexistErr = customerIDexistErr;
            this.addressLenghtErr = addressLenghtErr;
            this.birthDateVaildErr = birthDateVaildErr;
            this.phoneNumberTypeErr = phoneNumberTypeErr;
            this.gmailTypeErr = gmailTypeErr;
      }

      public String getGmailTypeErr() {
            return gmailTypeErr;
      }

      public void setGmailTypeErr(String gmailTypeErr) {
            this.gmailTypeErr = gmailTypeErr;
      }

      public String getPhoneNumberTypeErr() {
            return phoneNumberTypeErr;
      }

      public void setPhoneNumberTypeErr(String phoneNumberTypeErr) {
            this.phoneNumberTypeErr = phoneNumberTypeErr;
      }

      public String getBirthDateVaildErr() {
            return birthDateVaildErr;
      }

      public void setBirthDateVaildErr(String birthDateVaildErr) {
            this.birthDateVaildErr = birthDateVaildErr;
      }

      public String getUsernameLengthErr() {
            return usernameLengthErr;
      }

      public void setUsernameLengthErr(String usernameLengthErr) {
            this.usernameLengthErr = usernameLengthErr;
      }

      public String getUsernameExistErr() {
            return usernameExistErr;
      }

      public void setUsernameExistErr(String usernameExistErr) {
            this.usernameExistErr = usernameExistErr;
      }

      public String getPasswordLengthErr() {
            return passwordLengthErr;
      }

      public void setPasswordLengthErr(String passwordLengthErr) {
            this.passwordLengthErr = passwordLengthErr;
      }


      public String getConfirmNotMatch() {
            return confirmNotMatch;
      }

      public void setConfirmNotMatch(String confirmNotMatch) {
            this.confirmNotMatch = confirmNotMatch;
      }

      public String getUsernameIsExist() {
            return usernameIsExist;
      }

      public void setUsernameIsExist(String usernameIsExist) {
            this.usernameIsExist = usernameIsExist;
      }

      public String getCustomerIDFormatErr() {
            return customerIDFormatErr;
      }

      public void setCustomerIDFormatErr(String customerIDFormatErr) {
            this.customerIDFormatErr = customerIDFormatErr;
      }

      public String getCustomerIDexistErr() {
            return customerIDexistErr;
      }

      public void setCustomerIDexistErr(String customerIDexistErr) {
            this.customerIDexistErr = customerIDexistErr;
      }

      public String getAddressLenghtErr() {
            return addressLenghtErr;
      }

      public void setAddressLenghtErr(String addressLenghtErr) {
            this.addressLenghtErr = addressLenghtErr;
      }

      public String getNameLengthErr() {
            return nameLengthErr;
      }

      public void setNameLengthErr(String nameLengthErr) {
            this.nameLengthErr = nameLengthErr;
      }
      
      
      
}
