package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.dao.cage.CageDAO;
import com.vitvang.productionmanagement.dao.cart.CartObj;
import com.vitvang.productionmanagement.dao.order.OrderDAO;
import com.vitvang.productionmanagement.dao.users.UserDAO;
import com.vitvang.productionmanagement.model.CageDTO;
import com.vitvang.productionmanagement.model.UserDTO;
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
@WebServlet(name = "ListCageController", urlPatterns = {"/ListCageController"})
public class ListCageController extends HttpServlet {

      private final String ADD_ORDER_PAGE = "OrderAdd.jsp";
      private static final String ERROR_PAGE = "ErrorPage.html";

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            String url = ERROR_PAGE;
            try {
                  HttpSession session  = request.getSession();
                  UserDTO currUser = (UserDTO) session.getAttribute("USER");
                  if (currUser == null) {
                        return;
                  } 
                  CartObj cart = (CartObj) session.getAttribute("CART");
                  List<CageDTO> cageCart = new ArrayList<CageDTO>();
                  if (cart != null) {
                        for (CageDTO cage : cart.getProductItems().values()) {
                              cageCart.add(cage);
                        }
                  }
                  //1. call DAO
                  CageDAO dao = new CageDAO();
                  UserDAO userdao = new UserDAO();
                  OrderDAO orderdao = new OrderDAO();
                  //1.2. call method
                  dao.AllProduction();
                  userdao.getAllCustomer();
                  orderdao.getListOrders();
                  // process result
                  List<CageDTO> result1 = dao.getListCage();
                  List<UserDTO> result2 = userdao.getListUser();
                  session.setAttribute("CAGE_LIST", result1);
                  session.setAttribute("CUSTOMER_LIST", result2);
                  request.setAttribute("CARTLIST", cageCart);
                  url = ADD_ORDER_PAGE;
            } catch (SQLException e) {
                  log("SEARCHCAGESERVLET _ SQL" + e.getMessage());
            } catch (NamingException e) {
                  log("SEARCHCAGESERVLET _ SQL" + e.getMessage());
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
