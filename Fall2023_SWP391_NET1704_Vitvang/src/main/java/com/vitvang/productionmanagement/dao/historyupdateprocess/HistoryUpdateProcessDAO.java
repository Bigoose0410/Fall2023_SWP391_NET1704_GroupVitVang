/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vitvang.productionmanagement.dao.historyupdateprocess;

import com.vitvang.productionmanagement.model.HistoryUpdateProcessDTO;
import com.vitvang.productionmanagement.util.DBHelper;
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
public class HistoryUpdateProcessDAO {
      List<HistoryUpdateProcessDTO> listHistoryUpdateProcess;

      public List<HistoryUpdateProcessDTO> getListHistoryUpdateProcess() {
            return listHistoryUpdateProcess;
      }

     

      public void ViewHistoryCurrentProcess(String processID, String CageID, String OrderID) throws SQLException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {

                        String sql = "select c.ProcessName, h.OrderID, h.Phrase, h.CageID ,h.ProcessID ,h.Content, h.UpdateDate, h.TypeOfUpdate " +
"                                from  HistoryUpdateProcess h inner join Process c  " +
"                                on h.ProcessID = c.ProcessID "
                                + "AND h.OrderID = c.OrderID "
                                + "AND h.CageID = c.CageID " +
"								where h.ProcessID like  ? "
                                + "AND h.OrderID like  ? "
                                + "AND h.CageID like ?  ";
                        stm = con.prepareStatement(sql);
                        stm.setString(1, processID);
                        stm.setString(2, OrderID);
                        stm.setString(3, CageID);
                        rs = stm.executeQuery();
                        while (rs.next()) {
                              String ProcessName = rs.getString("ProcessName");                            
                              String Content = rs.getString("Content");
                              String typeUpdate = rs.getString("TypeOfUpdate");
                              Date UpdateDate = rs.getDate("UpdateDate");                             

                              HistoryUpdateProcessDTO history = new HistoryUpdateProcessDTO(ProcessName, processID, OrderID, CageID, Content, UpdateDate, typeUpdate);
                              if (this.listHistoryUpdateProcess == null) {
                                    this.listHistoryUpdateProcess = new ArrayList<HistoryUpdateProcessDTO>();
                              }
                              this.listHistoryUpdateProcess.add(history);
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
      
       public boolean insertHistory(String processID, String OrderID, String CageID, Date UpdateDate ,String Content, String TypeOfUpdate)
              throws SQLException, NamingException {
            Connection con = null;
            PreparedStatement stm = null;
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {
                        String sql = "Insert into HistoryUpdateProcess ( ProcessID, OrderID, CageID, UpdateDate , Content, TypeOfUpdate) " +
"							Values ( ?, ?, ?, ?, ?, ? ) ";
                        stm = con.prepareStatement(sql);
                        stm.setString(1, processID);
                        stm.setString(2, OrderID);
                        stm.setString(3, CageID);
                        stm.setDate(4, UpdateDate);
                        stm.setString(5, Content);
                        stm.setString(6, TypeOfUpdate);
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
}
