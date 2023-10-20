/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Order.OrderDAO;
import Order.OrderInsertError;
import static Util.tool.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
public class AddOrderController extends HttpServlet {

      private final String ORDER_PAGE = "order.jsp";
      private final String ORDER_ADD_PAGE = "orderAdd.jsp";
      private final String CUSTOMERID_PATTERN = "CS\\d{3}";
      private final String ORDERID_PATTERN = "OD\\d{3}";

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException, ParseException {
            response.setContentType("text/html;charset=UTF-8");
            String url = ORDER_PAGE;
            // test
            String orderId = request.getParameter("txtOrderID");
            String EndDate = request.getParameter("txtEndDate");
            Date productEndDate = Date.valueOf(EndDate);
            String customerId = request.getParameter("txtCustomerID");
            String totalprice = request.getParameter("txtTotalPrice");
            int total = Integer.parseInt(totalprice);
            String Address = request.getParameter("txtAddress");
            String[] CageID = request.getParameterValues("txtOrderCageID");
            long millis = System.currentTimeMillis();
            java.sql.Date now = new java.sql.Date(millis);

            boolean foundErr = false;
            OrderInsertError error = new OrderInsertError();
            try {
                  HttpSession session = request.getSession();
                  OrderDAO Orderdao = new OrderDAO();
                  if (!checkFormat(orderId, ORDERID_PATTERN, true)) {
                        error.setOrderIdFormatErr("Pls type again OrderID with form ODxxx");
                        foundErr = true;
                  }
                  if (productEndDate.before(now)) {
                        error.setEndDateErr("End date can not before today");
                        foundErr = true;
                  }
                  if (!checkFormat(customerId, CUSTOMERID_PATTERN, true)) {
                        error.setCustomerIdFormatErr("Pls type again CustomerID with two digit");
                        foundErr = true;
                  }
                  if (Address.trim().length() < 5) {
                        error.setAddressLengthErr("Pls type again Address too short");
                        foundErr = true;
                  }
                  if (foundErr) {
                        request.setAttribute("ADD_ORDER_ERROR", error);
                        url = ORDER_ADD_PAGE;
                  } else {
                        boolean result = Orderdao.insertOrder(orderId, now, total, productEndDate, Address);
                        Orderdao.addUserOrder(orderId, customerId);
                        int quantity = 1;
                        for (String item : CageID) {
                              String quantityrequest = request.getParameter(item);
                              quantity = Integer.parseInt(quantityrequest);
                              Orderdao.addOrderDetail(orderId, item, quantity);
                        }
                        if (result) {
                              url = "MainController"
                                      + "?btAction=Detail"
                                      + "&txtOrderID="+orderId;
                        }
                  }
            } catch (SQLException ex) {
                  String msg = ex.getMessage();
                  log("UpdateAccountServlet _ SQL " + msg);
                  if (msg.contains("conflicted with the FOREIGN KEY")) {
                        error.setCustomerNotExistInDatabasErr("Customer not exist in database");
                        request.setAttribute("ADD_ORDER_ERROR", error);
                  }
                  if (msg.contains("duplicate")) {
                        error.setDuplicateOrderIDErr("OrderID has exist in database");
                        request.setAttribute("ADD_ORDER_ERROR", error);
                  }
            } catch (NamingException ex) {
                  log("UpdateAccountServlet _ Naming " + ex.getMessage());
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
            } catch (ParseException ex) {
                  Logger.getLogger(AddOrderController.class.getName()).log(Level.SEVERE, null, ex);
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
            } catch (ParseException ex) {
                  Logger.getLogger(AddOrderController.class.getName()).log(Level.SEVERE, null, ex);
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
