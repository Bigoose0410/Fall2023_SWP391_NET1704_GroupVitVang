<<<<<<< HEAD
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vitvang.productionmanagement.controller;
=======
package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.dao.users.UserDAO;
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
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
import javax.naming.NamingException;
<<<<<<< HEAD
import com.vitvang.productionmanagement.dao.users.UserDAO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "StartUpController", urlPatterns = {"/StartUpController"})
public class StartUpController extends HttpServlet {

        private static final String AdminPage = "HomePage.html";
        private static final String StaffPage = "HomePage.html";
        private static final String ManagerPage = "HomePage.html";

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
                throws ServletException, IOException {
                response.setContentType("text/html;charset=UTF-8");
                String url = "NewLogin.jsp";
                try {
                        //1. get all cookie 
                        Cookie[] cookies = request.getCookies();
                        //.check cookie
                        if (cookies != null) {
                                //3. get newest cookie
                                Cookie newestCookie = cookies[cookies.length - 1];
                                //4. get username and password 
                                String username = newestCookie.getName();
                                String password = newestCookie.getValue();
                                //5. call DAO use check login
                                UserDAO dao = new UserDAO();
                                UserDTO result = dao.checkLogin(username, password);
                                if (result != null) {
                                        HttpSession session = request.getSession();
                                        session.setAttribute("USER", result);
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

                                }//end user is authenticated
                        }//end user is authenticated
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
                processRequest(request, response);
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
                processRequest(request, response);
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
=======

@WebServlet(name = "StartUpController", urlPatterns = {"/StartUpController"})
public class StartUpController extends HttpServlet {

      private static final String AdminPage = "AdminHomePage.jsp";
      private static final String StaffPage = "MainController?btAction=Search";
      private static final String ManagerPage = "MainController?btAction=Search";
      private static final String ERROR_PAGE = "ErrorPage.html";

     
      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            String url = "NewLogin.jsp";
            try {
                  //1. get all cookie 
                  Cookie[] cookies = request.getCookies();
                  //.check cookie
                  if (cookies != null) {
                        //3. get newest cookie
                        Cookie newestCookie = cookies[cookies.length - 1];
                        //4. get username and password 
                        String username = newestCookie.getName();
                        String password = newestCookie.getValue();
                        //5. call DAO use check login
                        UserDAO dao = new UserDAO();
                        UserDTO result = dao.checkLogin(username, password);
                        if (result != null) {
                              HttpSession session = request.getSession();
                              session.setAttribute("USER", result);
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

                        }//end user is authenticated
                  }//end user is authenticated
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
            processRequest(request, response);
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
            processRequest(request, response);
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
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea

}
