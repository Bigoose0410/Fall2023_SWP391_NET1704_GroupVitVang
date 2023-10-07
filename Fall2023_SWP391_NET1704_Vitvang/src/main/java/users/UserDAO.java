/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package users;

import Model.UserDTO;
import Model.UserOrderDTO;
import Util.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

public class UserDAO implements Serializable {
      

      public UserDTO checkLogin(String Username, String Password)
              throws SQLException, NamingException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            UserDTO result = null;
            try {
                  //1. Make connection
                  con = (Connection) DBHelper.makeConnection();
                  if (con != null) {
                        //2. create SQL statement string
                        String sql = "Select * " // phai co cach sau username
                                + "From Users "
                                + "Where Username = ? "
                                + "And Password = ? ";
                        //3. Create statement object
                        stm = con.prepareStatement(sql);
                        stm.setString(1, Username);
                        stm.setString(2, Password);
                        //4. Excute query
                        rs = stm.executeQuery();
                        //5. Process
                        if (rs.next()) {
                              String UserID = rs.getString("UserID");
                              String Name = rs.getString("Name");
                              String PhoneNumber = rs.getString("PhoneNumber");
                              String Sex = rs.getString("Sex");
                              String Adress = rs.getString("Adress");
                              Date BirthDate = rs.getDate("BirthDate");
                              String Email = rs.getString("Email");
                              int RoleID = rs.getInt("RoleID");
                              result = new UserDTO(UserID, Name, PhoneNumber, Sex, Adress, BirthDate, Email, Username, Password, RoleID);
                        }//end username and password are checked
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
                        DBHelper.closeConnection(con);
                  }
            }
            return result;
      }

      List<UserDTO> listUser;

      public List<UserDTO> getListUser() {
            return listUser;
      }
      
      public void searchUserByNameAndRole(String txtSearchName, int roleID)
              throws SQLException, NamingException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            UserDTO result = null;
            try {
                  //1. Make connection
                  con = (Connection) DBHelper.makeConnection();
                  if (con != null) {
                        //2. create SQL statement string
                        String sql = "Select * " // phai co cach sau username
                                + "From Users "
                                + "Where Name like ? "
                                + "And RoleID = ? ";
                        //3. Create statement object
                        stm = con.prepareStatement(sql);
                        stm.setString(1, "%" + txtSearchName + "%");
                        stm.setInt(2, roleID);
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
                              int RoleID = rs.getInt("RoleID");
                              UserDTO user = new UserDTO(UserID, Name, PhoneNumber, Sex, Adress, BirthDate, Email, null, null, RoleID);
                              if (this.listUser == null) {
                                    this.listUser = new ArrayList<UserDTO>();
                              }
                              this.listUser.add(user);
                        }//end username and password are checked
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
                        DBHelper.closeConnection(con);
                  }
            }
      }
      
      public UserDTO queryCusFromUserOrder(String OrderID)
              throws SQLException, NamingException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            UserOrderDTO userInOrder = null;
            UserDTO result = null;
            try {
                  //1. Make connection
                  con = (Connection) DBHelper.makeConnection();
                  if (con != null) {
                        //2. create SQL statement string
                        String sql = "Select * " // phai co cach cuoi
                                + "From UserOrder "
                                + "Where OrderID like ? ";
                        //3. Create statement object
                        stm = con.prepareStatement(sql);
                        stm.setString(1, "%" + OrderID + "%");
                        rs = stm.executeQuery();
                        //5. Process
                        if (rs.next()) {
                              String UserID = rs.getString(1);
                               userInOrder = new UserOrderDTO(UserID, OrderID);
                        }//end query in tbl.UserOrder and get successful CusID
                        
                        sql = "Select * " 
                                + "From Users "
                                + "Where UserID like ? ";
                        //3. Create statement object
                        stm = con.prepareStatement(sql);
                        stm.setString(1, "%" + userInOrder.getUserID() + "%");
                        //4. Excute query
                        rs = stm.executeQuery();
                        //5. Process
                        if (rs.next()) {
                              String UserID = rs.getString("UserID");
                              String Name = rs.getString("Name");
                              String PhoneNumber = rs.getString("PhoneNumber");
                              String Sex = rs.getString("Sex");
                              String Adress = rs.getString("Adress");
                              Date BirthDate = rs.getDate("BirthDate");
                              String Email = rs.getString("Email");
                              result = new UserDTO(UserID, Name, PhoneNumber, Sex, Adress, BirthDate, Email, null, null, 4);
                        }//end username and password are checked
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
                        DBHelper.closeConnection(con);
                  }
            }
            return result;
      }
      
       public boolean createAccount(UserDTO user)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            //1. Make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                //2. create SQL statement string
                
                String sql = "INSERT INTO Users (UserID,Name,PhoneNumber,Sex,Adress,BirthDate,Email,Username,Password,RoleID)  "
                        + "VALUES ("
                        + "?, ?, ? , ?, ?, ?, ?, ?, ?, ?"
                        + ")";
                        
                //3. Create statement object
                stm = con.prepareStatement(sql);
                stm.setString(1, user.getUserID());
                stm.setString(2, user.getName());
                stm.setString(3, user.getPhoneNumber());
                stm.setString(4, user.getSex());
                stm.setString(5, user.getAdress());
                stm.setDate(6, user.getBirthDate());
                stm.setString(7, user.getEmail());
                stm.setString(8, user.getUsername());
                stm.setString(9, user.getPassword());
                stm.setInt(10, user.getRoleID());

                //4. Excute query
                int effectRows = stm.executeUpdate();
                //5. Process
                if (effectRows > 0) {
                    result = true;
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
        return result;
    }
}