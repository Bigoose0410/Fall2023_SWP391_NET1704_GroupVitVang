/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Process;

import Model.ProcessDTO;
import Util.DBHelper;
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
public class ProcessDAO implements Serializable {

      List<ProcessDTO> listOrdersProcess;

      public List<ProcessDTO> getListOrdersProcess() {
            return listOrdersProcess;
      }

      public void ViewProcessOrder() throws SQLException {
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
                        String sql = "SELECT UserOrder.UserID, Orderr.OrderID, Process.CageID, Process.ProcessID, Process.ProcessName, Process.StartDate, Process.EndDate, Process.NumberOfEmployee, Orderr.StatusProgress "
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
                              int NumberOfEmployee = rs.getInt("NumberOfEmployee");
                              String StatusProgress = rs.getString("StatusProgress");
//                              int TotalPrice = rs.getInt("TotalPrice");
//                              int Quantity = rs.getInt("Quantity");
//                              int Price = rs.getInt("Price");
//                              String StatusProcess = rs.getString("StatusProcess");
//                    RegistrationDTO dto = new RegistrationDTO(username, password, lastname, isadmin);
                              ProcessDTO process = new ProcessDTO(UserID, OrderID, CageID, ProcessID, ProcessName, StartDate, EndDate, NumberOfEmployee, StatusProgress);
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
