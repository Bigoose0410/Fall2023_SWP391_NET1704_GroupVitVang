/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vitvang.productionmanagement.dao.account;

import com.vitvang.productionmanagement.model.AccountDTO;
import com.vitvang.productionmanagement.model.UserDTO;
import com.vitvang.productionmanagement.util.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
public class AccountDAO implements Serializable {

      List<AccountDTO> listAccount;

      public List<AccountDTO> getListAccount() {
            return listAccount;
      }

      public void showListAccount() throws SQLException, NamingException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            try {
                  //1. Make connection
                  con = (Connection) DBHelper.makeConnection();
                  if (con != null) {
                        //2. create SQL statement string
                        String sql = "SELECT Users.UserID, Users.Name, Users.PhoneNumber, Users.Sex, Users.Adress, Users.BirthDate, Users.Email, Users.Username, Users.Password, Users.RoleID, Role.Rolename, Users.UserStatus "
                                + "FROM Users JOIN Role "
                                + "ON Users.RoleID = Role.RoleID AND Users.UserStatus = 'True' ";
                        //3. Create statement object
                        stm = con.prepareStatement(sql);
                        //4. Excute query
                        rs = stm.executeQuery();
                        //5. Process
                        while (rs.next()) {
                              String UserID = rs.getString("UserID");
                              String Name = rs.getString("Name");
                              String PhoneNumber = rs.getString("PhoneNumber");
                              String Sex = rs.getString("Sex");
                              String Adress = rs.getString("Adress");
                              Date BirthDate = rs.getDate("BirthDate");
                              String Email = rs.getString("Email");
                              String Username = rs.getString("Username");
                              String Password = rs.getString("Password");
                              int RoleID = rs.getInt("RoleID");
                              String RoleName = rs.getString("Rolename");
                              Boolean UserStatus = rs.getBoolean("UserStatus");
                              AccountDTO account = new AccountDTO(UserID, Name, PhoneNumber, Sex, Adress, BirthDate, Email, Username, Password, RoleID, RoleName, UserStatus);
                              if (this.listAccount == null) {
                                    this.listAccount = new ArrayList<AccountDTO>();
                              }
                              this.listAccount.add(account);
                        }//end username and password are checked
                  }
                  // end of connection has opend
            } finally {
                  if (rs != null) {
                        rs.close();
                  }
                  if (stm != null) {
                        stm.close();
                  }
                  if (con != null) {
                        con.close();
                        DBHelper.closeConnection(con);
                  }
            }
      }

      public void ViewAccountDetail(String UserID) throws SQLException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            try {
                  con = (Connection) DBHelper.makeConnection();
                  if (con != null) {
                        String sql = "SELECT Users.UserID, Users.Name, Users.PhoneNumber, Users.Sex, Users.Adress, Users.BirthDate, Users.Email, Users.Username, Users.Password, Users.RoleID, Role.Rolename, Users.UserStatus "
                                + "FROM Users JOIN Role "
                                + "ON Users.RoleID = Role.RoleID "
                                + "Where UserID = ? ";
                        stm = con.prepareStatement(sql);
                        stm.setString(1, UserID);
                        rs = stm.executeQuery();
                  }
                  while (rs.next()) {
                        String Name = rs.getString("Name");
                        String PhoneNumber = rs.getString("PhoneNumber");
                        String Sex = rs.getString("Sex");
                        String Adress = rs.getString("Adress");
                        Date BirthDate = rs.getDate("BirthDate");
                        String Email = rs.getString("Email");
                        String Username = rs.getString("Username");
                        String Password = rs.getString("Password");
                        int RoleID = rs.getInt("RoleID");
                        String RoleName = rs.getString("Rolename");
                        Boolean UserStatus = rs.getBoolean("UserStatus");
                        AccountDTO account = new AccountDTO(UserID, Name, PhoneNumber, Sex, Adress, BirthDate, Email, Username, Password, RoleID, RoleName, UserStatus);
                        if (this.listAccount == null) {
                              this.listAccount = new ArrayList<AccountDTO>();
                        }
                        this.listAccount.add(account);
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
                        DBHelper.closeConnection(con);
                  }
            }
      }

      public boolean UpdateAccount(String UserID, String Username, String Password, String Email, String Address, String PhoneNumber) throws SQLException {
            Connection con = null;
            PreparedStatement stm = null;
            try {
                  con = (Connection) DBHelper.makeConnection();
                  if (con != null) {
                        String sql = "UPDATE Users "
                                + "SET Username = ?, Password= ?, Email= ?, Adress= ?, PhoneNumber= ? "
                                + "WHERE UserID = ? ";
                        stm = con.prepareStatement(sql);
                        stm.setString(1, Username);
                        stm.setString(2, Password);
                        stm.setString(3, Email);
                        stm.setString(4, Address);
                        stm.setString(5, PhoneNumber);
                        stm.setString(6, UserID);
                        int row = stm.executeUpdate();
                        if (row > 0) {
                              return true;
                        }

                  }

            } finally {
                  if (stm != null) {
                        stm.close();
                  }
                  if (con != null) {
                        con.close();
                        DBHelper.closeConnection(con);
                  }
            }
            return false;
      }

      public boolean createNewAccount(AccountDTO account) throws SQLException, NamingException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            try {
                  //1. Make connection
                  con = DBHelper.makeConnection();
                  if (con != null) {
                        //2. create SQL statement string

                        String sql = "INSERT INTO Users (UserID, Name, PhoneNumber, Sex, Adress, BirthDate, Email, Username, Password, RoleID, UserStatus) "
                                + "VALUES (?, ?, ? , ?, ?, ?, ?, ?, ?, ?, ?)";
                        //3. Create statement object
                        stm = con.prepareStatement(sql);
                        stm.setString(1, account.getUserID());
                        stm.setString(2, account.getName());
                        stm.setString(3, account.getPhoneNumber());
                        stm.setString(4, account.getSex());
                        stm.setString(5, account.getAdress());
                        stm.setDate(6, account.getBirthDate());
                        stm.setString(7, account.getEmail());
                        stm.setString(8, account.getUsername());
                        stm.setString(9, account.getPassword());
                        stm.setInt(10, account.getRoleID());
                        stm.setBoolean(11, account.isUserStatus());
                        //4. Excute query
                        int row = stm.executeUpdate();
                        //5. Process
                        if (row > 0) {
                              return true;
                        }
                        //end username and password are checked
                  } // end of connection has opend

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

      public boolean deleteAccount(String Username) throws SQLException {
            Connection con = null;
            PreparedStatement stm = null;
            try {
                  con = (Connection) DBHelper.makeConnection();
                  if (con != null) {
                        String sql = "UPDATE Users "
                                + "SET UserStatus = 'False' "
                                + "WHERE Username = ? ";
                        stm = con.prepareStatement(sql);
                        stm.setString(1, Username);
                        int row = stm.executeUpdate();
                        if (row > 0) {
                              return true;
                        }

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

      public void searchAccount(String SearchAccount) throws SQLException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            try {
                  con = (Connection) DBHelper.makeConnection();
                  if (con != null) {
                        String sql = "SELECT Users.UserID, Users.Name, Users.PhoneNumber, Users.Sex, Users.Adress, Users.BirthDate, Users.Email, Users.Username, Users.Password, Users.RoleID, Role.Rolename, Users.UserStatus "
                                + "FROM Users JOIN Role "
                                + "ON Users.RoleID = Role.RoleID "
                                + "WHERE Name LIKE ? AND UserStatus = 'True' ";
                        stm = con.prepareStatement(sql);
                        stm.setString(1, "%" + SearchAccount + "%");
                        rs = stm.executeQuery();
                  }
                  while (rs.next()) {
                        String UserID = rs.getString("UserID");
                        String Name = rs.getString("Name");
                        String PhoneNumber = rs.getString("PhoneNumber");
                        String Sex = rs.getString("Sex");
                        String Adress = rs.getString("Adress");
                        Date BirthDate = rs.getDate("BirthDate");
                        String Email = rs.getString("Email");
                        String Username = rs.getString("Username");
                        String Password = rs.getString("Password");
                        int RoleID = rs.getInt("RoleID");
                        String RoleName = rs.getString("Rolename");
                        Boolean UserStatus = rs.getBoolean("UserStatus");
                        AccountDTO account = new AccountDTO(UserID, Name, PhoneNumber, Sex, Adress, BirthDate, Email, Username, Password, RoleID, RoleName, UserStatus);
                        if (this.listAccount == null) {
                              this.listAccount = new ArrayList<AccountDTO>();
                        }
                        this.listAccount.add(account);
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
                        DBHelper.closeConnection(con);
                  }
            }
      }

}
