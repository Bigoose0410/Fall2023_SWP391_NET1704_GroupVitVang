/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.dao.users.UserDAO;
import com.vitvang.productionmanagement.exception.users.UserLoginError;
import com.vitvang.productionmanagement.model.UserDTO;
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

      private static final String Admin_Page = "AdminHomePage.jsp";
      private static final String Staff_Page = "MainController?btAction=Search";
      private static final String Manager_Page = "ManagerHomePage.jsp";
      private static final String Customer_Page = "CustomerHomePage.jsp";
      private static final String ERROR_PAGE = "ErrorPage.html";
      private static final String Login_PAGE = "NewLogin.jsp";

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException, ClassNotFoundException, Exception {
            response.setContentType("text/html;charset=UTF-8");
            String username = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");
            String url = ERROR_PAGE;
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
                        url = Login_PAGE;
                  } else {
                        // kiem tra xem ng ta nhan dung parameter chua roi moi can cac filt sau do
                        //1.Call model - DAO
                        //1.1 new object
                        UserDAO dao = new UserDAO();
                        //1.2 Call method
                        password = dao.EncodePass(password);
                        UserDTO result = dao.checkLogin(username, password);
                        if (result != null && result.isUserStatus()) {

                              switch (result.getRoleID()) {
                                    case 1:
                                          url = Admin_Page;
                                          break;
                                    case 2:
                                          url = Staff_Page;
                                          break;
                                    case 3:
                                          url = Manager_Page;
                                          break;
                                    case 4:
                                          url = Customer_Page;
                                          break;
                              }
                              HttpSession session = request.getSession();
                              session.setAttribute("USER", result);
                              Cookie cookie = new Cookie(username, password);
                              cookie.setMaxAge(60 * 3);
                              response.addCookie(cookie);
                        } else if (result == null) {
                              error.setIsWrongAccount("Wrong username or password");
                              request.setAttribute("LOGIN_ERRORS", error);
                              url = Login_PAGE;
                        } else if (!result.isUserStatus()) {
                              error.setIsWrongAccount("Your account is not available");
                              request.setAttribute("LOGIN_ERRORS", error);
                              url = Login_PAGE;
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
       * @throws ServletException if a servlet-specific error occurs
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
       * @throws ServletException if a servlet-specific error occurs
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
