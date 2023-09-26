/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Account;

import Model.AccountDTO;
import Util.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;

public class AccountDAO implements Serializable {

        public AccountDTO checkLogin(String AccountID, String Password)
                throws SQLException, NamingException {
                Connection con = null;
                PreparedStatement stm = null;
                ResultSet rs = null;
                AccountDTO result = null;
                try {
                        //1. Make connection
                        con = (Connection) DBHelper.makeConnection();
                        if (con != null) {
                                //2. create SQL statement string
                                String sql = "Select RoleID " // phai co cach sau username
                                        + "From Account "
                                        + "Where AccountID = ? "
                                        + "And Password = ? ";
                                //3. Create statement object
                                stm = con.prepareStatement(sql);
                                stm.setString(1, AccountID);
                                stm.setString(2, Password);
                                //4. Excute query
                                rs = stm.executeQuery();
                                //5. Process
                                if (rs.next()) {
//                    
                                        //map: get data from result, then set data to DTO
//                    String FullName = rs.getString("FullName");
//                    String Email = rs.getString("Email"); 
//                    String CategaryBy = rs.getString("CategaryBy"); 
                                        int RoleID = rs.getInt("RoleID");
//                    String Status = rs.getString("Status"); 
//                    result = new AccountDTO(AccountID, null, FullName, Email, CategaryBy, RoleID, Status);
                                        result = new AccountDTO(AccountID, Password, RoleID);
                                }//end username and password are checked
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
}
