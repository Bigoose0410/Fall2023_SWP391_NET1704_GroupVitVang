/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vitvang.productionmanagement.dao.order;

import com.vitvang.productionmanagement.model.DetailOrderDTO;
import com.vitvang.productionmanagement.model.OrderDTO;
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
public class OrderDAO implements Serializable {

      List<DetailOrderDTO> listDetailOrder;

      public List<DetailOrderDTO> getListOrderDetails() {
            return listDetailOrder;
      }

      public String ORDERIDCOUNT() {
            String orderID = "OD" + String.format("%03d", (this.listOrders.size() + 1));
            return orderID;
      }

      public void queryOrderDetail(String SearchValue) throws SQLException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {
                        String sql = "select * "
                                + "from OrderDetail "
                                + "where OrderID like ?";
                        stm = con.prepareStatement(sql);
                        stm.setString(1, "%" + SearchValue + "%");
                        rs = stm.executeQuery();
                        while (rs.next()) {
                              String OrderID = rs.getString("OrderID");
                              String CageID = rs.getString("CageID");
                              int Quantity = rs.getInt("Quantity");

                              DetailOrderDTO detailorder = new DetailOrderDTO(OrderID, CageID, Quantity);
                              if (this.listDetailOrder == null) {
                                    this.listDetailOrder = new ArrayList<DetailOrderDTO>();
                              }
                              this.listDetailOrder.add(detailorder);
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

      public boolean updateOrder(String OrderID, Date StartDate, Date EndDate, String Address, String StatusProgress)
              throws SQLException, NamingException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            boolean result = false;

            try {
                  //1. Make connection
                  con = (Connection) DBHelper.makeConnection();
                  if (con != null) {
                        //2. create SQL statement string
                        String sql = "UPDATE Orderr "
                                + "SET StartDate = ?, EndDate = ?, Address = ?, StatusProgress = ? "
                                + "WHERE OrderID = ? ";
                        //3. Create statement object
                        stm = con.prepareStatement(sql);
                        stm.setDate(1, (java.sql.Date) StartDate);
                        stm.setDate(2, (java.sql.Date) EndDate);
                        stm.setString(3, Address);
                        stm.setString(4, StatusProgress);
                        stm.setString(5, OrderID);
                        //4. Excute query
                        int effectRows = stm.executeUpdate();
                        //5. Process
                        if (effectRows > 0) {
                              result = true;
                        }
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

      List<OrderDTO> listOrders;

      public List<OrderDTO> getListOrders() {
            return listOrders;
      }
      
      public String ORDERIDCOUNT(){
            String orderID = "OD" + String.format("%03d", (this.listOrders.size() + 1));
            return orderID;
      }

      public void searchOrder(String SearchValue) throws SQLException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {
                        String sql = "Select OrderID, StartDate, EndDate, TotalPrice, Address, StatusProgress "
                                + "From Orderr "
                                + "Where OrderID like ?";
                        stm = con.prepareStatement(sql);
                        stm.setString(1, "%" + SearchValue + "%");
                        rs = stm.executeQuery();
                        while (rs.next()) {
                              String OrderID = rs.getString("OrderID");
                              Date StartDate = rs.getDate("StartDate");
                              Date EndDate = rs.getDate("EndDate");
                              int TotalPrice = rs.getInt("TotalPrice");
                              String Address = rs.getString("Address");
                              String StatusProgress = rs.getString("StatusProgress");

                              OrderDTO order = new OrderDTO(OrderID, StartDate, EndDate, TotalPrice, Address, StatusProgress);
                              if (this.listOrders == null) {
                                    this.listOrders = new ArrayList<OrderDTO>();
                              }
                              this.listOrders.add(order);

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

      public void OrderHistory() throws SQLException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {
                        String sql = "Select OrderID, StartDate, EndDate, TotalPrice, Address, StatusProgress "
                                + "From Orderr ";
                        stm = con.prepareStatement(sql);
                        rs = stm.executeQuery();
                        while (rs.next()) {
                              String OrderID = rs.getString("OrderID");
                              Date StartDate = rs.getDate("StartDate");
                              Date EndDate = rs.getDate("EndDate");
                              int TotalPrice = rs.getInt("TotalPrice");
                              String Address = rs.getString("Address");
                              String StatusProgress = rs.getString("StatusProgress");

                              OrderDTO order = new OrderDTO(OrderID, StartDate, EndDate, TotalPrice, Address, StatusProgress);
                              if (this.listOrders == null) {
                                    this.listOrders = new ArrayList<OrderDTO>();
                              }
                              this.listOrders.add(order);
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

      public boolean insertOrder(String orderID, Date startDate, int totalprice, Date endDate, String Addres)
              throws SQLException, NamingException {
            Connection con = null;
            PreparedStatement stm = null;
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {
                        String sql = "insert into Orderr (OrderID, StartDate, EndDate, TotalPrice, Address, StatusProgress ) "
                                + "values (?,?,?,?,?, 'new order')";

                        stm = con.prepareStatement(sql);
                        stm.setString(1, orderID);
                        stm.setDate(2, startDate);
                        stm.setDate(3, endDate);
                        stm.setInt(4, totalprice);
                        stm.setString(5, Addres);

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

      public boolean addOrderDetail(String orderId, String CageID, int quantity)
              throws SQLException, NamingException {
            Connection con = null;
            PreparedStatement stm = null;
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {
                        String sql = "insert into OrderDetail(OrderID, CageID, Quantity, OrderDetailStatus) "
                                + "values (?,?,?, 'new order')";

                        stm = con.prepareStatement(sql);
                        stm.setString(1, orderId);
                        stm.setString(2, CageID);
                        stm.setInt(3, quantity);

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

      public boolean addUserOrder(String orderId, String CustomerID)
              throws SQLException, NamingException {
            Connection con = null;
            PreparedStatement stm = null;
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {
                        String sql = "insert into UserOrder(UserID, OrderID ) "
                                + "values (?,?)";

                        stm = con.prepareStatement(sql);
                        stm.setString(1, CustomerID);
                        stm.setString(2, orderId);

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

      public boolean deleteOrder(String OrderID)
              throws SQLException, NamingException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            boolean result = false;

            try {
                  //1. Make connection
                  con = (Connection) DBHelper.makeConnection();
                  if (con != null) {
                        //2. create SQL statement string
                        String sql = "DELETE from DetailOrder "
                                + "WHERE OrderID = ? "
                                + "DELETE from Orderr "
                                + "WHERE OrderID = ? ";
                        //3. Create statement object
                        stm = con.prepareStatement(sql);
                        stm.setString(1, OrderID);
                        stm.setString(2, OrderID);
                        //4. Excute query
                        int effectRows = stm.executeUpdate();
                        //5. Process
                        if (effectRows > 0) {
                              result = true;
                        }
                  } // end of connection has opend

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
