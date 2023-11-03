package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.dao.order.OrderDAO;
import com.vitvang.productionmanagement.dao.process.ProcessDAO;
import com.vitvang.productionmanagement.model.DetailOrderDTO;
import com.vitvang.productionmanagement.model.ProcessDTO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UpdateStatusProcessController", urlPatterns = {"/UpdateStatusProcessController"})
public class UpdateStatusProcessController extends HttpServlet {

      private static final String ERROR_PAGE = "ErrorPage.html";

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException, SQLException {
            response.setContentType("text/html;charset=UTF-8");
            String Status = request.getParameter("txtStatus");
            String ProcessID = request.getParameter("txtProcessID");
            String OrderID = request.getParameter("txtOrderID");
            String CageID = request.getParameter("txtCageID");
            String LastStep = request.getParameter("LastStep");
            String addComplete = request.getParameter("txtCompletedAdd");
            String quanneedproduct = request.getParameter("txtTotalQuantity");
            String txtquantityCompleted = request.getParameter("txtquantityCompleted");
            int addcompleted = Integer.parseInt(addComplete);
            int totalquanNeed = Integer.parseInt(quanneedproduct);
            int quantityCompleted = Integer.parseInt(txtquantityCompleted);
            long millis = System.currentTimeMillis();
            java.sql.Date now = new java.sql.Date(millis);

            String url = ERROR_PAGE;
            boolean result = false;
            boolean full = false;
            boolean laststep = false;
            try {
                  if (!LastStep.trim().isEmpty()) {
                        laststep = true;
                  }
                  ProcessDAO processdao = new ProcessDAO();
                  if (addcompleted >= totalquanNeed - quantityCompleted) {
                        full = processdao.updateQuantityCompleted(totalquanNeed, ProcessID, OrderID, CageID);
                        if (full) {
                              result = processdao.updateStatusProcessToDone("Done", ProcessID, OrderID, CageID, laststep);
                              OrderDAO orderdao = new OrderDAO();
                              boolean orderdone = false;
                              for (DetailOrderDTO listOrderDetail : orderdao.getListOrderDetails()) {
                                    if (listOrderDetail.getStatus() != "Done") {
                                          orderdone = false;
                                    }
                              }
                              if (orderdone) {
                                  result =  orderdao.updateOrderStatus(OrderID, now, "Done");
                              }

                        }
                  } else {
                        result = processdao.updateQuantityCompleted(addcompleted + quantityCompleted, ProcessID, OrderID, CageID);
                  }

                  if (result) {
                        url = "MainController?btAction=ViewProcessDetail";
                  }
            } catch (SQLException ex) {
                  String msg = ex.getMessage();
                  log("UpdateStatusProcessController SQL" + msg);
            } catch (NamingException ex) {
                  String msg = ex.getMessage();
                  log("UpdateStatusProcessController NAMING" + msg);
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
                  Logger.getLogger(UpdateStatusProcessController.class.getName()).log(Level.SEVERE, null, ex);
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
                  Logger.getLogger(UpdateStatusProcessController.class.getName()).log(Level.SEVERE, null, ex);
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
