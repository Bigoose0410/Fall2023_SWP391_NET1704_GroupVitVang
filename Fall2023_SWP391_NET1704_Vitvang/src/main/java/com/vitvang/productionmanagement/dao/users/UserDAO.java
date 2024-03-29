/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vitvang.productionmanagement.dao.users;

import com.vitvang.productionmanagement.model.UserDTO;
import com.vitvang.productionmanagement.model.UserInformationDTO;
import com.vitvang.productionmanagement.model.UserOrderDTO;
import com.vitvang.productionmanagement.util.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.crypto.*;
import javax.crypto.spec.SecretKeySpec;
import javax.naming.NamingException;

public class UserDAO implements Serializable {

      public String EncodePass(String Password) throws Exception {
            String secretKey = "ThisIsASecretKey";
            String encryptPass = "";
            byte[] encryptedText = encrypt(Password, secretKey);
//            String decryptedText = decrypt(encryptedText, secretKey);
            encryptPass = bytesToHex(encryptedText);
            return encryptPass;
      }

      public static byte[] encrypt(String plainText, String secretKey) throws Exception {
            SecretKeySpec key = new SecretKeySpec(secretKey.getBytes(), "AES");
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
            cipher.init(Cipher.ENCRYPT_MODE, key);
            return cipher.doFinal(plainText.getBytes());
      }

      public static String decrypt(byte[] cipherText, String secretKey) throws Exception {
            SecretKeySpec key = new SecretKeySpec(secretKey.getBytes(), "AES");
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
            cipher.init(Cipher.DECRYPT_MODE, key);
            return new String(cipher.doFinal(cipherText));
      }

      public static String bytesToHex(byte[] bytes) {
            StringBuilder result = new StringBuilder();
            for (byte aByte : bytes) {
                  result.append(String.format("%05xu", aByte));
            }
            return result.toString();
      }

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
                              Boolean UserStatus = rs.getBoolean("UserStatus");
                              result = new UserDTO(UserID, Name, PhoneNumber, Sex, Adress, BirthDate, Email, Username, Password, RoleID, UserStatus);
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

