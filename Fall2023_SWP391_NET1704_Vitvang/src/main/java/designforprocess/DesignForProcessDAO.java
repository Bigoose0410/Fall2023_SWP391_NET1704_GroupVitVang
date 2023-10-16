/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package designforprocess;

import Model.DesignForProcessDTO;
import Util.DBHelper;
import java.sql.Connection;
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
public class DesignForProcessDAO {

      List<DesignForProcessDTO> listProcessDesign;

      public List<DesignForProcessDTO> getDesignProcessList() {
            return listProcessDesign;
      }

      public void ViewDesignForProcess(String CageID)
              throws SQLException, NamingException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {

                        String sql = "select Phrase, CageID, TimeProcess, Description, NumberOfEmployee, NumCompletionCage "
                                + "from DesignForProcess "
                                + "where CageID like ?";

                        stm = con.prepareStatement(sql);
                        stm.setString(1, "%" + CageID + "%");
                        rs = stm.executeQuery();

                        while (rs.next()) {
                              String Pharse = rs.getString("Phrase");
                              String Cage = rs.getString("CageID");
                              int TimeProcess = rs.getInt("TimeProcess");
                              String Description = rs.getString("Description");
                              int NumberOfEmployee = rs.getInt("NumberOfEmployee");
                              int NumCompletionCage = rs.getInt("NumCompletionCage");
                              DesignForProcessDTO dto
                                      = new DesignForProcessDTO(Pharse, Cage, TimeProcess, Description, NumberOfEmployee, NumCompletionCage);
                              if (this.listProcessDesign == null) {
                                    this.listProcessDesign = new ArrayList<DesignForProcessDTO>();
                              }
                              this.listProcessDesign.add(dto);
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

      public boolean AddDesignPrcess(DesignForProcessDTO design)
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

                        String sql = "Insert into DesignForProcess (Phrase, CageID, TimeProcess, Description, NumberOfEmployee, NumCompletionCage ) "
                                + "VALUES ("
                                + "?, ? , ?, ?, ?, ? "
                                + ")";

                        //3. Create statement object
                        stm = con.prepareStatement(sql);
                        stm.setString(1, design.getPhrase());
                        stm.setString(2, design.getCageID());
                        stm.setInt(3, design.getTimeProcess());
                        stm.setString(4, design.getDescription());
                        stm.setInt(5, design.getNumberOfEmployee());
                        stm.setInt(6, design.getNumCompletionCage());
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
      
      public boolean updateDesign(String PharseID, String CageID, int TimeProcess, String Description, int NumberOfEmployee)
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
                        String sql = "UPDATE DesignForProcess "
                                + "SET TimeProcess = ?, Description = ?, NumberOfEmployee = ? "
                                + "WHERE Phrase = ? "
                                + "And CageID = ? ";
                        //3. Create statement object
                        stm = con.prepareStatement(sql);
                        stm.setInt(1, TimeProcess);
                        stm.setString(2, Description);
                        stm.setInt(3, NumberOfEmployee);
                        stm.setString(4, PharseID);
                        stm.setString(5, CageID);
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
      
       public boolean deleteDesign(String Phrase)
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
                        String sql = "DELETE from DesignForProcess "
                                + "WHERE Phrase = ? ";
//                                + "DELETE from Process "
//                                + "WHERE processID = ? ";
                        //3. Create statement object
                        stm = con.prepareStatement(sql);
                        stm.setString(1, Phrase);
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

      public int TotalPriceProcess()
              throws NamingException, SQLException {
            if (this.getDesignProcessList() != null) {
                  int total = 0;
                  for (DesignForProcessDTO designForProcessDTO : this.getDesignProcessList()) {
                        total += designForProcessDTO.getTimeProcess() * designForProcessDTO.getNumberOfEmployee() * 3000;
                  }
                  return total;
            } else return 0;
      }
}
