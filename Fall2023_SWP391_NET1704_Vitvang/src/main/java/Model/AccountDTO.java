/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class AccountDTO {

        private String AccountID;
        private String Password;
        private String FullName;
        private String Email;
        private String CategaryBy;
        private int RoleID;
        private String Status;

        public AccountDTO() {
        }

        public AccountDTO(String AccountID, String Password, String FullName, String Email, String CategaryBy, int RoleID, String Status) {
                this.AccountID = AccountID;
                this.Password = Password;
                this.FullName = FullName;
                this.Email = Email;
                this.CategaryBy = CategaryBy;
                this.RoleID = RoleID;
                this.Status = Status;
        }

        public String getAccountID() {
                return AccountID;
        }

        public void setAccountID(String AccountID) {
                this.AccountID = AccountID;
        }

        public String getPassword() {
                return Password;
        }

        public void setPassword(String Password) {
                this.Password = Password;
        }

        public String getFullName() {
                return FullName;
        }

        public void setFullName(String FullName) {
                this.FullName = FullName;
        }

        public String getEmail() {
                return Email;
        }

        public void setEmail(String Email) {
                this.Email = Email;
        }

        public String getCategaryBy() {
                return CategaryBy;
        }

        public void setCategaryBy(String CategaryBy) {
                this.CategaryBy = CategaryBy;
        }

        public int getRoleID() {
                return RoleID;
        }

        public void setRoleID(int RoleID) {
                this.RoleID = RoleID;
        }

        public String getStatus() {
                return Status;
        }

        public void setStatus(String Status) {
                this.Status = Status;
        }
}
