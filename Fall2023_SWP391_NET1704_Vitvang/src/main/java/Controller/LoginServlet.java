/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.UserDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import users.UserDAO;
import users.UserLoginError;

/**
 *
 * @author Admin
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

        private static final String AdminPage = "MainController?btAction=Order";

        private static final String StaffPage = "MainController?btAction=Order";
        private static final String ManagerPage ="MainController?btAction=Order ";
        private static final String ManagerPage ="MainController?btAction=Order";
        private static final String LoginPage = "newLogin.jsp";

        
        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException, ClassNotFoundException, Exception {
                response.setContentType("text/html;charset=UTF-8");
                String username = request.getParameter("txtUsername");
                String password = request.getParameter("txtPassword");
                String url = LoginPage;
                try {
                        UserLoginError error = new UserLoginError();
                        boolean foundErr = false;
                        if (username.isEmpty()) { // if userame empty
                                // found error 
                                foundErr = true;
                                error.setIsEmptyUsername("Please enter username");
                        }
                        if (password.isEmpty()) { // if password empty
                                // found error 
                                foundErr = true;
                                error.setIsEmptyPassword("Please enter password");
                        }
                        if (foundErr) {
                                request.setAttribute("LOGIN_ERRORS", error);
                                url = LoginPage;
                        } else {
                                // kiem tra xem ng ta nhan dung parameter chua roi moi can cac filt sau do
                                //1.Call model - DAO
                                //1.1 new object
                                UserDAO dao = new UserDAO();
                                //1.2 Call method
                                password = dao.EncodePass(password);
                                UserDTO result = dao.checkLogin(username, password);
                                if (result != null) {

                                        switch (result.getRoleID()) {
                                                case 1:
                                                        url = AdminPage;
                                                        break;
                                                case 2:
                                                        url = ManagerPage;
                                                        break;
                                                default:
                                                        url = StaffPage;
                                                        break;
                                        }
                                        HttpSession session = request.getSession();
                                        session.setAttribute("USER", result);
                                        Cookie cookie = new Cookie(username, password);
                                        cookie.setMaxAge(60 * 3);
                                        response.addCookie(cookie);
                                } else {
                                        error.setIsWrongAccount("Wrong username or password");
                                        request.setAttribute("LOGIN_ERRORS", error);
                                        url = LoginPage;
                                }
                                
                        } // no error input 
                } catch (SQLException ex) {
                        log("LOGINSERVLET _ SQL" + ex.getMessage());
                } catch (NamingException ex) {
                        log("LOGINSERVLET _ NAMING" + ex.getMessage());
                } finally {
                        RequestDispatcher rd = request.getRequestDispatcher(url);
                        rd.forward(request, response);

                }
        }

        // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
        /**
         * Handles the HTTP <code>GET</code> method.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific
         * error occurs
         * @throws IOException if an I/O error occurs
         */
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
                try {
                        processRequest(request, response);
                } catch (ClassNotFoundException ex) {
                        Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
              }
        }

        /**
         * Handles the HTTP <code>POST</code> method.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific
         * error occurs
         * @throws IOException if an I/O error occurs
         */
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
                try {
                        processRequest(request, response);
                } catch (ClassNotFoundException ex) {
                        Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
              }
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo() {
                return "Short description";
        }// </editor-fold>

}
