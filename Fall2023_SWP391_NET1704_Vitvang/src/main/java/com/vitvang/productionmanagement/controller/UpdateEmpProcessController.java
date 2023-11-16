package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.dao.designforprocess.DesignForProcessDAO;
import com.vitvang.productionmanagement.dao.historyupdateprocess.HistoryUpdateProcessDAO;
import com.vitvang.productionmanagement.dao.process.ProcessDAO;
import com.vitvang.productionmanagement.model.DesignForProcessDTO;
import com.vitvang.productionmanagement.model.ProcessDTO;
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
 * @author The Tam
 */
@WebServlet(name = "UpdateEmpProcessController", urlPatterns = {"/UpdateEmpProcessController"})
public class UpdateEmpProcessController extends HttpServlet {

      private static final String ERROR_PAGE = "ErrorPage.html";

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException, SQLException {
            response.setContentType("text/html;charset=UTF-8");
            String ProcessID = request.getParameter("txtProcessID");
            String OrderID = request.getParameter("txtOrderID");
            String CageID = request.getParameter("txtCageID");
            String NumberOfEmployee = request.getParameter("txtNumberOfEmployee");
            long millis = System.currentTimeMillis();
            java.sql.Date now = new java.sql.Date(millis);
            int employee = Integer.parseInt(NumberOfEmployee);
            Date startDate = null;
            Date endDate = null;
            boolean flag = false;
            boolean result = false;
            String content = "Update number of employee to: " + NumberOfEmployee;
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
                  // 1.new DAO
                  ProcessDAO processdao = new ProcessDAO();
                  HistoryUpdateProcessDAO historydao = new HistoryUpdateProcessDAO();
                  DesignForProcessDAO designdao = new DesignForProcessDAO();
                  //2. call method DAO
                  designdao.ViewDesignForProcess(CageID);
                  processdao.ViewProcessingOrder(OrderID, CageID, CageID);

                  List<DesignForProcessDTO> designList = designdao.getDesignProcessList();
                  // proces result
                  for (ProcessDTO process : processdao.getListOrdersProcess()) {
                        if (process.getProcessID().equals(ProcessID)) {
                              if (process.getNumberOfEmployee() == employee) {
                                    url = "MainController?btAction=ViewProcessDetail"
                                            + "&ProcessID=" + ProcessID
                                            + "&CageID=" + CageID;;
                                    return;
                              }
//                              for (DesignForProcessDTO design : designList) {
                              DesignForProcessDTO design = designdao.getCurentDesign(CageID, process.getPhrase());
                              if (design != null) {
                                    endDate = calculateProcessDate(process.getStartDate(), process.getQuantity(),
                                            design.getTimeProcess(), design.getNumberOfEmployee(),
                                            design.getNumCompletionCage(), employee);
                                    processdao.updateTimeProcess(process.getProcessID(), OrderID, CageID, process.getStartDate(), endDate, employee);
                                    startDate = endDate;
                                    flag = true;
//                                          break;
                              }
//                              }
                        } else if (flag) {
//                              for (DesignForProcessDTO design : designList) {
                              DesignForProcessDTO design = designdao.getCurentDesign(CageID, process.getPhrase());
                              if (design != null) {
                                    endDate = calculateProcessDate(startDate, process.getQuantity(),
                                            design.getTimeProcess(), design.getNumberOfEmployee(),
                                            design.getNumCompletionCage(), process.getNumberOfEmployee());
                                    processdao.updateTimeProcess(process.getProcessID(), OrderID, CageID, startDate, endDate, process.getNumberOfEmployee());
                                    startDate = endDate;
                                    flag = true;
//                                          break;
                              }
//                              }
                        }
                  }
                  result = historydao.insertHistory(ProcessID, OrderID, CageID, now, content, "Employee", currUser.getUserID());
                  if (result) {
                        url = "MainController?btAction=ViewProcessDetail"
                                + "&ProcessID=" + ProcessID
                                + "&CageID=" + CageID;
                  }
            } catch (SQLException ex) {
                  log("UpdateEmpProcessController _ SQL" + ex.getMessage());
            } catch (NamingException ex) {
                  log("UpdateEmpProcessController _ NAMING" + ex.getMessage());
            } finally {
//                  response.sendRedirect(url); // dùng RequestDispatcher cũng được
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
                  Logger.getLogger(UpdateEmpProcessController.class.getName()).log(Level.SEVERE, null, ex);
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
                  Logger.getLogger(UpdateEmpProcessController.class.getName()).log(Level.SEVERE, null, ex);
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
