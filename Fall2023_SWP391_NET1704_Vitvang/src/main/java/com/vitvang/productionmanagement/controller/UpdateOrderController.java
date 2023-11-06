package com.vitvang.productionmanagement.controller;
import com.vitvang.productionmanagement.model.UserDTO;
import com.vitvang.productionmanagement.dao.order.OrderDAO;
import com.vitvang.productionmanagement.exception.order.OrderUpdateError;
import static com.vitvang.productionmanagement.util.tool.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UpdateOrderController", urlPatterns = {"/UpdateOrderController"})
public class UpdateOrderController extends HttpServlet {

      private final String ERROR_UPDATE_PAGE = "EditOrder.jsp";
            private static final String ERROR_PAGE = "ErrorPage.html";

     
      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            String OrderID = request.getParameter("txtOrderID");
            String StartDate = request.getParameter("txtStartDate");
            String EndDate = request.getParameter("txtEndDate");
            String Address = request.getParameter("txtAddress");
            String StatusProcess = request.getParameter("txtStatusProgress");
//            String CustomerID = request.getParameter("txtCustomerID").toUpperCase();
            // this param use for reload search page after update sucess
            String searchValue = request.getParameter("lastSearchValue");
            Date productStartDate = Date.valueOf(StartDate);
            Date productEndDate = Date.valueOf(EndDate);
            String url = ERROR_PAGE;
            boolean foundErr = false;
            OrderUpdateError error = new OrderUpdateError();
            try {
                  //0. check role 
                  HttpSession session = request.getSession();
                  int roleID = ((UserDTO) session.getAttribute("USER")).getRoleID();

                  // get user session
                  if (compareDate(productStartDate, productEndDate)) {
                        foundErr = true;
                        error.setStartDateAfterEndDateErr("Start date can't before End date");
                  }
                  if (Address.trim().length() < 5) {
                        foundErr = true;
                        error.setAddressNullErr("Address too short");
                  }
                  if (StatusProcess.isEmpty()) {
                        foundErr = true;
                        error.setStatusProgessNullErr("Process can't be empty");
                  }
//                  if (!checkFormat(CustomerID, CUSTOMER_PATTERN, true)) {
//                        foundErr = true;
//                        error.setCustomerFormatErr("Cus format is CSxxx");
//                  }
                  if (!checkRole(roleID, 1)) {
                        foundErr = true;
                        error.setAccountCanNotUpdateErr("This account can't update order");
                  }
                  if (foundErr) {// found error
                        // set errors obj to attribute of request scope
                        request.setAttribute("UPDATE_ORDER_ERROR", error);
                  } else {// not found any error
                        //1. cal model
                        //1.1 new DAO
                        OrderDAO dao = new OrderDAO();
                        //1.2 call DAO's methods
                        boolean result = dao.updateOrder(OrderID, productStartDate, productEndDate, Address, StatusProcess);
                        //2.process
                        if (result) {
                              //2.1 call the search function again using URL Rewriting
                              url = "SearchOrderController"
                                      + "?btAction=Search"
                                      + "&txtSearchValue=" + searchValue;
                        }// end of process
                  }
            } catch (SQLException ex) {
                  String msg = ex.getMessage();
                  log("UpdateAccountServlet _ SQL " + msg);
                  if (msg.contains("conflicted with the FOREIGN KEY")) {
                        error.setCustomerNotExistInDatabasErr("Customer not exist in database");
                        request.setAttribute("UPDATE_ORDER_ERROR", error);
                  }
            } catch (NamingException ex) {
                  log("UpdateAccountServlet _ Naming " + ex.getMessage());
            } finally {
//            response.sendRedirect(url);
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
