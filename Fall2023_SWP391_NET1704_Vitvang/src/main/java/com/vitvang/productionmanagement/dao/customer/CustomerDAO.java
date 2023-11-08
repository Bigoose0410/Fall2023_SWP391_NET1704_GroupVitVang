/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vitvang.productionmanagement.dao.customer;

import com.vitvang.productionmanagement.model.AccountDTO;
import com.vitvang.productionmanagement.model.CageDTO;
import com.vitvang.productionmanagement.model.ProcessDTO;
import com.vitvang.productionmanagement.model.UserInformationDTO;
import com.vitvang.productionmanagement.util.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CustomerDAO implements Serializable {

      List<AccountDTO> listAccount;

      public List<AccountDTO> getListAccount() {
            return listAccount;
      }

      public void getCustomerAccount(String Username) throws SQLException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;

            try {
                  con = (Connection) DBHelper.makeConnection();
                  if (con != null) {
                        String sql = "SELECT Users.UserID, Users.Name, Users.PhoneNumber, Users.Sex, Users.Adress, Users.BirthDate, Users.Email, Users.Username, Users.Password, Users.RoleID, Role.Rolename "
                                + "FROM Users JOIN Role "
                                + "ON Users.RoleID = Role.RoleID AND Users.UserStatus = 'True' "
                                + "JOIN UserOrder ON Users.UserID = UserOrder.UserID "
                                + "WHERE Users.Username = ? ";
                        stm = con.prepareStatement(sql);
                        stm.setString(1, Username);
                        rs = stm.executeQuery();
                        while (rs.next()) {
                              String UserID = rs.getString("UserID");
                              String Name = rs.getString("Name");
                              String PhoneNumber = rs.getString("PhoneNumber");
                              String Sex = rs.getString("Sex");
                              String Adress = rs.getString("Adress");
                              Date BirthDate = rs.getDate("BirthDate");
                              String Email = rs.getString("Email");
//                              String Username = rs.getString("Username");
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
                  }
            } finally {
                  if (stm != null) {
                        stm.close();
                  }
                  if (rs != null) {
                        rs.close();
                  }
                  if (con != null) {
                        con.close();
                        DBHelper.closeConnection(con);
                  }
            }
      }

      List<CageDTO> listOrder;

      public List<CageDTO> getListOrder() {
            return listOrder;
      }

      public void getCustomerOrder(String UserID) throws SQLException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;

            try {
                  con = (Connection) DBHelper.makeConnection();
                  if (con != null) {
                        String sql = "SELECT UserOrder.OrderID, Cage.*, OrderDetail.Quantity, OrderDetail.OrderDetailStatus, Orderr.StatusProgress "
                                + "FROM UserOrder JOIN OrderDetail "
                                + "ON UserOrder.OrderID = OrderDetail.OrderID "
                                + "JOIN Cage "
                                + "ON OrderDetail.CageID = Cage.CageID "
                                + "JOIN Orderr "
                                + "ON UserOrder.OrderID = Orderr.OrderID "
                                + "WHERE UserOrder.UserID = ? ";
                        stm = con.prepareStatement(sql);
                        stm.setString(1, UserID);
                        rs = stm.executeQuery();
                        while (rs.next()) {
                              String OrderID = rs.getString("OrderID");
                              String CageID = rs.getString("CageID");
                              String Name = rs.getString("Name");
                              int Price = rs.getInt("Price");
                              String Origin = rs.getString("Origin");
                              String Description = rs.getString("Description");
                              int Quantity = rs.getInt("Quantity");
                              String OrderDetailStatus = rs.getString("OrderDetailStatus");
                              String StatusProgress = rs.getString("StatusProgress");
                              CageDTO cage = new CageDTO(OrderID, CageID, Name, Price, Origin, Description, Quantity, OrderDetailStatus, StatusProgress);
                              if (this.listOrder == null) {
                                    this.listOrder = new ArrayList<CageDTO>();
                              }
                              this.listOrder.add(cage);
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

      List<ProcessDTO> listOrdersProcess;

      public List<ProcessDTO> getListOrdersProcess() {
            return listOrdersProcess;
      }

      public void ViewProcessingOrder(String OrderID, String CageID, String CageID1) throws SQLException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {

                        String sql = "SELECT UserOrder.UserID,Users.Name as 'Customer', Orderr.OrderID, OrderDetail.CageID ,Cage.Name as 'Cage Name', Process.Phrase , Process.ProcessID, ProcessName,Process.CompletedQuantity "
                                + ", Process.QuanityNeedProduct, Process.StartDate, Process.EndDate, OrderDetail.Quantity, Process.NumberOfEmployee, OrderDetail.OrderDetailStatus, Process.Status, Orderr.StatusProgress "
                                + "FROM UserOrder JOIN Orderr "
                                + "ON UserOrder.OrderID = Orderr.OrderID "
                                + "JOIN OrderDetail "
                                + "ON Orderr.OrderID = OrderDetail.OrderID "
                                + "JOIN Process "
                                + "ON Orderr.OrderID = Process.OrderID "
                                + "JOIN Users "
                                + "ON UserOrder.UserID = Users.UserID "
                                + "JOIN Cage "
                                + "ON Process.CageID = Cage.CageID "
                                + "WHERE OrderDetail.OrderID = ? AND OrderDetail.CageID = ? AND Process.CageID = ? ";
                        stm = con.prepareStatement(sql);
                        stm.setString(1, OrderID);
                        stm.setString(2, CageID);
                        stm.setString(3, CageID1);
                        rs = stm.executeQuery();
                        while (rs.next()) {
                              String UserID = rs.getString("UserID");
                              String cusName = rs.getString("Customer");
                              String ProcessID = rs.getString("ProcessID");
                              String ProcessName = rs.getString("ProcessName");
                              String Phrase = rs.getString("Phrase");
                              int CompletedQuantity = rs.getInt("CompletedQuantity");
                              int Quantity = rs.getInt("QuanityNeedProduct");
                              Date StartDate = rs.getDate("StartDate");
                              Date EndDate = rs.getDate("EndDate");
                              int NumberOfEmployee = rs.getInt("NumberOfEmployee");
                              String OrderDetailStatus = rs.getString("OrderDetailStatus");
                              String Status = rs.getString("Status");
                              String StatusProgress = rs.getString("StatusProgress");
                              String CageName = rs.getString("Cage Name");
                              ProcessDTO process = new ProcessDTO(UserID, cusName, OrderID, CageID, CageName, Phrase, ProcessID, ProcessName, CompletedQuantity,
                                      Quantity, StartDate, EndDate, Status, NumberOfEmployee, OrderDetailStatus, StatusProgress);
                              if (this.listOrdersProcess == null) {
                                    this.listOrdersProcess = new ArrayList<ProcessDTO>();
                              }
                              this.listOrdersProcess.add(process);

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

}
