package com.vitvang.productionmanagement.controller;
import com.vitvang.productionmanagement.dao.cart.CartObj;
import com.vitvang.productionmanagement.model.CageDTO;
import com.vitvang.productionmanagement.model.UserDTO;
import com.vitvang.productionmanagement.util.Constant;
import static com.vitvang.productionmanagement.util.tool.checkRole;
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

           private static final String ERROR_PAGE = "ErrorPage.html";

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            String sku = request.getParameter("txtOrderCageID");
            String url = ERROR_PAGE;
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
                  if (sku == null) {
                        return;
                  }
                  // 1. cus go to cart place
                  // 2. cus take his cart
                  CartObj cart = (CartObj) session.getAttribute("CART");
                  if (cart == null) {
                        return;
                  }
                  // 3. cus drop item out

                  cart.removeItemFromPay(sku);
                  if (cart.getProductItems() == null) {
                        cart = null;
                  } else {
                        List<CageDTO> cageCart = new ArrayList<CageDTO>();
                        for (CageDTO cage : cart.getProductItems().values()) {
                              cageCart.add(cage);
                        }
                        request.setAttribute("CARTLIST", cageCart);
                        // cus coutinous shopping
                  }
                        session.setAttribute("CART", cart);
                        url = "MainController"
                                + "?btAction=New Order";

            } finally {
                  response.sendRedirect(url);
//                  RequestDispatcher rd = request.getRequestDispatcher(url);
//                  rd.forward(request, response);

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
