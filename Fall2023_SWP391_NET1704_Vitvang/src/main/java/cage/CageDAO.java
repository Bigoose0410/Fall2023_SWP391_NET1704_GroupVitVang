/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cage;

import Model.CageDTO;
import Model.CageMaterialDTO;
import Model.DesignForProcessDTO;
import Util.DBHelper;
import designforprocess.DesignForProcessDAO;
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

      public CageDTO getCageDTObyID(String ID) {
            for (CageDTO cageDTO : getListCage()) {
                  if (ID.equals(cageDTO.getCageID())) {
                        return cageDTO;
                  }
            }
            return null;
      }

      public void searchProductionbyName(String searchValue) throws SQLException, NamingException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {
                        String sql = "Select * "
                                + "From Cage "
                                + "where Name like ?";

                        stm = con.prepareStatement(sql);
                        stm.setString(1, "%" + searchValue + "%");
                        rs = stm.executeQuery();

                        while (rs.next()) {
                              String CageID = rs.getString("CageID");
                              String Name = rs.getString("Name");
                              int Price = rs.getInt("Price");
                              String Origin = rs.getString("Origin");
                              String Description = rs.getString("Description");
                              // Call DTO
                              CageDTO cage = new CageDTO(CageID, Name, Price, Origin, Description);
//                              cage.setPrice(TotalPrice(CageID));
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

      public void searchProductionbyID(String searchValue) throws SQLException, NamingException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {

                        String sql = "Select * "
                                + "From Cage "
                                + "where CageID like ?";

                        stm = con.prepareStatement(sql);
                        stm.setString(1, "%" + searchValue + "%");
                        rs = stm.executeQuery();

                        while (rs.next()) {
                              String CageID = rs.getString("CageID");
                              String Name = rs.getString("Name");
                              int Price = rs.getInt("Price");
                              String Origin = rs.getString("Origin");
                              String Description = rs.getString("Description");
                              // Call DTO
                              CageDTO cage = new CageDTO(CageID, Name, Price, Origin, Description);
//                              cage.setPrice(TotalPrice(CageID));
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

      public void AllProduction() throws SQLException, NamingException {
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

      List<CageMaterialDTO> listCageMaterial;

      public List<CageMaterialDTO> getListCageMaterial() {
            return listCageMaterial;
      }

      public void ViewCageMaterial(String CageID, int quantityOrder)
              throws SQLException, NamingException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {

                        String sql = "SELECT CageMaterial.CageID , CageMaterial.Quantity as 'QuantityNeed', CageMaterial.MaterialID , "
                                + "Material.Name, Material.Origin, Material.Price , Material.Quantity, Material.Unit "
                                + "From CageMaterial INNER JOIN Material "
                                + "ON CageMaterial.MaterialID = Material.MaterialID "
                                + "where CageMaterial.CageID like ? ";

                        stm = con.prepareStatement(sql);
                        stm.setString(1, "%" + CageID + "%");
                        rs = stm.executeQuery();

                        while (rs.next()) {
                              int QuantityNeed = rs.getInt("QuantityNeed");
                              String MaterialID = rs.getString("MaterialID");
                              String Name = rs.getString("Name");
                              String Origin = rs.getString("Origin");
                              int Price = rs.getInt("Price");
                              String Unit = rs.getString("Unit");

                              // Call DTO
                              CageMaterialDTO cageMaterial = new CageMaterialDTO(CageID, QuantityNeed, MaterialID, Name, Origin, Price, quantityOrder, Unit);
                              if (this.listCageMaterial == null) {
                                    this.listCageMaterial = new ArrayList<CageMaterialDTO>();
                              }
                              this.listCageMaterial.add(cageMaterial);

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

      public void ViewCageMaterial2(String CageID)
              throws SQLException, NamingException {
            Connection con = null;
            PreparedStatement stm = null;
            ResultSet rs = null;
            try {
                  con = DBHelper.makeConnection();
                  // tra ra null or k.
                  if (con != null) {

                        String sql = "SELECT CageMaterial.CageID , CageMaterial.Quantity as 'QuantityNeed', CageMaterial.MaterialID , "
                                + "Material.Name, Material.Origin, Material.Price , Material.Quantity, Material.Unit "
                                + "From CageMaterial INNER JOIN Material "
                                + "ON CageMaterial.MaterialID = Material.MaterialID "
                                + "where CageMaterial.CageID like ? ";

                        stm = con.prepareStatement(sql);
                        stm.setString(1, "%" + CageID + "%");
                        rs = stm.executeQuery();

                        while (rs.next()) {
                              int QuantityNeed = rs.getInt("QuantityNeed");
                              String MaterialID = rs.getString("MaterialID");
                              String Name = rs.getString("Name");
                              String Origin = rs.getString("Origin");
                              int Price = rs.getInt("Price");
                              String Unit = rs.getString("Unit");

                              // Call DTO
                              CageMaterialDTO cageMaterial = new CageMaterialDTO(CageID, QuantityNeed, MaterialID, Name, Origin, Price, 1, Unit);
                              if (this.listCageMaterial == null) {
                                    this.listCageMaterial = new ArrayList<CageMaterialDTO>();
                              }
                              this.listCageMaterial.add(cageMaterial);
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

      public int TotalPriceMaterial()
              throws NamingException, SQLException {
            int total = 0;
            if(this.getListCageMaterial()!= null) {
                  for (CageMaterialDTO cageMaterialDTO : this.getListCageMaterial()) {
                        total += cageMaterialDTO.getPrice() * cageMaterialDTO.getQuantityNeed();
                  }
            }
            return total;
      }

      public int TotalPrice(String CageID)
              throws NamingException, SQLException {
            int total = 0;
            int profit = 5000;
            total = total + profit;
            CageDAO cagedao = new CageDAO();
            DesignForProcessDAO designdao = new DesignForProcessDAO();
            cagedao.ViewCageMaterial2(CageID);
            designdao.ViewDesignForProcess(CageID);

            List<CageMaterialDTO> materialList = cagedao.getListCageMaterial();
            for (CageMaterialDTO cageMaterialDTO : materialList) {
                  total = cageMaterialDTO.getPrice() * cageMaterialDTO.getQuantityNeed();
            }
            List<DesignForProcessDTO> designList = designdao.getDesignProcessList();
            for (DesignForProcessDTO designForProcessDTO : designList) {
                  total = designForProcessDTO.getTimeProcess() * designForProcessDTO.getNumberOfEmployee() * 3000;
            }
            return total;

      }
}
