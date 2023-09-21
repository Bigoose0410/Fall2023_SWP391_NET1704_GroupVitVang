/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class RegistrationInsertError implements Serializable{
    private String usernameLengErr;
    private String passwordLengErr;
    private String confirmNotMath;
    private String fullNameLengthErr;
    private String usernameIsExisted;

    public RegistrationInsertError() {
    }

    
    public RegistrationInsertError(String usernameLengErr, String passwordLengErr, String confirmNotMath, String fullNameLengthErr, String usernameIsExisted) {
        this.usernameLengErr = usernameLengErr;
        this.passwordLengErr = passwordLengErr;
        this.confirmNotMath = confirmNotMath;
        this.fullNameLengthErr = fullNameLengthErr;
        this.usernameIsExisted = usernameIsExisted;
    }

    public String getUsernameLengErr() {
        return usernameLengErr;
    }

    public String getPasswordLengErr() {
        return passwordLengErr;
    }

    public String getConfirmNotMath() {
        return confirmNotMath;
    }

    public String getFullNameLengthErr() {
        return fullNameLengthErr;
    }

    public String getUsernameIsExisted() {
        return usernameIsExisted;
    }

    public void setUsernameLengErr(String usernameLengErr) {
        this.usernameLengErr = usernameLengErr;
    }

    public void setPasswordLengErr(String passwordLengErr) {
        this.passwordLengErr = passwordLengErr;
    }

    public void setConfirmNotMath(String confirmNotMath) {
        this.confirmNotMath = confirmNotMath;
    }

    public void setFullNameLengthErr(String fullNameLengthErr) {
        this.fullNameLengthErr = fullNameLengthErr;
    }

    public void setUsernameIsExisted(String usernameIsExisted) {
        this.usernameIsExisted = usernameIsExisted;
    }
    

    
}
