/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vitvang.productionmanagement.controller;

import my.vitvang.productionmanagement.model.DesignForProcessDTO;
import com.vitvang.productionmanagement.dao.process.ProcessDAO;
import static com.vitvang.productionmanagement.util.tool.calculateProcessDate;
import com.vitvang.productionmanagement.dao.designforprocess.DesignForProcessDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

/**
 *
 * @author thetam
 */
@WebServlet(name = "UpdateSatusNewOrderController", urlPatterns = {"/UpdateSatusNewOrderController"})
public class UpdateSatusNewOrderController extends HttpServlet {

      private final String PROCESS_OF_CAGE_PAGE = "process.jsp";

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException, SQLException {
            response.setContentType("text/html;charset=UTF-8");
            // get param from view
            String orderID = request.getParameter("txtOrderID");
            String cageID = request.getParameter("txtCageID");
            String StartDate = request.getParameter("txtStartDate");
            Date startdate = Date.valueOf(StartDate);
            Date endDate;
            String Quantity = request.getParameter("txtQuantity");
            int quantityorder = Integer.parseInt(Quantity);
            String newStatus = "";
          
            String url = "newLogin.jsp";
            boolean result1 = false;
            boolean result2 = false;
            int i = 1;
            try {
                  // new dao
                  ProcessDAO processdao = new ProcessDAO();
                  DesignForProcessDAO designdao = new DesignForProcessDAO();
                  //2. call method
                  designdao.ViewDesignForProcess(cageID);
                  //3. process result
                  List<DesignForProcessDTO> designList = designdao.getDesignProcessList();
                  for (DesignForProcessDTO designDTO : designList) {
                        if(i == 1 ){
                              newStatus = "Processing";
                        } else {
                              newStatus = "not yet";
                        }
                        endDate = calculateProcessDate
        (startdate, quantityorder, designDTO.getTimeProcess(), designDTO.getNumberOfEmployee(), designDTO.getNumCompletionCage());
                       result1 = processdao.AutoAddProcess(i, orderID, newStatus, startdate, endDate, designDTO);
                        i++;
                        startdate = endDate;
                  }
                  result2 = processdao.updateStatusNewOrder(orderID, cageID);
                  
                  if (result1 && result2) {
                        url = "MainController?btAction=Production process";
                  }

            } catch (SQLException ex) {
                  log("UpdateSatusNewOrderController _ SQL" + ex.getMessage());
            } catch (NamingException ex) {
                  log("UpdateSatusNewOrderController _ NAMING" + ex.getMessage());
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
                  Logger.getLogger(UpdateSatusNewOrderController.class.getName()).log(Level.SEVERE, null, ex);
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
                  Logger.getLogger(UpdateSatusNewOrderController.class.getName()).log(Level.SEVERE, null, ex);
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
