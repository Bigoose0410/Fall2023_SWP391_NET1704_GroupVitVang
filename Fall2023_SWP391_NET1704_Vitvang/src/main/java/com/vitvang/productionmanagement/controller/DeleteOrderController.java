/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.model.UserDTO;
import com.vitvang.productionmanagement.dao.order.OrderDAO;
import static com.vitvang.productionmanagement.util.tool.checkRole;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
@WebServlet(name = "DeleteOrderController", urlPatterns = {"/DeleteOrderController"})
public class DeleteOrderController extends HttpServlet {
<<<<<<< HEAD

=======
      private static final String ERROR_PAGE = "ErrorPage.html";
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
 
      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            String OrderID = request.getParameter("pk");
            String searchValue = request.getParameter("lastSearchValue");
<<<<<<< HEAD
            String url = "EditOrder.jsp";
=======
            String url = ERROR_PAGE;
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
            try {
                  HttpSession session = request.getSession();
                  int roleID = ((UserDTO) session.getAttribute("USER")).getRoleID();
                  //0. check role 
                  if (checkRole(roleID, 1)) {

                        //1. call model
                        //1.1 new DAO
                        OrderDAO dao = new OrderDAO();
                        //1.2 cal DAO's methods
                        boolean result = dao.deleteOrder(OrderID);
                        //2.process
                        if (result) {
                              //2.1 call the Search function again using URL  Rewriting
                              url = "SearchOrderController"
                                      + "?btAction=Search"
                                      + "&txtSearchValue=" + searchValue;
                              //noti to user that delete sucess
                        }
                  } 
            } catch (SQLException ex) {
                  log("UpdateAccountServlet _ SQL " + ex.getMessage());
            } catch (NamingException ex) {
                  log("UpdateAccountServlet _ Naming " + ex.getMessage());
            } finally {
//            response.sendRedirect(url);
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

}
