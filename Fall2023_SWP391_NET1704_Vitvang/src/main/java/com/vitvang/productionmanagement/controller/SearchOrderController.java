package com.vitvang.productionmanagement.controller;
<<<<<<< HEAD
import com.vitvang.productionmanagement.dao.order.OrderDAO;
import com.vitvang.productionmanagement.model.OrderDTO;
import jakarta.servlet.RequestDispatcher;
=======

import com.vitvang.productionmanagement.dao.process.ProcessDAO;
import com.vitvang.productionmanagement.model.ProcessDTO;
import com.vitvang.productionmanagement.model.ProcessNewOrderDTO;
>>>>>>> 5e3c144c3fe79b26c984af5334d6a208df613300
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ProcessController", urlPatterns = {"/ProcessController"})
public class ProcessController extends HttpServlet {

      private final String Process = "Process.jsp";
      private final String ProcessDetail = "ProcessDetail.jsp";
      private static final String ERROR_PAGE = "ErrorPage.html";

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException, SQLException {
            response.setContentType("text/html;charset=UTF-8");
            String url = ERROR_PAGE;
            String OrderID = request.getParameter("txtOrderID");
            String CageID = request.getParameter("txtCageID");
            String ProcessID = request.getParameter("txtProcessID");
            String button = request.getParameter("btAction");
            try {
//                  ProcessDAO dao = new ProcessDAO();
//                  if (!button.equals("ViewProcessDetail")) {
//                        dao.ViewNewOrder();
//                        List<ProcessNewOrderDTO> processNewOrder = dao.getListProcessNewOrder();
//                        request.setAttribute("PROCESSNEWORDER_RESULT", processNewOrder);
//                        url = Process;
//                  } else {
//                        if(ProcessID == null){
//                              ProcessID = "PR001";
//                        }
//                        dao.ViewProcessingOrder(OrderID, CageID, CageID);
////                        List<ProcessDTO> process = dao.getListOrdersProcess();
//                        ProcessDTO eachStep = new ProcessDTO();
//                        eachStep = dao.GetProcessingbyID(OrderID, CageID, ProcessID);
//                        if (eachStep != null) {
//                              request.setAttribute("STEP_PROCESS" , eachStep);
//                              if (eachStep.getStatus().equals("Processing")) {
//                                    request.setAttribute("HIGHLIGHT" , eachStep.getProcessID());
//                              }
//                        }
//                        request.setAttribute("PROCESS_RESULT", dao.getListOrdersProcess());
//                        url = ProcessDetail;

//                  }
                  ProcessDAO dao = new ProcessDAO();
                  if (!button.equals("ViewProcessDetail")) {
                        dao.ViewNewOrder();
                        List<ProcessNewOrderDTO> processNewOrder = dao.getListProcessNewOrder();
                        request.setAttribute("PROCESSNEWORDER_RESULT", processNewOrder);
                        url = Process;
                  } else {
                        dao.ViewProcessingOrder(OrderID, CageID, CageID);
                        List<ProcessDTO> process = dao.getListOrdersProcess();
                        for (ProcessDTO proces : process) {
                              if (proces.getStatus().equals("Processing")) {
                                    request.setAttribute("HIGHLIGHT", proces.getProcessID());
                                    break;
                              }
                        }
                        request.setAttribute("PROCESS_RESULT", process);
                        url = ProcessDetail;
                  }
            } catch (SQLException e) {
                  log("LOGINSERVLET _ SQL" + e.getMessage());
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
                  Logger.getLogger(ProcessController.class.getName()).log(Level.SEVERE, null, ex);
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
                  Logger.getLogger(ProcessController.class.getName()).log(Level.SEVERE, null, ex);
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
