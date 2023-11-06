/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vitvang.productionmanagement.dao.material;

import com.vitvang.productionmanagement.model.CageMaterialDTO;
import com.vitvang.productionmanagement.util.DBHelper;
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
public class MaterialDAO {
      
       List<CageMaterialDTO> AllMaterial;

      public List<CageMaterialDTO> getAllMaterial() {
            return AllMaterial;
      }
      
      // get material from list to add to cart
       public CageMaterialDTO getMaterialByID(String ID) {
            for (CageMaterialDTO cageDTO : getAllMaterial()) {
                  if (ID.equals(cageDTO.getCageID())) {
                        return cageDTO;
                  }
            }
            return null;
      }
       
       public CageMaterialDTO AllMaterial()
              throws SQLException, NamingException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            CageMaterialDTO result = null;
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {

                        String sql = "SELECT * "
                                + "FROM   Material d ";
                        stm = con.prepareStatement(sql);                   
                        rs = stm.executeQuery();

                        while (rs.next()) {
                              String MaterialID = rs.getString("MaterialID");
                              String Name = rs.getString("Name");
                              String Origin = rs.getString("Origin");
                              int Price = rs.getInt("Price");
                              String Unit = rs.getString("Unit");
                              // Call DTO
                              CageMaterialDTO Material = new CageMaterialDTO(MaterialID, Name, Origin, Price, Unit);
                              if (this.AllMaterial == null) {
                                    this.AllMaterial = new ArrayList<CageMaterialDTO>();
                              }
                              this.AllMaterial.add(Material);
                        }
                  }
                  return result;
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
      
      public boolean AddMaterialBuild(String CageID, String MaterialID, int Quanity)
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

                        String sql = "Insert into CageMaterial (CageID, MaterialID, Quantity ) "
                                + "VALUES ("
                                + "?, ? ,?"
                                + ")";

                        //3. Create statement object
                        stm = con.prepareStatement(sql);
                        stm.setString(1, CageID);
                        stm.setString(2, MaterialID);
                        stm.setInt(3, Quanity);
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

      public boolean updateMaterialOfCage(String CageID, String MaterialID, int Quanity)
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
                        String sql = "UPDATE CageMaterial "
                                + "SET Quantity = ? "
                                + "WHERE MaterialID = ? "
                                + "and CageID = ? ";
                        //3. Create statement object
                        stm = con.prepareStatement(sql);
                        stm.setInt(1, Quanity);
                        stm.setString(2, MaterialID);
                        stm.setString(3, CageID);
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

      public boolean deleteMaterialOfCage(String MaterialID, String CageID)
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
                        String sql = "DELETE from CageMaterial "
                                + "WHERE MaterialID = ? "
                                + "And CageID = ?";
//                                + "DELETE from Process "
//                                + "WHERE processID = ? ";
                        //3. Create statement object
                        stm = con.prepareStatement(sql);
                        stm.setString(1, MaterialID);
                        stm.setString(2, CageID);
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

      List<CageMaterialDTO> listMaterialnotBuild;

      public List<CageMaterialDTO> getListMaterialnotBuild() {
            return listMaterialnotBuild;
      }

      public void MaterialNotBuild(String CageID)
              throws SQLException, NamingException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {

                        String sql = "SELECT * "
                                + "FROM   Material d "
                                + "WHERE d.MaterialID not in ( "
                                + "SELECT e.MaterialID "
                                + "FROM   CageMaterial e "
                                + "WHERE  e.CageID like ?  "
                                + ")";

                        stm = con.prepareStatement(sql);
                        stm.setString(1, CageID);
                        rs = stm.executeQuery();

                        while (rs.next()) {
                              String MaterialID = rs.getString("MaterialID");
                              String Name = rs.getString("Name");
                              String Origin = rs.getString("Origin");
                              int Price = rs.getInt("Price");
                              String Unit = rs.getString("Unit");

                              // Call DTO
                              CageMaterialDTO Material = new CageMaterialDTO(MaterialID, Name, Origin, Price, Unit);
                              if (this.listMaterialnotBuild == null) {
                                    this.listMaterialnotBuild = new ArrayList<CageMaterialDTO>();
                              }
                              this.listMaterialnotBuild.add(Material);
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

      public CageMaterialDTO queryMaterialbyID(String materialid)
              throws SQLException, NamingException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            CageMaterialDTO result = null;
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {

                        String sql = "SELECT MaterialID, Name, Origin, Price, Unit "
                                + "FROM Material "
                                + "WHERE MaterialID = ?";
                        stm = con.prepareStatement(sql);
                        stm.setString(1, materialid);
                        rs = stm.executeQuery();

                        while (rs.next()) {
                              String MaterialID = rs.getString("MaterialID");
                              String Name = rs.getString("Name");
                              String Origin = rs.getString("Origin");
                              int Price = rs.getInt("Price");
                              String Unit = rs.getString("Unit");
                              // Call DTO
                              CageMaterialDTO Material = new CageMaterialDTO(MaterialID, Name, Origin, Price, Unit);
                              result = Material;
                        }
                  }
                  return result;
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
