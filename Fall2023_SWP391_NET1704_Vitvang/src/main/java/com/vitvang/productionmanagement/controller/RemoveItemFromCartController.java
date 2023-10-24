/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vitvang.productionmanagement.controller;
import com.vitvang.productionmanagement.dao.cart.CartObj;
import com.vitvang.productionmanagement.model.CageDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "RemoveItemFromCartController", urlPatterns = {"/RemoveItemFromCartController"})
public class RemoveItemFromCartController extends HttpServlet {

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            String sku = request.getParameter("txtOrderCageID");
            String url = "NewLogin.jsp";
            try {
                  if (sku == null) {
                        return;
                  }
                  // 1. cus go to cart place
                  HttpSession session = request.getSession();
                  // 2. cus take his cart
                  CartObj cart = (CartObj) session.getAttribute("CART");
                  if (cart == null) {
                        return;
                  }
                  // 3. cus drop item out

                  cart.removeItemFromPay(sku);
                  if (cart.getProductItems() == null) {
                        cart = null;
                  }
                  List<CageDTO> cageCart = new ArrayList<CageDTO>();
                  for (CageDTO cage : cart.getProductItems().values()) {
                        cageCart.add(cage);
                  }
                  request.setAttribute("CARTLIST", cageCart);
                  session.setAttribute("CART", cart);
                  // cus coutinous shopping
                  url = "MainController"
                          + "?btAction=New Order";

            } finally {
                  RequestDispatcher rd = request.getRequestDispatcher(url);
                  rd.forward(request, response);

            }
      }

      
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