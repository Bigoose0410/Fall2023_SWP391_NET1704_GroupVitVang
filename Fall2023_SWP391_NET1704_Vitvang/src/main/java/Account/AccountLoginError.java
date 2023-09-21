/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Account;

/**
 *
 * @author Admin
 */
public class AccountLoginError {
        private String isEmptyUsername;
        private String isEmptyPassword;

        public AccountLoginError() {
        }

        public AccountLoginError(String isEmptyUsername, String isEmptyPassword) {
                this.isEmptyUsername = isEmptyUsername;
                this.isEmptyPassword = isEmptyPassword;
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

}
