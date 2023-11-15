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
                         String dbURL = "jdbc:sqlserver://HandInTheAIR:1433;databaseName=ProductionManagement;encrypt=true;trustServerCertificate=true;";
                        String user = "sa";
                        String pass = "123456";
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
