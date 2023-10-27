/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vitvang.productionmanagement.dao.process;

import com.vitvang.productionmanagement.model.DesignForProcessDTO;
import com.vitvang.productionmanagement.model.ProcessDTO;
import com.vitvang.productionmanagement.model.ProcessNewOrderDTO;
import com.vitvang.productionmanagement.util.DBHelper;
import com.vitvang.productionmanagement.util.tool;
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
public class ProcessDAO implements Serializable {

      List<ProcessNewOrderDTO> listProcessNewOrder;

      public List<ProcessNewOrderDTO> getListProcessNewOrder() {
            return listProcessNewOrder;
      }

      public void ViewNewOrder() throws SQLException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {

                        String sql = "SELECT Distinct UserOrder.UserID, Orderr.OrderID, OrderDetail.CageID, Orderr.StartDate, OrderDetail.Quantity, OrderDetail.OrderDetailStatus "
                                + "FROM UserOrder JOIN Orderr "
                                + "ON UserOrder.OrderID = Orderr.OrderID "
                                + "JOIN OrderDetail "
                                + "ON Orderr.OrderID = OrderDetail.OrderID ";
                        stm = con.prepareStatement(sql);
                        rs = stm.executeQuery();
                        while (rs.next()) {
                              String UserID = rs.getString("UserID");
                              String OrderID = rs.getString("OrderID");
                              String CageID = rs.getString("CageID");
                              Date StartDate = rs.getDate("StartDate");
                              int Quantity = rs.getInt("Quantity");
                              String OrderDetailStatus = rs.getString("OrderDetailStatus");

                              ProcessNewOrderDTO processNewOrder = new ProcessNewOrderDTO(UserID, OrderID, CageID, StartDate, Quantity, OrderDetailStatus);
                              if (this.listProcessNewOrder == null) {
                                    this.listProcessNewOrder = new ArrayList<ProcessNewOrderDTO>();
                              }
                              this.listProcessNewOrder.add(processNewOrder);
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
//                        String sql = "SELECT UserOrder.UserID, Orderr.OrderID, OrderDetail.CageID, Process.Phrase  ,Process.ProcessID, ProcessName, Process.StartDate, Process.EndDate, OrderDetail.Quantity, Process.NumberOfEmployee,OrderDetail.OrderDetailStatus, Process.Status, Orderr.StatusProgress "
//                                + "FROM UserOrder JOIN Orderr "
//                                + "ON UserOrder.OrderID = Orderr.OrderID "
//                                + "JOIN OrderDetail "
//                                + "ON Orderr.OrderID = OrderDetail.OrderID "
//                                + "JOIN Process "
//                                + "ON Orderr.OrderID = Process.OrderID "
//                                + "WHERE OrderDetail.OrderID = ? AND OrderDetail.CageID = ? AND Process.CageID = ? ";
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
                              String cageName = rs.getString("Cage Name");
                              ProcessDTO process = new ProcessDTO(UserID, cusName, OrderID, CageID, cageName, Phrase, ProcessID, ProcessName, CompletedQuantity,
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

      public boolean updateStatusNewOrder(String OrderID, String CageID) throws SQLException {
            Connection con = null;
            PreparedStatement stm = null;
            PreparedStatement stm1 = null;
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {
                        String sql = "UPDATE OrderDetail SET OrderDetailStatus = 'Processing' "
                                + " FROM OrderDetail "
                                + "  Where OrderDetail.OrderID = ? AND OrderDetail.CageID = ? ";
                        String sql1 = " UPDATE Orderr SET StatusProgress = 'Processing' "
                                + " FROM Orderr "
                                + " Where Orderr.OrderID = ? ";
                        stm = con.prepareStatement(sql);
                        stm1 = con.prepareStatement(sql1);
                        stm.setString(1, OrderID);
                        stm.setString(2, CageID);
                        stm1.setString(1, OrderID);
                        int row = stm.executeUpdate();
                        int row1 = stm1.executeUpdate();
                        if (row > 0 && row1 > 0) {
                              return true;
                        }
                        // hoan chinh roi thi excutequery
                  }
            } finally {
                  if (stm != null && stm1 != null) {
                        stm.close();
                        stm1.close();
                  }
                  if (con != null) {
                        con.close();
                  }
            }
            return false;
      }

      public boolean updateTimeProcess(String ProcessID, String OrderID, String CageID, Date StartDate, Date EndDate, int NumberOfEmployee) throws SQLException {
            Connection con = null;
            PreparedStatement stm = null;
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {
                        String sql = "UPDATE Process "
                                + "SET StartDate = ? ,EndDate =?, NumberOfEmployee = ? "
                                + "WHERE ProcessID = ? AND OrderID = ? AND CageID = ? ";
                        stm = con.prepareStatement(sql);
                        stm.setDate(1, StartDate);
                        stm.setDate(2, EndDate);
                        stm.setInt(3, NumberOfEmployee);
                        stm.setString(4, ProcessID);
                        stm.setString(5, OrderID);
                        stm.setString(6, CageID);
                        int row = stm.executeUpdate();
                        if (row > 0) {
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

      public boolean updateQuantityCompleted(int quanCompleted, String ProcessID, String OrderID, String CageID) throws SQLException {
            Connection con = null;
            PreparedStatement stm = null;
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {
                        String sql = "UPDATE Process SET CompletedQuantity = ? "
                                + "  WHERE ProcessID = ? AND OrderID = ? AND CageID = ? ";
                        stm = con.prepareStatement(sql);
                        stm.setInt(1, quanCompleted);
                        stm.setString(2, ProcessID);
                        stm.setString(3, OrderID);
                        stm.setString(4, CageID);
                        int row = stm.executeUpdate();
                        if (row > 0) {
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

      public boolean updateStatusProcess(String Status, String ProcessID, String OrderID, String CageID) throws SQLException {
            Connection con = null;
            PreparedStatement stm = null;
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {
                        String sql = "UPDATE Process SET Status = ? "
                                + "  WHERE ProcessID = ? AND OrderID = ? AND CageID = ? ";
                        stm = con.prepareStatement(sql);
                        stm.setString(1, Status);
                        stm.setString(2, ProcessID);
                        stm.setString(3, OrderID);
                        stm.setString(4, CageID);
                        int row = stm.executeUpdate();
                        if (row > 0) {
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

      public boolean updateStatusProcessToDone(String Status, String ProcessID, String OrderID, String CageID, boolean lastStep) throws SQLException {
            Connection con = null;
            PreparedStatement stm = null;
            PreparedStatement stm1 = null;
            int row = 0;
            int row1 = 0;
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {
                        String sql = "UPDATE Process SET Status = ? "
                                + "  WHERE ProcessID = ? AND OrderID = ? AND CageID = ? ";
                        stm = con.prepareStatement(sql);
                        stm.setString(1, Status);
                        stm.setString(2, ProcessID);
                        stm.setString(3, OrderID);
                        stm.setString(4, CageID);
                        row = stm.executeUpdate();

                        if (lastStep != true) {
                              String sql1 = "UPDATE Process SET Status = 'Processing' "
                                      + "  WHERE ProcessID = ? AND OrderID = ? AND CageID = ? ";
                              String nextProcessID = tool.getNextProcessID(ProcessID);
                              stm1 = con.prepareStatement(sql1);
                              stm1.setString(1, nextProcessID);
                              stm1.setString(2, OrderID);
                              stm1.setString(3, CageID);
                              row1 = stm1.executeUpdate();
                        } else {
                              String sql1 = "UPDATE OrderDetail SET OrderDetailStatus = 'Done' "
                                      + "  WHERE OrderID = ? AND CageID = ? ";
                              stm1 = con.prepareStatement(sql1);
                              stm1.setString(1, OrderID);
                              stm1.setString(2, CageID);
                              row1 = stm1.executeUpdate();
                        }
                        if (row > 0 && row1 > 0) {
                              return true;
                        }
                        // hoan chinh roi thi excutequery
                  }
            } finally {
                  if (stm != null && stm1 != null) {
                        stm.close();
                        stm1.close();
                  }
                  if (con != null) {
                        con.close();
                  }
            }
            return false;
      }

      public boolean AutoAddProcess(int ProcessID, String OrderID, String status, Date StartDate, Date Endate, int quanityProduct, DesignForProcessDTO design)
              throws SQLException, NamingException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            boolean result = false;
            String processID = "PR" + String.format("%03d", ProcessID);
            try {
                  //1. Make connection
                  con = (Connection) DBHelper.makeConnection();
                  if (con != null) {

                        String sql = "Insert into Process "
                                + " (ProcessID, ProcessName, OrderID, Phrase, CageID, CompletedQuantity, QuanityNeedProduct, Status, StartDate, EndDate, NumberOfEmployee) "
                                + "VALUES ("
                                + "?, ?, ?, ?, ?, 0, ?, ? ,?, ?, 1"
                                + ")";
                        stm = con.prepareStatement(sql);
                        stm.setString(1, processID);
                        stm.setString(2, design.getDescription());
                        stm.setString(3, OrderID);
                        stm.setString(4, design.getPhrase());
                        stm.setString(5, design.getCageID());
                        stm.setInt(6, quanityProduct);
                        stm.setString(7, status);
                        stm.setDate(8, StartDate);
                        stm.setDate(9, Endate);
                        int rowEffect = stm.executeUpdate();
                        if (rowEffect > 0) {
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
                        DBHelper.closeConnection(con);
                  }
            }
            return result;
      }
}