/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vitvang.productionmanagement.exception.account;

/**
 *
 * @author Admin
 */
public class CreateAccountError {

      private String usernameExistErr;
      private String usernameFormatErr;
      private String passwordFormatErr;
      private String confirmPasswordNotMatchErr;
      private String userIDExistErr;
      private String userIDFormatErr;
      private String roleIDFormatErr;
      private String phoneNumberFormatErr;
      private String addressFormatErr;
      private String emailFormatErr;
      private String nameFormatErr;
      private String birthDateValidErr;

      public CreateAccountError() {
      }

      public CreateAccountError(String usernameExistErr, String usernameFormatErr, String passwordFormatErr, String confirmPasswordNotMatchErr, String userIDExistErr, String userIDFormatErr, String roleIDFormatErr, String phoneNumberFormatErr, String addressFormatErr, String emailFormatErr, String nameFormatErr, String birthDateValidErr) {
            this.usernameExistErr = usernameExistErr;
            this.usernameFormatErr = usernameFormatErr;
            this.passwordFormatErr = passwordFormatErr;
            this.confirmPasswordNotMatchErr = confirmPasswordNotMatchErr;
            this.userIDExistErr = userIDExistErr;
            this.userIDFormatErr = userIDFormatErr;
            this.roleIDFormatErr = roleIDFormatErr;
            this.phoneNumberFormatErr = phoneNumberFormatErr;
            this.addressFormatErr = addressFormatErr;
            this.emailFormatErr = emailFormatErr;
            this.nameFormatErr = nameFormatErr;
            this.birthDateValidErr = birthDateValidErr;
      }

      public String getUsernameExistErr() {
            return usernameExistErr;
      }

      public void setUsernameExistErr(String usernameExistErr) {
            this.usernameExistErr = usernameExistErr;
      }

      public String getUsernameFormatErr() {
            return usernameFormatErr;
      }

      public void setUsernameFormatErr(String usernameFormatErr) {
            this.usernameFormatErr = usernameFormatErr;
      }

      public String getPasswordFormatErr() {
            return passwordFormatErr;
      }

      public void setPasswordFormatErr(String passwordFormatErr) {
            this.passwordFormatErr = passwordFormatErr;
      }

      public String getConfirmPasswordNotMatchErr() {
            return confirmPasswordNotMatchErr;
      }

      public void setConfirmPasswordNotMatchErr(String confirmPasswordNotMatchErr) {
            this.confirmPasswordNotMatchErr = confirmPasswordNotMatchErr;
      }

      public String getUserIDExistErr() {
            return userIDExistErr;
      }

      public void setUserIDExistErr(String userIDExistErr) {
            this.userIDExistErr = userIDExistErr;
      }

      public String getUserIDFormatErr() {
            return userIDFormatErr;
      }

      public void setUserIDFormatErr(String userIDFormatErr) {
            this.userIDFormatErr = userIDFormatErr;
      }

      public String getRoleIDFormatErr() {
            return roleIDFormatErr;
      }

      public void setRoleIDFormatErr(String roleIDFormatErr) {
            this.roleIDFormatErr = roleIDFormatErr;
      }

      public String getPhoneNumberFormatErr() {
            return phoneNumberFormatErr;
      }

      public void setPhoneNumberFormatErr(String phoneNumberFormatErr) {
            this.phoneNumberFormatErr = phoneNumberFormatErr;
      }

      public String getAddressFormatErr() {
            return addressFormatErr;
      }

      public void setAddressFormatErr(String addressFormatErr) {
            this.addressFormatErr = addressFormatErr;
      }

      public String getEmailFormatErr() {
            return emailFormatErr;
      }

      public void setEmailFormatErr(String emailFormatErr) {
            this.emailFormatErr = emailFormatErr;
      }

      public String getNameFormatErr() {
            return nameFormatErr;
      }

      public void setNameFormatErr(String nameFormatErr) {
            this.nameFormatErr = nameFormatErr;
      }

      public String getBirthDateValidErr() {
            return birthDateValidErr;
      }

      public void setBirthDateValidErr(String birthDateValidErr) {
            this.birthDateValidErr = birthDateValidErr;
      }

}
