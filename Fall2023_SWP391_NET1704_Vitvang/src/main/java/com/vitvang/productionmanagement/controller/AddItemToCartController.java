/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.dao.cart.CartObj;
import com.vitvang.productionmanagement.model.CageDTO;
import com.vitvang.productionmanagement.model.UserDTO;
import com.vitvang.productionmanagement.util.Constant;
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
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AddItemToCartController", urlPatterns = {"/AddItemToCartController"})
public class AddItemToCartController extends HttpServlet {
//      private final String ORDER_ADD_PAGE = "MainController?btAction=New Order";

      private static final String ERROR_PAGE = "ErrorPage.html";

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            String sku = request.getParameter("txtCageID");
            String quantity = request.getParameter("txtQuantity");
            int RequestQuantity = (!quantity.isEmpty()) ? Integer.parseInt(quantity) : 1;
            String url = ERROR_PAGE;
            try {
                  // 1. Cus goes to chartt's place
                  // 2. Cus takes his cart
                  HttpSession session = request.getSession(); // phai luon co san session
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
                  if (cart == null) {
                        cart = new CartObj();
                  }

                  // 3. Cus drops items to his cart
                  cart.addCageToCart(sku, RequestQuantity);
                  List<CageDTO> cageCart = new ArrayList<CageDTO>();
                  for (CageDTO cage : cart.getProductItems().values()) {
                        cageCart.add(cage);
                  }
                  request.setAttribute("CARTLIST", cageCart);
                  session.setAttribute("CART", cart);
                  // 4. Cus continuously goes to shopping
                  url = "MainController"
                          + "?btAction=New Order";

            } catch (SQLException ex) {
                  String msg = ex.getMessage();
                  log("CalculateDetailMaterial SQL" + msg);
            } catch (NamingException ex) {
                  String msg = ex.getMessage();
                  log("CalculateDetailMaterial SQL" + msg);
            } finally {
//            response.sendRedirect(url); // dùng RequestDispatcher cũng được
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
