/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author Admin
 */
public class DBUtils implements Serializable {

    public static Connection makeConnection() {

        try {
            Context ctx = new InitialContext();
            Context evnCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) evnCtx.lookup("SE1720");
            Connection con = ds.getConnection();
            return con;
            // cach de lay database roi chi vo context.xml sua thoi
        } catch (NamingException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
// add thu vien truc

// bai tap ws1 moi lam dc buoc 4 a` : co 5 buoc
// 1. tao login, invalid, search
//2. tao maincontroller
//3.tao db sql
//4. ket noi db voi java
//5. 

