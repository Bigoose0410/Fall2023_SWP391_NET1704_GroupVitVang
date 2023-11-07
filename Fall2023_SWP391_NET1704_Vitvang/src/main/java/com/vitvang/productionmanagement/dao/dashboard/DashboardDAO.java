/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vitvang.productionmanagement.dao.dashboard;

import com.vitvang.productionmanagement.model.AccountDTO;
import com.vitvang.productionmanagement.model.CageDTO;
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

/**
 *
 * @author Admin
 */
public class DashboardDAO implements Serializable {

      List<OrderDTO> listOrder;

      public List<OrderDTO> getListOrder() {
            return listOrder;
      }

      public void showListOrder() throws SQLException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            try {
                  con = (Connection) DBHelper.makeConnection();
                  if (con != null) {
                        String sql = "SELECT OrderID, StartDate, EndDate, TotalPrice, Address, StatusProgress "
                                + "FROM ORDERR ";
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
                              if (this.listOrder == null) {
                                    this.listOrder = new ArrayList<OrderDTO>();
                              }
                              this.listOrder.add(order);
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
            }
      }

      List<CageDTO> listCage;

      public List<CageDTO> getListCage() {
            return listCage;
      }

      public void showListCage() throws SQLException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            try {
                  con = (Connection) DBHelper.makeConnection();
                  if (con != null) {
                        String sql = "SELECT CageID, Name, Price, Origin, Description "
                                + "FROM Cage ";
                        stm = con.prepareStatement(sql);
                        rs = stm.executeQuery();
                        while (rs.next()) {
                              String CageID = rs.getString("CageID");
                              String Name = rs.getString("Name");
                              int Price = rs.getInt("Price");
                              String Origin = rs.getString("Origin");
                              String Description = rs.getString("Description");
                              CageDTO cage = new CageDTO(CageID, Name, Price, Origin, Description);
                              if (this.listCage == null) {
                                    this.listCage = new ArrayList<CageDTO>();
                              }
                              this.listCage.add(cage);
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
            }
      }

      List<CageDTO> listCountCage;

      public List<CageDTO> getListCountCage() {
            return listCountCage;
      }

      public void countCage() throws SQLException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            try {
                  con = (Connection) DBHelper.makeConnection();
                  if (con != null) {
                        String sql = "SELECT Cage.CageID, Cage.Name, COUNT(Cage.CageID) AS 'CageQuantity' "
                                + "FROM OrderDetail JOIN Cage ON OrderDetail.CageID = Cage.CageID "
                                + "GROUP BY Cage.CageID, Cage.Name ";
                        stm = con.prepareStatement(sql);
                        rs = stm.executeQuery();
                        while (rs.next()) {
                              String CageID = rs.getString("CageID");
                              String Name = rs.getString("Name");
                              int CageQuantity = rs.getInt("CageQuantity");
                              CageDTO cage = new CageDTO(CageID, Name, CageQuantity);
                              if (this.listCountCage == null) {
                                    this.listCountCage = new ArrayList<CageDTO>();
                              }
                              this.listCountCage.add(cage);
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
            }
      }

}
