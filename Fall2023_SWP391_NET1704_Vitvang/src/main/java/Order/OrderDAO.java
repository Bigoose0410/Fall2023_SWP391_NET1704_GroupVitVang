 /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Order;

import Model.OrderDTO;
import Util.DBHelper;
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

        public boolean updateOrder(String OrderID, Date StartDate, Date EndDate, String Address, String StatusProgress, String CusomerID)
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
                                        + "SET StartDate = ?, EndDate = ?, Address = ?, StatusProgress = ?, CustomerID = ? "
                                        + "WHERE OrderID = ? ";
                                //3. Create statement object
                                stm = con.prepareStatement(sql);
                                stm.setDate(1, (java.sql.Date) StartDate);
                                stm.setDate(2, (java.sql.Date) EndDate);
                                stm.setString(3, Address);
                                stm.setString(4, StatusProgress);
                                stm.setString(5, CusomerID);
                                stm.setString(6, OrderID);
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

        public void searchOrder(String txtSearchValue) throws SQLException {
                Connection con = null;
                PreparedStatement stm = null;
                ResultSet rs = null;
                try {
                        con = DBHelper.makeConnection();
                        // tra ra null or k.
                        if (con != null) {
                                String sql = "Select OrderID, StartDate, EndDate, TotalPrice, Address, StatusProgress, CustomerID "
                                        + "From Orderr "
                                        + "Where OrderID Like ? ";
                                stm = con.prepareStatement(sql);
                                stm.setString(1, "%" + txtSearchValue + "%");
                                rs = stm.executeQuery();
                                while (rs.next()) {
                                        String OrderID = rs.getString("OrderID");
                                        Date StartDate = rs.getDate("StartDate");
                                        Date EndDate = rs.getDate("EndDate");
//                                        int Quantity = rs.getInt("Quantity");
                                        int TotalPrice = rs.getInt("TotalPrice");
//                                        String Delivery = rs.getString("Delivery");
                                        String Address = rs.getString("Address");
                                        String StatusProgress = rs.getString("StatusProgress");
//                                        String StaffID = rs.getString("StaffID");
                                        String CustomerID = rs.getString("CustomerID");

//                    RegistrationDTO dto = new RegistrationDTO(username, password, lastname, isadmin);
                                        OrderDTO order = new OrderDTO(OrderID, StartDate, EndDate, TotalPrice, Address, StatusProgress, CustomerID);
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


        public boolean insertOrder(String orderID, Date startDate, Date endDate, String customerId, String quantity, String CageId) throws SQLException{
                Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            // tra ra null or k.
            if (con != null) {
                String sql = "insert into Orderr (OrderID, StartDate, EndDate, CustomerID ) values (?,?,?,?)" +
" insert into DetailOrder (OrderID, CageID, Quantity) values (?,?,?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, orderID);
                stm.setDate(2, startDate);
                stm.setDate(3, endDate);
                stm.setString(4, customerId);
                stm.setString(5, orderID);
                stm.setString(6, CageId);
                stm.setString(7,quantity);
                
                int row = stm.executeUpdate();
                if(row > 0 ){
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
                                String sql = "UPDATE Orderr "
                                        + "WHERE OrderID = ?";
                                //3. Create statement object
                                stm = con.prepareStatement(sql);
                                stm.setString(1, OrderID);
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

        public boolean insertOrder(String orderId, java.util.Date sDate, java.util.Date eDate, String customerId, String startDate, String orderId0) {
                throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        }
}

