/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vitvang.productionmanagement.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DBHelper {

        public static Connection makeConnection() {
                Connection conn = null;
                try {
<<<<<<< HEAD
                         String dbURL = "jdbc:sqlserver://ADMIN\\TEW_SQLEXPRESS:1433;databaseName=ProductionManagement1;encrypt=true;trustServerCertificate=true;";
=======
                         String dbURL = "jdbc:sqlserver://ADMIN\\TEW_SQLEXPRESS:1433;databaseName=ProductionManagement2;encrypt=true;trustServerCertificate=true;";
>>>>>>> 6c7328056a33b9fcd7a9d8679e94c4b00580764c
                        String user = "sa";
                        String pass = "12345";
                        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                        conn = DriverManager.getConnection(dbURL, user, pass);
                } catch (ClassNotFoundException | SQLException ex) {
                      System.out.println("Error DB");
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
      
}
