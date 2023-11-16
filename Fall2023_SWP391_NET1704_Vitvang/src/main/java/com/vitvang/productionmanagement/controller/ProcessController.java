package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.dao.historyupdateprocess.HistoryUpdateProcessDAO;
import com.vitvang.productionmanagement.dao.process.ProcessDAO;
import com.vitvang.productionmanagement.model.ProcessDTO;
import com.vitvang.productionmanagement.model.ProcessNewOrderDTO;
import com.vitvang.productionmanagement.model.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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
                  HttpSession session  = request.getSession();
                  UserDTO currUser = (UserDTO) session.getAttribute("USER");
                  if (currUser == null) {
                        return;
                  }    
                  ProcessDAO dao = new ProcessDAO();
                  HistoryUpdateProcessDAO historydao = new HistoryUpdateProcessDAO();
                  if (!button.equals("ViewProcessDetail")) {
                        dao.ViewNewOrder();
                        List<ProcessNewOrderDTO> processNewOrder = dao.getListProcessNewOrder();
                        request.setAttribute("PROCESSNEWORDER_RESULT", processNewOrder);
                        url = Process;
                  } else {
                        if(ProcessID == null){
                              ProcessID = "PR001";
                        }
                        dao.ViewProcessingOrder(OrderID, CageID, CageID);
                        historydao.ViewHistoryCurrentProcess(ProcessID, CageID, OrderID);
//                        List<ProcessDTO> process = dao.getListOrdersProcess();
                        ProcessDTO currentStep = new ProcessDTO();
                        currentStep = dao.GetProcessingbyID(OrderID, CageID, ProcessID);
                        if (currentStep != null) {
                              request.setAttribute("CURRENT_STEP" , currentStep);
                              
                              System.out.println(currentStep.getProcessID());
                              if (currentStep.getStatus().equals("Processing")) {
                                    request.setAttribute("HIGHLIGHT" , currentStep.getProcessID());
                              }
                        }
                        // get all step of process 
                        request.setAttribute("PROCESS_RESULT", dao.getListOrdersProcess());
                        // get list history of update process before of current step
                        request.setAttribute("HISTORY_UPDATE", historydao.getListHistoryUpdateProcess());
                        url = ProcessDetail;

                  }              
            } catch (SQLException e) {
                  log("LOGINSERVLET _ SQL" + e.getMessage());
            } finally {
//                  response.sendRedirect(url);
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