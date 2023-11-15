/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.dao.cart.CartObj;
import com.vitvang.productionmanagement.dao.order.OrderDAO;
import com.vitvang.productionmanagement.exception.order.OrderInsertError;
import com.vitvang.productionmanagement.model.CageDTO;
import com.vitvang.productionmanagement.model.UserDTO;
import com.vitvang.productionmanagement.util.Constant;
import static com.vitvang.productionmanagement.util.tool.checkRole;
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

      private static final String ERROR_PAGE = "ErrorPage.html";
      private final String ADDRESS_FORM_PATTERN = "([0-9]{1,4}[A-Z]?/[0-9]{1,3}\\s[a-zA-Z"
              + "ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơ"
              + "ƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈ"
              + "ỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]{1,30},[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]{1,30},[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]{1,30})";
      private final String ADDRESS_NUMBERANDCHAR_PATTERN = "(?=.[A-Za-z])(?=.\\d)[A-Za-z\\d]+";
      private final String QUANTITY_PATTERN = "(?!-)\\d+";

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException, ParseException {
            response.setContentType("text/html;charset=UTF-8");
            String url = ERROR_PAGE;
            // test
            String customerId = request.getParameter("txtCustomerID");
            String totalprice = request.getParameter("txtTotalPrice");
            if (totalprice == null) {
                  totalprice = "0";
            }
            int total = Integer.parseInt(totalprice);
            String Address = request.getParameter("txtAddress");

            String[] CageID = request.getParameterValues("txtOrderCageID");
            long millis = System.currentTimeMillis();
            java.sql.Date now = new java.sql.Date(millis);
            boolean foundErr = false;
            OrderInsertError error = new OrderInsertError();
            try {
                  HttpSession session = request.getSession();// phai luon co san session
                  UserDTO currUser = (UserDTO) session.getAttribute("USER");
                  if (currUser == null) {
                        return;
                  }
                  int roleID = currUser.getRoleID();
                  //0. check role 
                  if (!checkRole(roleID, Constant.isManager) && !checkRole(roleID, Constant.isStaff)) {
                        return;
                  }
                  CartObj cart = (CartObj) session.getAttribute("CART");
                  OrderDAO dao = new OrderDAO();

//                  if (!checkFormat(Address, ADDRESS_NUMBERANDCHAR_PATTERN, true)) {
//                        error.setAddressNumberErr("Pls type again Address, with have at least "
//                                + "one char and one number");
//                        foundErr = true;
//                  }
                  if (Address.trim().length() < 6) {
                        error.setAddressLengthErr("Pls type again, Address too short, maybe something wrong!!");
                        foundErr = true;
                  }

//                  if (!checkFormat(Address, ADDRESS_FORM_PATTERN, true)) {
//                        error.setAddressFormErr("Pls type again Address, e.g: 123 Hiệp Hòa, Biên Hòa Đồng Nai ");
//                        foundErr = true;
//                  }                
                  if (cart == null) {
                        error.setEmptyCartErr("Your cart is empty, Add more product please! ");
                        foundErr = true;
                  }
                  if (foundErr) {
                        request.setAttribute("ADD_ORDER_ERROR", error);
                        url = "MainController?btAction=New Order";
                  } else {
                        boolean result = dao.insertOrder(now, total, Address);
                        dao.addUserOrder(customerId);
                        int quantityTmp = 1;
                        for (CageDTO value : cart.getProductItems().values()) {
                              dao.addOrderDetail(value.getCageID(), value.getQuantityOrder());
                        }
                        if (result) {
                              cart = null;
                              url = "MainController"
                                      + "?btAction=Detail"
                                      + "&txtOrderID="+ dao.NewestOrder();
                              session.removeAttribute("CART");
                        }
                  }
            } catch (SQLException ex) {
                  String msg = ex.getMessage();
                  log("UpdateAccountServlet _ SQL " + msg);
                  error.setNullQuantityErr("Not accept Null quantity!!!");
                  request.setAttribute("ADD_ORDER_ERROR", error);
            } catch (NamingException ex) {
                  log("UpdateAccountServlet _ Naming " + ex.getMessage());
            } catch (NumberFormatException ex) {
                  String msg = ex.getMessage();
                  log("UpdateAccountServlet _ SQL " + msg);
                  error.setNullQuantityErr("Not accept Null quantity!!!");
                  request.setAttribute("ADD_ORDER_ERROR", error);
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
