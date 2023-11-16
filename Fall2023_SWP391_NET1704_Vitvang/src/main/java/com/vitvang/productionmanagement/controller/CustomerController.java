/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.dao.users.UserDAO;
import com.vitvang.productionmanagement.model.UserDTO;
import com.vitvang.productionmanagement.model.UserInformationDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CustomerController", urlPatterns = {"/CustomerController"})
public class CustomerController extends HttpServlet {

      private final String StaffCustomer = "StaffCustomer.jsp";
      private static final String ERROR_PAGE = "ErrorPage.html";
      private final String StaffCustomerOrder = "StaffCustomerOrder.jsp";

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException, NamingException {
            response.setContentType("text/html;charset=UTF-8");
            String url = ERROR_PAGE;
            String button = request.getParameter("btAction");
            String UserID = request.getParameter("txtUserID");
            String searchValue = request.getParameter("txtSearchCustomer");
            try {
                  HttpSession session = request.getSession();// phai luon co san session
                  UserDTO currUser = (UserDTO) session.getAttribute("USER");
                  if (currUser == null) {
                        return;
                  }
//                  int roleID = currUser.getRoleID();
//                  //0. check role 
//                  if (!checkRole(roleID, Constant.isAdmin) &&!checkRole(roleID, Constant.isManager) && !checkRole(roleID, Constant.isStaff)) {
//                        return;
//                  }
                  // 1. new dao
                  UserDAO dao = new UserDAO();
                  if (!button.equals("StaffViewCustomerDetail")) {
                        dao.getCustomerHaveOrder(searchValue);
                        List<UserInformationDTO> list = dao.getListCustomerHaveOrder();
                        request.setAttribute("CUSTOMER_HAVE_ORDER_LIST", list);
                        url = StaffCustomer;
                  } else {
                        dao.getInforCustomerHaveOrder(UserID);
                        List<UserInformationDTO> list = dao.getListCustomerHaveOrder();
                        request.setAttribute("CUSTOMER_HAVE_ORDER_LIST", list);

                        dao.showCustomerInformation(UserID);
                        List<UserInformationDTO> list1 = dao.getUserInformation();
                        request.setAttribute("CUSTOMER_ORDER_PROCESS", list1);

                        url = StaffCustomerOrder;
                  }
                  session.removeAttribute("SHOW_CUS_CREATE_FORM");

            } catch (SQLException ex) {
                  log("SearchUserController _ SQL" + ex.getMessage());
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
            } catch (NamingException ex) {
                  Logger.getLogger(CustomerController.class.getName()).log(Level.SEVERE, null, ex);
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
            } catch (NamingException ex) {
                  Logger.getLogger(CustomerController.class.getName()).log(Level.SEVERE, null, ex);
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
