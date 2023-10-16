/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Process;

import Model.ProcessDTO;
import Model.ProcessNewOrderDTO;
import Util.DBHelper;
import Util.tool;
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
//                                String sql = "Select OrderID, StartDate, EndDate, TotalPrice, Address, StatusProgress, CustomerID "
//                                        + "From Orderr "
//                                        + "Where OrderID Like ? ";
                        String sql = "SELECT UserOrder.UserID, Orderr.OrderID, OrderDetail.CageID, Orderr.StartDate, OrderDetail.Quantity, Orderr.StatusProgress "
                                + "FROM UserOrder JOIN Orderr "
                                + "ON UserOrder.OrderID = Orderr.OrderID "
                                + "JOIN OrderDetail "
                                + "ON Orderr.OrderID = OrderDetail.OrderID ";
                        stm = con.prepareStatement(sql);
//                                stm.setString(1, "%" + txtSearchValue + "%");
                        rs = stm.executeQuery();
                        while (rs.next()) {
                              String UserID = rs.getString("UserID");
                              String OrderID = rs.getString("OrderID");
                              String CageID = rs.getString("CageID");
                              Date StartDate = rs.getDate("StartDate");
                              int Quantity = rs.getInt("Quantity");
                              String StatusProgress = rs.getString("StatusProgress");
//                              int TotalPrice = rs.getInt("TotalPrice");
//                              int Quantity = rs.getInt("Quantity");
//                              int Price = rs.getInt("Price");
//                              String StatusProcess = rs.getString("StatusProcess");
//                    RegistrationDTO dto = new RegistrationDTO(username, password, lastname, isadmin);
                              ProcessNewOrderDTO processNewOrder = new ProcessNewOrderDTO(UserID, OrderID, CageID, StartDate, Quantity, StatusProgress);
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

      public void ViewProcessingOrder() throws SQLException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {
//                                String sql = "Select OrderID, StartDate, EndDate, TotalPrice, Address, StatusProgress, CustomerID "
//                                        + "From Orderr "
//                                        + "Where OrderID Like ? ";
                        String sql = "SELECT UserOrder.UserID, Orderr.OrderID, Process.CageID, Process.ProcessID, Process.ProcessName, Process.Status, Process.StartDate, Process.EndDate, Process.NumberOfEmployee, Orderr.StatusProgress "
                                + "FROM UserOrder JOIN Orderr "
                                + "ON UserOrder.OrderID = Orderr.OrderID "
                                + "JOIN Process "
                                + "ON Orderr.OrderID = Process.OrderID ";
                        stm = con.prepareStatement(sql);
//                                stm.setString(1, "%" + txtSearchValue + "%");
                        rs = stm.executeQuery();
                        while (rs.next()) {
                              String UserID = rs.getString("UserID");
                              String OrderID = rs.getString("OrderID");
                              String CageID = rs.getString("CageID");
                              String ProcessID = rs.getString("ProcessID");
                              String ProcessName = rs.getString("ProcessName");
                              Date StartDate = rs.getDate("StartDate");
                              Date EndDate = rs.getDate("EndDate");
                              String Status = rs.getString("Status");
                              int NumberOfEmployee = rs.getInt("NumberOfEmployee");
                              String StatusProgress = rs.getString("StatusProgress");
//                              int TotalPrice = rs.getInt("TotalPrice");
//                              int Quantity = rs.getInt("Quantity");
//                              int Price = rs.getInt("Price");
//                              String StatusProcess = rs.getString("StatusProcess");
//                    RegistrationDTO dto = new RegistrationDTO(username, password, lastname, isadmin);
                              ProcessDTO process = new ProcessDTO(UserID, OrderID, CageID, ProcessID, ProcessName, Status, StartDate, EndDate, NumberOfEmployee, StatusProgress);
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
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {
                        String sql = "UPDATE Orderr SET StatusProgress = 'Processing' "
                                + " FROM Orderr INNER JOIN Process ON (Orderr.OrderID = Process.OrderID) "
                                + " Where Orderr.OrderID = ? AND Process.CageID = ? ";
                        stm = con.prepareStatement(sql);
//                        stm.setString(1, password);
//                        stm.setString(2, lastname);
//                        stm.setBoolean(3, role);
                        stm.setString(1, OrderID);
                        stm.setString(2, CageID);
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
      public boolean AutoAddProcess(String OrderID, String CageID, Date StartDate, int Quantity)
              throws SQLException, NamingException {
            Connection con = null;
            PreparedStatement stm1 = null;
            PreparedStatement stm2 = null;
            ResultSet rs = null;
            int row1 = 0;
            int row2 = 0;
            Date step1 =tool.calculateProcess1Date(StartDate,Quantity);
            Date step2 =tool.calculateProcess2Date(step1,Quantity);
            Date step3 =tool.calculateProcess3Date(step2,Quantity);
            Date step4 =tool.calculateProcess4Date(step3,Quantity);
            String[] processIds = {"P001", "P002", "P003", "P004"};
            Date[] startDate = {StartDate, step1, step2, step3};
            Date[] endDate = {step1, step2, step3, step4};
            String[] processName = {"Định hình khung", "Tạo hình", "Trang trí", "Kiểm tra chất lượng"};
            String[] status = {"Processing", "Not Yet", "Not Yet"};
            String[][] phrases = {
                  {"nep chan", "chan de", "day long", "khay de"},
                  {"thanh tru va dinh", "dam mai", "co dinh khung"},
                  {"cua long gan moc", "gan nan vao de dinh", "trang tri dinh long", "son pu"},
                  {"kiem tra chuc nang", "kiem tra do ben", "kiem tra kich thuoc"}
            };
            try {
                  //1. Make connection
                  con = (Connection) DBHelper.makeConnection();
                  if (con != null) {
                        for (int i = 0; i < processIds.length; i++) {
                              String sql1 = "Insert into Process"
                                      + " (ProcessID, ProcessName, OrderID, Phrase, CageID, Status, StartDate, EndDate)  VALUES (? , ?, ?, ?, ?, ?, ?, ?)";
                              stm1 = con.prepareStatement(sql1);
                              for (String phrase : phrases[i]) {
                                    stm1.setString(1, processIds[i]);
                                    stm1.setString(2, processName[i]);
                                    stm1.setString(3, OrderID);
                                    stm1.setString(4, phrase);
                                    stm1.setString(5, CageID);
                                    stm1.setString(6, status[i]);
                                    stm1.setDate(7, startDate[i]);
                                    stm1.setDate(8, endDate[i]);
                                    row1 = stm1.executeUpdate();
                              }
                        }
//                        String sql2 = "UPDATE Orderr " +
//                                    " SET StatusProgress = 'Processing' " +
//                                    " FROM Orderr " +
//                                    " Where Orderr.OrderID = ? ";
//                        stm2 = con.prepareStatement(sql2);
//                        stm2.setString(1, OrderID);
//                        row2 = stm2.executeUpdate();
//
//                        if (row1 > 0 && row2 > 0) {
//                              return true;
//                        }
                  }

            } finally {
                  if (rs != null) {
                        rs.close();
                  }
                  if (stm1 != null) {
                        stm1.close();
                  }
//                  if (stm2 != null) {
//                        stm2.close();
//                  }

                  if (con != null) {
                        con.close();
                        DBHelper.closeConnection(con);
                  }
            }
            return false;
      }
}
