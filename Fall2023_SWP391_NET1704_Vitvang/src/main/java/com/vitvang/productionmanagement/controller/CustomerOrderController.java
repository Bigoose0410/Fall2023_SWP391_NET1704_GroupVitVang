/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.dao.customer.CustomerDAO;
import com.vitvang.productionmanagement.model.CageDTO;
import com.vitvang.productionmanagement.model.UserDTO;
import com.vitvang.productionmanagement.util.Constant;
import static com.vitvang.productionmanagement.util.tool.checkRole;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CustomerOrderController", urlPatterns = {"/CustomerOrderController"})
public class CustomerOrderController extends HttpServlet {

      private final String CustomerOrder = "CustomerOrder.jsp";
      private final String CustomerOrderDetail = "CustomerOrderDetail.jsp";

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException, SQLException {
            response.setContentType("text/html;charset=UTF-8");
            String url = "ErrorPage.html";
            try {
                  String button = request.getParameter("btAction");
                  String OrderID = request.getParameter("txtOrderID");
                  HttpSession session = request.getSession();// phai luon co san session
                  UserDTO user = (UserDTO) session.getAttribute("USER");
//                  if (user == null) {
//                        return;
//                  }
//                  int roleID = user.getRoleID();
////                  0. check role 
//                  if (!checkRole(roleID, Constant.isCustomer)) {
//                        return;
//                  }
                  /* TODO output your page here. You may use following sample code. */

                  String UserID = user.getUserID();

                  CustomerDAO dao = new CustomerDAO();
                  if (!button.equals("View Order Detail")) {
                        dao.getCustomerOrder(UserID);
                        List<CageDTO> list = dao.getListOrder();
                        request.setAttribute("CUSTOMER_ORDER", list);
                        url = CustomerOrder;
                  } else {
                        dao.getCustomerOrderDetail(UserID, OrderID);
                        List<CageDTO> list = dao.getListOrder();
                        request.setAttribute("CUSTOMER_ORDER_DETAIL", list);
                        url = CustomerOrderDetail;
                  }
            } catch (SQLException e) {
                  e.printStackTrace();
            } finally {
                  request.getRequestDispatcher(url).forward(request, response);
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
            } catch (SQLException ex) {
                  Logger.getLogger(CustomerOrderController.class.getName()).log(Level.SEVERE, null, ex);
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
            } catch (SQLException ex) {
                  Logger.getLogger(CustomerOrderController.class.getName()).log(Level.SEVERE, null, ex);
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
