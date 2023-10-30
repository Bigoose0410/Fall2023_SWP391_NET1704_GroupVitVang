/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.dao.cart.CartObj;
import com.vitvang.productionmanagement.dao.order.OrderDAO;
import com.vitvang.productionmanagement.exception.order.OrderInsertError;
import com.vitvang.productionmanagement.model.CageDTO;
import static com.vitvang.productionmanagement.util.tool.checkFormat;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
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

      private final String ORDER_PAGE = "OrderAdd.jsp";
      private final String ADDRESS_FORM_PATTERN = "^([0-9]{1,4}[A-Z]?/[0-9]{1,3}\\s[a-zA-Z"
              + "ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơ"
              + "ƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈ"
              + "ỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]{1,30},[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]{1,30},[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]{1,30})$";
      private final String ADDRESS_NUMBERANDCHAR_PATTERN = "^(?=.[A-Za-z])(?=.\\d)[A-Za-z\\d]+$";

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException, ParseException {
            response.setContentType("text/html;charset=UTF-8");
            String url = ORDER_PAGE;
            // test
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
                  CartObj cart = (CartObj) session.getAttribute("CART");
                  OrderDAO dao = new OrderDAO();

                  if (Address.trim().length() < 6 || Address.trim().length() > 20) {
                        error.setAddressLengthErr("Pls type again Address from 6 -> 20 chars");
                        foundErr = true;
                  }
                  if (!checkFormat(Address, ADDRESS_NUMBERANDCHAR_PATTERN, true)) {
                        error.setAddressLengthErr("Pls type again Address, with have at least "
                                + "one char and one number");
                        foundErr = true;
                  }

                  if (foundErr) {
                        request.setAttribute("ADD_ORDER_ERROR", error);
                        url = "MainController" + "?btAction=New Order";
                  } else {
                        boolean result = dao.insertOrder(now, total, Address);
                        dao.addUserOrder(customerId);
                        int quantity = 1;
                        for (CageDTO value : cart.getProductItems().values()) {
                              dao.addOrderDetail(value.getCageID(), value.getQuantityOrder());

                        }
                        if (result) {
                              url = "MainController"
                                      + "?btAction=Order";

                        }
                  }
            } catch (SQLException ex) {
                  ex.printStackTrace();
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
