/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Resigtration;

import Database.DBUtils;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class RegistrationDAO implements Serializable {

    public boolean checkLogin(String username, String password) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.makeConnection();
            // tra ra null or k.
            if (con != null) {
                String sql = "Select username, password From Registration"
                        + " where username = ? and password  = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                rs = stm.executeQuery();
                // hoan chinh roi thi excutequery

                if (rs.next()) {
                    return true;
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;

    }

    List<RegistrationDTO> listAccounts;

    public List<RegistrationDTO> getListAccounts() {
        return listAccounts;
    }

    public void searchByLastname(String searchValue) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.makeConnection();
            // tra ra null or k.
            if (con != null) {
                String sql = "Select username, password, lastname, isAdmin   From Registration"
                        + " Where lastname Like ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchValue + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    String lastname = rs.getString("lastname");
                    boolean isadmin = rs.getBoolean("isAdmin");

                    RegistrationDTO dto = new RegistrationDTO(username, password, lastname, isadmin);

                    if (this.listAccounts == null) {
                        this.listAccounts = new ArrayList<RegistrationDTO>();
                    }
                    this.listAccounts.add(dto);

                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

    }
    public boolean deleteRecord(String username) throws SQLException{
       Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.makeConnection();
            // tra ra null or k.
            if (con != null) {
                String sql = "Delete From Registration Where username = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                
                int row = stm.executeUpdate();
                if(row > 0 ){
                    return true;
                }
                // hoan chinh roi thi excutequery

               
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
        
    } 
    public boolean updatedRecord(String username, String password, String lastname, boolean role) throws SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.makeConnection();
            // tra ra null or k.
            if (con != null) {
                String sql = "Update Registration set password= ?, isAdmin= ?, lastname= ? "
                        + " where username= ?";    
                stm = con.prepareStatement(sql);
                stm.setString(1, password);
                stm.setBoolean(2, role);
                stm.setString(3, lastname);
                stm.setString(4, username);
                int row = stm.executeUpdate();
                if(row > 0 ){
                    return true;
                }
                // hoan chinh roi thi excutequery

               
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
     public boolean insertRecord(String username, String password, String fullname, boolean role) throws SQLException{
       Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.makeConnection();
            // tra ra null or k.
            if (con != null) {
                String sql = "Insert into Registration (username, password, lastname, isAdmin) values(?,?,?,?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                stm.setString(3, fullname);
                stm.setBoolean(4, role);
                
                int row = stm.executeUpdate();
                if(row > 0 ){
                    return true;
                }
                // hoan chinh roi thi excutequery

               
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
        
    } 
}
