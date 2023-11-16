/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.dao.process.ProcessDAO;
import com.vitvang.productionmanagement.model.ProcessDTO;
import com.vitvang.productionmanagement.model.UserDTO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CustomerProcessController", urlPatterns = {"/CustomerProcessController"})
public class CustomerProcessController extends HttpServlet {

      private final String CustomerProcess = "CustomerProcess.jsp";

      private final String ProcessDetail = "CustomerProcess.jsp";

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException, SQLException {
            response.setContentType("text/html;charset=UTF-8");
            String url = "ErrorPage.html";
            String OrderID = request.getParameter("txtOrderID");
            String CageID = request.getParameter("txtCageID");
            String ProcessID = request.getParameter("txtProcessID");
            String button = request.getParameter("btAction");
            try {
                  HttpSession session = request.getSession();// phai luon co san session
                  UserDTO currUser = (UserDTO) session.getAttribute("USER");
                  if (currUser == null) {
                        return;
                  }
//                  int roleID = currUser.getRoleID();
//                  //0. check role 
//                  if (!checkRole(roleID, Constant.isManager) && !checkRole(roleID, Constant.isStaff)) {
//                        return;
//                  }
                  ProcessDAO dao = new ProcessDAO();

                  if (ProcessID == null) {
                        ProcessID = "PR001";
                  }
                  dao.ViewProcessingOrder(OrderID, CageID, CageID);
//                        List<ProcessDTO> process = dao.getListOrdersProcess();
                  ProcessDTO eachStep = new ProcessDTO();
                  eachStep = dao.GetProcessingbyID(OrderID, CageID, ProcessID);
                  if (eachStep != null) {
                        request.setAttribute("CURRENT_STEP", eachStep);
                        System.out.println(eachStep.getProcessID());
                        if (eachStep.getStatus().equals("Processing")) {
                              request.setAttribute("HIGHLIGHT", eachStep.getProcessID());
                        }
                  }
                  request.setAttribute("PROCESS_RESULT", dao.getListOrdersProcess());
                  url = ProcessDetail;
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
