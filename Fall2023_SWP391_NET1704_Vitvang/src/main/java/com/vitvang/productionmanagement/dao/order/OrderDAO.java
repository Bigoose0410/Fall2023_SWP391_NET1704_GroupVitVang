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
                        String sql = " select d.OrderID, d.CageID, d.Quantity, d.OrderDetailStatus, c.Name, c.Description, c.Origin, c.Price  "
                                + "from OrderDetail d inner join Cage c "
                                + "on d.CageID = c.CageID "
                                + "where OrderID like  ? ";
                        stm = con.prepareStatement(sql);
                        stm.setString(1, "%" + SearchValue + "%");
                        rs = stm.executeQuery();
                        while (rs.next()) {
                              String OrderID = rs.getString("OrderID");
                              String CageID = rs.getString("CageID");
                              int Quantity = rs.getInt("Quantity");
                              String status = rs.getString("OrderDetailStatus");
                              String Name = rs.getString("Name");
                              String Description = rs.getString("Description");
                              String Origin = rs.getString("Origin");
                              int Price = rs.getInt("Price");

                              DetailOrderDTO detailorder = new DetailOrderDTO(OrderID, CageID, Name, Price, Origin, Quantity, status, Description);
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

      public DetailOrderDTO query1LineOrderDetail(String OrderID, String CageID) throws SQLException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {
                        String sql = "select OrderID, CageID , Quantity "
                                + "from OrderDetail "
                                + "where OrderID = ? AND CageID = ?";
                        stm = con.prepareStatement(sql);
                        stm.setString(1, OrderID);
                        stm.setString(2, CageID);
                        rs = stm.executeQuery();
                        if (rs.next()) {
                              String orderID = rs.getString("OrderID");
                              String cageID = rs.getString("CageID");
                              int Quantity = rs.getInt("Quantity");
                              String status = rs.getString("OrderDetailStatus");
                              DetailOrderDTO detailorder = new DetailOrderDTO(orderID, cageID, Quantity, status);
                              return detailorder;
                        }
                  }
                  return null;
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

      public boolean updateOrderStatus(String OrderID, Date EndDate, String StatusProgress)
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
                                + "SET EndDate = ?, StatusProgress = ? "
                                + "WHERE OrderID = ? ";
                        //3. Create statement object
                        stm = con.prepareStatement(sql);
                        stm.setDate(1, (java.sql.Date) EndDate);
                        stm.setString(2, StatusProgress);
                        stm.setString(3, OrderID);
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

      public int countNewOrder() throws SQLException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            int neworder = 0;
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {
                        String sql = "Select COUNT(*)"
                                + " From Orderr "
                                + " Where StatusProgress like 'new order'";
                        stm = con.prepareStatement(sql);
                        rs = stm.executeQuery();
                        if (rs.next()) {
                              neworder = rs.getInt(1);
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
            return neworder;
      }

      public int countProcessingOrder() throws SQLException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            int Processingorder = 0;
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {
                        String sql = "Select COUNT(*)"
                                + " From Orderr "
                                + " Where StatusProgress like 'Processing'";
                        stm = con.prepareStatement(sql);
                        rs = stm.executeQuery();
                        if (rs.next()) {
                              Processingorder = rs.getInt(1);
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
            return Processingorder;
      }

      public boolean insertOrder(Date startDate, int totalprice, String Addres)
              throws SQLException, NamingException {
            Connection con = null;
            PreparedStatement stm = null;
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {
                        String sql = "DECLARE @orderID NVARCHAR(10) "
                                + "SET @orderID = dbo.GetNextOrderID() "
                                + "insert into Orderr (OrderID, StartDate, TotalPrice, Address, StatusProgress ) "
                                + "values (@orderID, ?, ?, ?, 'new order')";
                        stm = con.prepareStatement(sql);
                        stm.setDate(1, startDate);
                        stm.setInt(2, totalprice);
                        stm.setString(3, Addres);

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

      public boolean addOrderDetail(String CageID, int quantity)
              throws SQLException, NamingException {
            Connection con = null;
            PreparedStatement stm = null;
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {
                        String sql = "DECLARE @str1 NVARCHAR(10) "
                                + "DECLARE @str2 NVARCHAR(10) = 'OD001' "
                                + "DECLARE @num1 INT "
                                + "SET @str1 = dbo.GetNextOrderID() "
                                + "SET @num1 = CONVERT(INT, RIGHT(@str1, 3)) "
                                + "DECLARE @num2 INT "
                                + "SET @num2 = CONVERT(INT, RIGHT(@str2, 3)) "
                                + "DECLARE @result INT "
                                + "SET @result = @num1 - @num2 "
                                + "DECLARE @orderID NVARCHAR(10) "
                                + "SET @orderID = 'OD' + RIGHT('00' + CAST(@result AS NVARCHAR(3)), 3) "
                                + "insert into OrderDetail(OrderID, CageID, Quantity, OrderDetailStatus) "
                                + "values (@orderID, ?, ?, 'new order')";

                        stm = con.prepareStatement(sql);
                        stm.setString(1, CageID);
                        stm.setInt(2, quantity);

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

      public boolean addUserOrder(String CustomerID)
              throws SQLException, NamingException {
            Connection con = null;
            PreparedStatement stm = null;
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {
                        String sql = "DECLARE @str1 NVARCHAR(10) "
                                + "DECLARE @str2 NVARCHAR(10) = 'OD001' "
                                + "DECLARE @num1 INT "
                                + "SET @str1 = dbo.GetNextOrderID() "
                                + "SET @num1 = CONVERT(INT, RIGHT(@str1, 3)) "
                                + "DECLARE @num2 INT "
                                + "SET @num2 = CONVERT(INT, RIGHT(@str2, 3)) "
                                + "DECLARE @result INT "
                                + "SET @result = @num1 - @num2 "
                                + "DECLARE @orderID NVARCHAR(10) "
                                + "SET @orderID = 'OD' + RIGHT('00' + CAST(@result AS NVARCHAR(3)), 3) "
                                + "insert into UserOrder(UserID, OrderID)  "
                                + "values (?,@orderID)";

                        stm = con.prepareStatement(sql);
                        stm.setString(1, CustomerID);
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

      // paging
      public List<OrderDTO> getPagingByCreateDateDesc(int index, String searchValue, int fieldShow)
              throws SQLException, ClassNotFoundException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;

            try {
                  con = DBHelper.makeConnection();
                  if (con != null) {
                        String sql = "Select OrderID, StartDate, EndDate, TotalPrice, Address, StatusProgress "
                                + "                                From Orderr "
                                + "                             Where OrderID like ?"
                                + "							 Order by OrderID desc"
                                + "								OFFSET ? ROWS "
                                + "							FETCH FIRST ? ROWS ONLY";
                        stm = con.prepareStatement(sql);
                        stm.setString(1, "%" + searchValue + "%");
                        stm.setInt(2, (index - 1) * fieldShow);
                        stm.setInt(3, fieldShow);
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
                        return this.listOrders;
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
            return null;
      }

      public int getNumberPage(String searchValue, int fieldShow)
              throws SQLException, ClassNotFoundException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            try {
                  con = DBHelper.makeConnection();
                  if (con != null) {
                        String sql = "Select count(*) "
                                + "From Orderr "
                                + "where OrderID like ? ";

                        stm = con.prepareStatement(sql);
                        stm.setString(1, "%" + searchValue + "%");
                        rs = stm.executeQuery();
                        if (rs.next()) {
                              int total = rs.getInt(1);
                              int countPage = total / fieldShow;
                              if (total % fieldShow != 0) {
                                    countPage++;
                              }
                              return countPage;
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
            return 0;
      }

}
