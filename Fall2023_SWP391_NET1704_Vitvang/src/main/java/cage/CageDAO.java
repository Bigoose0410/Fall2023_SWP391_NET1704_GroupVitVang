/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cage;

import Model.CageDTO;
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
public class CageDAO {
      
      List<CageDTO> listCage;

      public List<CageDTO> getListCage() {
            return listCage;
      }

      
      public void searchOrder() throws SQLException, NamingException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {
                        String sql = "Select * "
                                + "From Cage ";
                        
                        stm = con.prepareStatement(sql);
                        rs = stm.executeQuery();
                        
                        while (rs.next()) {
                              String CageID = rs.getString("CageID");
                              String Name = rs.getString("Name");
                              int Price = rs.getInt("Price");
                              String Origin = rs.getString("Origin");
                              String Description = rs.getString("Description");
                              // Call DTO
                              CageDTO cage = new CageDTO(CageID, Name, Price, Origin, Description);
                              if (this.listCage == null) {
                                    this.listCage = new ArrayList<CageDTO>();
                              }
                              this.listCage.add(cage);

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
