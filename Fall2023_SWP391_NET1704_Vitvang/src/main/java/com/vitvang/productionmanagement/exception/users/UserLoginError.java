/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vitvang.productionmanagement.exception.users;

/**
 *
 * @author Admin
 */
public class UserLoginError {
        private String isEmptyUsername;
        private String isEmptyPassword;
        private String isWrongAccount;

        public UserLoginError() {
        }

        public UserLoginError(String isEmptyUsername, String isEmptyPassword, String isWrongAccount) {
                this.isEmptyUsername = isEmptyUsername;
                this.isEmptyPassword = isEmptyPassword;
                this.isWrongAccount = isWrongAccount;
        }

        

        public String getIsEmptyUsername() {
                return isEmptyUsername;
        }

        public void setIsEmptyUsername(String isEmptyUsername) {
                this.isEmptyUsername = isEmptyUsername;
        }

        public String getIsEmptyPassword() {
                return isEmptyPassword;
        }

        public void setIsEmptyPassword(String isEmptyPassword) {
                this.isEmptyPassword = isEmptyPassword;
        }

        public String getIsWrongAccount() {
                return isWrongAccount;
        }

        public void setIsWrongAccount(String isWrongAccount) {
                this.isWrongAccount = isWrongAccount;
        }
        

}
