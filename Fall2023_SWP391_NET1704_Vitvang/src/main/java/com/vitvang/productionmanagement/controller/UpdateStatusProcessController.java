/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.dao.process.ProcessDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UpdateStatusProcessController", urlPatterns = {"/UpdateStatusProcessController"})
public class UpdateStatusProcessController extends HttpServlet {

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException, SQLException {
            response.setContentType("text/html;charset=UTF-8");
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
            String url = "NewLogin.jsp";
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
                        }
                  } else {
                        result = processdao.updateQuantityCompleted(addcompleted + quantityCompleted, ProcessID, OrderID, CageID);
                  }
                  if (result) {
                        url = "MainController?btAction=ViewProcessDetail";
                  }
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
