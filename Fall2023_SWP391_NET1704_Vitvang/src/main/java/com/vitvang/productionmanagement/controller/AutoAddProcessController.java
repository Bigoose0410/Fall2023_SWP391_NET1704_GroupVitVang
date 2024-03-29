/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.dao.designforprocess.DesignForProcessDAO;
import com.vitvang.productionmanagement.dao.order.OrderDAO;
import com.vitvang.productionmanagement.dao.process.ProcessDAO;
import com.vitvang.productionmanagement.exception.processs.AutoAddProcessErr;
import com.vitvang.productionmanagement.model.DesignForProcessDTO;
import com.vitvang.productionmanagement.model.DetailOrderDTO;
import com.vitvang.productionmanagement.model.UserDTO;
import com.vitvang.productionmanagement.util.Constant;
import static com.vitvang.productionmanagement.util.tool.calculateProcessDate;
import static com.vitvang.productionmanagement.util.tool.checkRole;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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
@WebServlet(name = "AutoAddProcessController", urlPatterns = {"/AutoAddProcessController"})
public class AutoAddProcessController extends HttpServlet {

      private static final String ERROR_PAGE = "ErrorPage.html";
      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException, SQLException {
            response.setContentType("text/html;charset=UTF-8");
            // get param from view
            String orderID = request.getParameter("txtOrderID");
            String cageID = request.getParameter("txtCageID");
            long millis = System.currentTimeMillis();
            java.sql.Date startdate = new java.sql.Date(millis);
            Date endDate;
            String Quantity = request.getParameter("txtQuantity");
            int quantityorder = Integer.parseInt(Quantity);
            String newStatus = "";
            String url = ERROR_PAGE;
            AutoAddProcessErr error = new AutoAddProcessErr();
            boolean foundErr = false;
            boolean result1 = false;
            boolean result2 = false;
            int i = 1;
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
                  DesignForProcessDAO designdao = new DesignForProcessDAO();
                  designdao.ViewDesignForProcess(cageID);
                  List<DesignForProcessDTO> designList = null;
                  designList = designdao.getDesignProcessList();
                  if (designList.isEmpty()) {
                        error.setDesignListLength("Check your step process again !!!");
                        foundErr = true;
                  }
                  if (!designList.isEmpty()) {
                        if(designList.size() < 3){
                        error.setDesignListLength("Your step not reađy !!!");
                        foundErr = true;
                        }
                  }
                  if (foundErr) {
                        request.setAttribute("AUTO_ADD_ERR", error);
                        url = "MainController?btAction=Production process";
                  } else {
                        // new dao
                        OrderDAO orderdao = new OrderDAO();
                        ProcessDAO processdao = new ProcessDAO();
                        //2. call method
                        //3. process result
                        DetailOrderDTO getquantity = orderdao.query1LineOrderDetail(orderID, cageID);
                        System.out.println("Auto add process to Order");
                        for (DesignForProcessDTO designDTO : designList) {
                              if (i == 1) {
                                    newStatus = "Processing";
                              } else {
                                    newStatus = "not yet";
                              }
                              endDate = calculateProcessDate(startdate, quantityorder,
                                      designDTO.getTimeProcess(), designDTO.getNumberOfEmployee(),
                                      designDTO.getNumCompletionCage(), 1);
                              result1 = processdao.AutoAddProcess(i, orderID, newStatus, startdate, endDate, getquantity.getQuantity(), designDTO);
                              i++;
                              System.out.println("Buoc " + i);
                              System.out.println("StartDate:" + startdate);
                              System.out.println("End Date:" + endDate);
                              System.out.println("------------------------------");
                              startdate =(endDate);
                              
                        }
                        result2 = processdao.updateStatusNewOrder(orderID, cageID);

                        if (result1 && result2) {
                              url = "MainController?btAction=Production process";
                        }
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
                  Logger.getLogger(AutoAddProcessController.class.getName()).log(Level.SEVERE, null, ex);
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
                  Logger.getLogger(AutoAddProcessController.class.getName()).log(Level.SEVERE, null, ex);
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
