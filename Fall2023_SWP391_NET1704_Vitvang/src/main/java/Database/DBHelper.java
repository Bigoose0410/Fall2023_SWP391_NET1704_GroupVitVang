/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Database;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DBHelper implements Serializable{

        public static Connection makeConnection() {
                Connection conn = null;
                try {
                        String dbURL = "jdbc:sqlserver://ADMIN\\SQLEXPRESS;databaseName=ProductionManagement;encrypt=false;";
                        String user = "sa";
                        String pass = "12345";
                        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                        conn = DriverManager.getConnection(dbURL, user, pass);
                        System.out.println("Connect to DB successfully");
                } catch (Exception ex) {
                        ex.printStackTrace();
                }
                return conn;
        }

        public static void closeConnection(Connection conn) {

                if (conn != null) {
                        try {
                                conn.close();
                        } catch (SQLException ex) {
                                Logger.getLogger(DBHelper.class.getName()).log(Level.SEVERE, null, ex);
                        }
                }
        }

        ////////////////////////////////////////////////////////////////////////////
        public static void main(String[] args) throws SQLException {
        Connection o = makeConnection();
        DatabaseMetaData dm =(DatabaseMetaData) o.getMetaData();
            System.out.println("Drive Name: " + dm.getDriverName());
            System.out.println("Drive vision: " + dm.getDriverVersion());
            closeConnection(o);
    }
}