      public String NewestCustomer()
              throws SQLException, NamingException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            String newestCustomer = "";
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {
                        String sql = "Select top 1 * "
                                + "                               From Users "
                                + "                                Where RoleID like '4' "
                                + "                            Order by UserID desc ";
                        stm = con.prepareStatement(sql);
                        rs = stm.executeQuery();
                        if (rs.next()) {
                              newestCustomer = rs.getString("UserID");
                              return newestCustomer;
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
            return newestCustomer;
      }

      public void getAllCustomer()
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
                                + "Where RoleID = 4 ";
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

      List<UserInformationDTO> listUserInformation;

      public List<UserInformationDTO> getUserInformation() {
            return listUserInformation;
      }

      public void showCustomerInformation(String UserID)
              throws SQLException, NamingException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            UserInformationDTO result = null;
            try {
                  //1. Make connection
                  con = (Connection) DBHelper.makeConnection();
                  if (con != null) {
                        //2. create SQL statement string
                        String sql = "SELECT *, Cage.Name AS 'Cage Name' " // phai co cach sau username
                                + "FROM Users JOIN UserOrder "
                                + "ON Users.UserID = UserOrder.UserID "
                                + "JOIN OrderDetail "
                                + "ON UserOrder.OrderID = OrderDetail.OrderID "
                                + "JOIN Cage ON OrderDetail.CageID = Cage.CageID "
                                + "WHERE Users.UserID = ?";
//                                + "Where UserName like ? ";
//                                + "And RoleID = ? ";
                        //3. Create statement object
                        stm = con.prepareStatement(sql);
                        stm.setString(1, UserID);
//                        stm.setInt(2, roleID);
                        //4. Excute query
                        rs = stm.executeQuery();
                        //5. Process
                        while (rs.next()) {
//                              String UserID = rs.getString("UserID");
                              String Name = rs.getString("Name");
                              String PhoneNumber = rs.getString("PhoneNumber");
                              String Sex = rs.getString("Sex");
                              String Adress = rs.getString("Adress");
                              Date BirthDate = rs.getDate("BirthDate");
                              String Email = rs.getString("Email");
                              String UserName = rs.getString("Username");
                              String Password = rs.getString("Password");
                              int RoleID = rs.getInt("RoleID");
                              String OrderID = rs.getString("OrderID");
                              String CageID = rs.getString("CageID");
                              String CageName = rs.getString("Cage Name");
                              int Quantity = rs.getInt("Quantity");
                              String OrderDetailStatus = rs.getString("OrderDetailStatus");

                              UserInformationDTO user = new UserInformationDTO(UserID, Name, PhoneNumber, Sex, Adress, BirthDate, Email, UserName, Password, RoleID, OrderID, CageID, Quantity, OrderDetailStatus, CageName);
                              if (this.listUserInformation == null) {
                                    this.listUserInformation = new ArrayList<UserInformationDTO>();
                              }
                              this.listUserInformation.add(user);
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

      List<UserInformationDTO> listCustomerHaveOrder;

      public List<UserInformationDTO> getListCustomerHaveOrder() {
            return listCustomerHaveOrder;
      }

      public void getCustomerHaveOrder(String searchValue) throws SQLException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            try {
                  con = (Connection) DBHelper.makeConnection();
                  if (con != null) {
                        if (searchValue == null) {
                              String sql = "SELECT Users.* "
                                      + "FROM Users "
                                      + "WHERE Users.RoleID = 4";
                              stm = con.prepareStatement(sql);
                              rs = stm.executeQuery();
                              while (rs.next()) {
                                    String UserID = rs.getString("UserID");
                                    String Name = rs.getString("Name");
                                    String PhoneNumber = rs.getString("PhoneNumber");
                                    String Sex = rs.getString("Sex");
                                    String Address = rs.getString("Adress");
                                    Date BirthDate = rs.getDate("BirthDate");
                                    String Email = rs.getString("Email");
                                    Boolean UserStatus = rs.getBoolean("UserStatus");
                                    UserInformationDTO cus_order = new UserInformationDTO(UserID, Name, PhoneNumber, Sex, Address, BirthDate, Email, UserStatus);
                                    if (this.listCustomerHaveOrder == null) {
                                          this.listCustomerHaveOrder = new ArrayList<UserInformationDTO>();
                                    }
                                    this.listCustomerHaveOrder.add(cus_order);
                              }
                        } else {
                              String sql = "SELECT Users.* "
                                      + "FROM Users "
                                      + "WHERE Users.RoleID = 4 AND Name LIKE ?";
                              stm = con.prepareStatement(sql);
                              stm.setString(1, "%" + searchValue + "%");
                              rs = stm.executeQuery();
                              while (rs.next()) {
                                    String UserID = rs.getString("UserID");
                                    String Name = rs.getString("Name");
                                    String PhoneNumber = rs.getString("PhoneNumber");
                                    String Sex = rs.getString("Sex");
                                    String Address = rs.getString("Adress");
                                    Date BirthDate = rs.getDate("BirthDate");
                                    String Email = rs.getString("Email");
                                    Boolean UserStatus = rs.getBoolean("UserStatus");
                                    UserInformationDTO cus_order = new UserInformationDTO(UserID, Name, PhoneNumber, Sex, Address, BirthDate, Email, UserStatus);
                                    if (this.listCustomerHaveOrder == null) {
                                          this.listCustomerHaveOrder = new ArrayList<UserInformationDTO>();
                                    }
                                    this.listCustomerHaveOrder.add(cus_order);
                              }
                        }
                  }
            } finally {
                  if (con != null) {
                        con.close();
                        DBHelper.closeConnection(con);
                  }
                  if (stm != null) {
                        stm.close();
                  }
                  if (rs != null) {
                        rs.close();
                  }
            }
      }

      public void getInforCustomerHaveOrder(String UserID) throws SQLException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;

            try {
                  con = (Connection) DBHelper.makeConnection();
                  if (con != null) {
                        String sql = "SELECT Users.* "
                                + "FROM Users "
                                + "WHERE Users.RoleID = 4 AND USers.UserID = ?";
                        stm = con.prepareStatement(sql);
                        stm.setString(1, UserID);
                        rs = stm.executeQuery();
                        while (rs.next()) {
//                              String UserID = rs.getString("UserID");
                              String Name = rs.getString("Name");
                              String PhoneNumber = rs.getString("PhoneNumber");
                              String Sex = rs.getString("Sex");
                              String Address = rs.getString("Adress");
                              Date BirthDate = rs.getDate("BirthDate");
                              String Email = rs.getString("Email");
                              Boolean UserStatus = rs.getBoolean("UserStatus");
                              UserInformationDTO cus_order = new UserInformationDTO(UserID, Name, PhoneNumber, Sex, Address, BirthDate, Email, UserStatus);
                              if (this.listCustomerHaveOrder == null) {
                                    this.listCustomerHaveOrder = new ArrayList<UserInformationDTO>();
                              }
                              this.listCustomerHaveOrder.add(cus_order);
                        }
                  }
            } finally {
                  if (con != null) {
                        con.close();
                        DBHelper.closeConnection(con);
                  }
                  if (stm != null) {
                        stm.close();
                  }
                  if (rs != null) {
                        rs.close();
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

      public boolean createNewAccountCustomer(UserDTO user)
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

                        String sql = "DECLARE @CustomerID NVARCHAR(10) "
                                + "SET @CustomerID = dbo.GetNextCustomerID() "
                                + "INSERT INTO Users(UserID, Name, PhoneNumber, Sex, Adress, BirthDate, Email, Username, Password, RoleID, UserStatus) "
                                + "VALUES (@CustomerID, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                        //3. Create statement object
                        stm = con.prepareStatement(sql);
                        stm.setString(1, user.getName());
                        stm.setString(2, user.getPhoneNumber());
                        stm.setString(3, user.getSex());
                        stm.setString(4, user.getAdress());
                        stm.setDate(5, user.getBirthDate());
                        stm.setString(6, user.getEmail());
                        stm.setString(7, user.getUsername());
                        stm.setString(8, user.getPassword());
                        stm.setInt(9, user.getRoleID());
                        stm.setBoolean(10, user.isUserStatus());
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

      public boolean createNewAccountCustomerWithRole(UserDTO user)
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

                        String sql = "DECLARE @CustomerID NVARCHAR(10) "
                                + "SET @CustomerID = dbo.GetNextCustomerIDWithRoleID(4) "
                                + "INSERT INTO Users(UserID, Name, PhoneNumber, Sex, Adress, BirthDate, Email, Username, Password, RoleID, UserStatus) "
                                + "VALUES (@CustomerID, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                        //3. Create statement object
                        stm = con.prepareStatement(sql);
                        stm.setString(1, user.getName());
                        stm.setString(2, user.getPhoneNumber());
                        stm.setString(3, user.getSex());
                        stm.setString(4, user.getAdress());
                        stm.setDate(5, user.getBirthDate());
                        stm.setString(6, user.getEmail());
                        stm.setString(7, user.getUsername());
                        stm.setString(8, user.getPassword());
                        stm.setInt(9, user.getRoleID());
                        stm.setBoolean(10, user.isUserStatus());
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

      public boolean createNewAccountAdmin(UserDTO user)
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

                        String sql = "DECLARE @AdminID NVARCHAR(10) "
                                + "SET @AdminID = dbo.GetNextAdminIDWithRoleID(1) "
                                + "INSERT INTO Users(UserID, Name, PhoneNumber, Sex, Adress, BirthDate, Email, Username, Password, RoleID, UserStatus) "
                                + "VALUES (@AdminID, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                        //3. Create statement object
                        stm = con.prepareStatement(sql);
                        stm.setString(1, user.getName());
                        stm.setString(2, user.getPhoneNumber());
                        stm.setString(3, user.getSex());
                        stm.setString(4, user.getAdress());
                        stm.setDate(5, user.getBirthDate());
                        stm.setString(6, user.getEmail());
                        stm.setString(7, user.getUsername());
                        stm.setString(8, user.getPassword());
                        stm.setInt(9, user.getRoleID());
                        stm.setBoolean(10, user.isUserStatus());
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

      public boolean createNewAccountStaff(UserDTO user)
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

                        String sql = "DECLARE @StaffID NVARCHAR(10) "
                                + "SET @StaffID = dbo.GetNextStaffIDWithRoleID(2) "
                                + "INSERT INTO Users(UserID, Name, PhoneNumber, Sex, Adress, BirthDate, Email, Username, Password, RoleID, UserStatus) "
                                + "VALUES (@StaffID, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                        //3. Create statement object
                        stm = con.prepareStatement(sql);
                        stm.setString(1, user.getName());
                        stm.setString(2, user.getPhoneNumber());
                        stm.setString(3, user.getSex());
                        stm.setString(4, user.getAdress());
                        stm.setDate(5, user.getBirthDate());
                        stm.setString(6, user.getEmail());
                        stm.setString(7, user.getUsername());
                        stm.setString(8, user.getPassword());
                        stm.setInt(9, user.getRoleID());
                        stm.setBoolean(10, user.isUserStatus());
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

      public boolean createNewAccountManager(UserDTO user)
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

                        String sql = "DECLARE @ManagerID NVARCHAR(10) "
                                + "SET @ManagerID = dbo.GetNextManagerIDWithRoleID(3) "
                                + "INSERT INTO Users(UserID, Name, PhoneNumber, Sex, Adress, BirthDate, Email, Username, Password, RoleID, UserStatus) "
                                + "VALUES (@ManagerID, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                        //3. Create statement object
                        stm = con.prepareStatement(sql);
                        stm.setString(1, user.getName());
                        stm.setString(2, user.getPhoneNumber());
                        stm.setString(3, user.getSex());
                        stm.setString(4, user.getAdress());
                        stm.setDate(5, user.getBirthDate());
                        stm.setString(6, user.getEmail());
                        stm.setString(7, user.getUsername());
                        stm.setString(8, user.getPassword());
                        stm.setInt(9, user.getRoleID());
                        stm.setBoolean(10, user.isUserStatus());
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
