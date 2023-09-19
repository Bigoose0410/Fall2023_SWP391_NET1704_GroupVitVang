/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Account.AccountDAO;
import Account.AccountDTO;
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

/**
 *
 * @author Admin
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

        private static final String AdminPage = "index.html";
        private static final String StaffPage = "index.html";
        private static final String ManagerPage = "index.html";

        /**
         * Processes requests for both HTTP <code>GET</code>
         * and <code>POST</code> methods.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific
         * error occurs
         * @throws IOException if an I/O error occurs
         */
        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException, ClassNotFoundException {
                response.setContentType("text/html;charset=UTF-8");
                String username = request.getParameter("txtUsername");
                String password = request.getParameter("txtPassword");

                String url = "errorPageLogin.html";
                try {
                        // kiem tra xem ng ta nhan dung parameter chua roi moi can cac filt sau do
                        //1.Call model - DAO
                        //1.1 new object
                        AccountDAO dao = new AccountDAO();
                        //1.2 Call method
                        AccountDTO result = dao.checkLogin(username, password);
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
