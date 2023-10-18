/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.dao.cart.CartObj;
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
@WebServlet(name = "AddItemToCartController", urlPatterns = {"/AddItemToCartController"})
public class AddItemToCartController extends HttpServlet {
      private final String ORDER_ADD_PAGE = "orderAdd.jsp";
      /**
       * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
       *
       * @param request servlet request
       * @param response servlet response
       * @throws ServletException if a servlet-specific error occurs
       * @throws IOException if an I/O error occurs
       */
      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
        String sku = request.getParameter("txtCageID");
        String quantity = request.getParameter("txtQuantity");
        int RequestQuantity = (!quantity.isEmpty()) ? Integer.parseInt(quantity) : 1;
        String url = ORDER_ADD_PAGE;
        try {
            // 1. Cus goes to chartt's place
            // 2. Cus takes his cart
              HttpSession session = request.getSession(); // phai luon co san session
            
              CartObj cart = (CartObj) session.getAttribute("CART");
            if (cart == null) {
                cart = new CartObj();
            }
            if (RequestQuantity > 1) {
                    cart.addManyItemToCart(sku, Integer.parseInt(quantity));
                } else {
                    cart.addItemToCart(sku);
                }
                session.setAttribute("CART", cart);
                // 3. Cus drops items to his cart
                cart.addCageToCart(sku, RequestQuantity);
                session.setAttribute("CART", cart);
            // 4. Cus continuously goes to shopping
            url = "MainController"
                    + "?btAction=New Order";
                    
        }catch(SQLException ex){
        String msg= ex.getMessage();
        log("CalculateDetailMaterial SQL" + msg);
        }catch(NamingException ex ){
        String msg = ex.getMessage();
        log("CalculateDetailMaterial SQL" + msg);
        }finally {
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
