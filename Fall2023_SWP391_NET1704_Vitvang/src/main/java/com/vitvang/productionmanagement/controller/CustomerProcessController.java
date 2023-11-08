/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.dao.customer.CustomerDAO;
import com.vitvang.productionmanagement.model.ProcessDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Admin
 */
@WebServlet(name = "CustomerProcessController", urlPatterns = {"/CustomerProcessController"})
public class CustomerProcessController extends HttpServlet {

      private final String CustomerProcess = "CustomerProcess.jsp";

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException, SQLException {
            response.setContentType("text/html;charset=UTF-8");
            String url = "ErrorPage.html";
            try {
                  /* TODO output your page here. You may use following sample code. */
                  String UserID = request.getParameter("txtUserID");
                  String OrderID = request.getParameter("txtOrderID");
                  String CageID = request.getParameter("txtCageID");

                  CustomerDAO dao = new CustomerDAO();
                  dao.ViewProcessingOrder(OrderID, CageID, CageID);
                  List<ProcessDTO> list = dao.getListOrdersProcess();
                  if (list != null) {
                        for (ProcessDTO proces : list) {
                              if (proces.getStatus().equals("Processing")) {
                                    request.setAttribute("HIGHLIGHT", proces.getProcessID());
                                    break;
                              }
                        }
                  }
                  request.setAttribute("PROCESS_ORDER_RESULT", list);
                  url = CustomerProcess;
            } catch (SQLException e) {
                  e.printStackTrace();
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
                  Logger.getLogger(CustomerProcessController.class.getName()).log(Level.SEVERE, null, ex);
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
                  Logger.getLogger(CustomerProcessController.class.getName()).log(Level.SEVERE, null, ex);
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
