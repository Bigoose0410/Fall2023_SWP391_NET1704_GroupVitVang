<<<<<<< HEAD
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.dao.process.ProcessDAO;
import com.vitvang.productionmanagement.model.ProcessDTO;
import java.io.IOException;

=======
package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.dao.order.OrderDAO;
import com.vitvang.productionmanagement.dao.process.ProcessDAO;
import com.vitvang.productionmanagement.model.ProcessDTO;
import static com.vitvang.productionmanagement.util.tool.DateAfterReduce;
import static com.vitvang.productionmanagement.util.tool.calculateDateReduce;
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
<<<<<<< HEAD
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
=======
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea

/**
 *
 * @author Admin
 */
@WebServlet(name = "UpdateStatusProcessController", urlPatterns = {"/UpdateStatusProcessController"})
public class UpdateStatusProcessController extends HttpServlet {

<<<<<<< HEAD
=======
      private static final String ERROR_PAGE = "ErrorPage.html";

>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
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
<<<<<<< HEAD

            String url = "NewLogin.jsp";
            boolean result = false;
            boolean full = false;
            boolean laststep = false;
=======
            long millis = System.currentTimeMillis();
            java.sql.Date now = new java.sql.Date(millis);

            String url = ERROR_PAGE;
            boolean result = false;
            boolean full = false;
            boolean laststep = false;
            boolean updatefrom = false;
            Date startDate = null;
            Date endDate = null;
            int dateWillReduce = 0;
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
            try {
                  if (!LastStep.trim().isEmpty()) {
                        laststep = true;
                  }
                  ProcessDAO processdao = new ProcessDAO();
<<<<<<< HEAD
                  if (addcompleted >= totalquanNeed - quantityCompleted) {
                        full = processdao.updateQuantityCompleted(totalquanNeed, ProcessID, OrderID, CageID);
                        if (full) {
                            result = processdao.updateStatusProcessToDone("Done", ProcessID, OrderID, CageID, laststep);
=======
                  OrderDAO orderdao = new OrderDAO();
                  if (addcompleted >= totalquanNeed - quantityCompleted) {
                        full = processdao.updateQuantityCompleted(totalquanNeed, ProcessID, OrderID, CageID);
                        if (full) {
                              result = processdao.updateStatusProcessToDone("Done", ProcessID, OrderID, CageID, laststep);
                              if (laststep) {
                                    orderdao.queryOrderDetail(OrderID);
                                    boolean orderdone = false;
                                    orderdone = orderdao.countOrderDetailnotDone(OrderID);
                                    if (orderdone) {
                                          result = orderdao.updateOrderStatus(OrderID, now, "Done");
                                    }
                              } else {
                                    // get all process of processing of this order with cage
                                    processdao.ViewProcessingOrder(OrderID, CageID, CageID);
                                    for (ProcessDTO process : processdao.getListOrdersProcess()) {
                                          // kiem tra xem can update tu buoc nao
                                          if (process.getProcessID().equals(ProcessID)) {
                                                // update tu buoc nay
                                                updatefrom = true;
                                                // cap nhat endate cua buoc dau tien la thoi diem hien tai
                                                processdao.updateTimeProcess(process.getProcessID(), OrderID, CageID, process.getStartDate(), now, process.getNumberOfEmployee());
                                                dateWillReduce = calculateDateReduce(process.getEndDate(), now);
                                          }
                                          if (updatefrom == true && !process.getProcessID().equals(ProcessID) ) {
                                                
                                                endDate = DateAfterReduce(process.getStartDate(), dateWillReduce);
                                                processdao.updateTimeProcess(process.getProcessID(), 
                                                        OrderID, CageID, 
                                                        DateAfterReduce(process.getStartDate(), dateWillReduce), 
                                                        DateAfterReduce(process.getEndDate(), dateWillReduce), 
                                                        process.getNumberOfEmployee());
                                          }
                                    }
                              }
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
                        }
                  } else {
                        result = processdao.updateQuantityCompleted(addcompleted + quantityCompleted, ProcessID, OrderID, CageID);
                  }

                  if (result) {
                        url = "MainController?btAction=ViewProcessDetail";
                  }
<<<<<<< HEAD
            } catch (SQLException e) {
                  e.printStackTrace();
=======
            } catch (SQLException ex) {
                  String msg = ex.getMessage();
                  log("UpdateStatusProcessController SQL" + msg);
            } catch (NamingException ex) {
                  String msg = ex.getMessage();
                  log("UpdateStatusProcessController NAMING" + msg);
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
            } finally {
                  request.getRequestDispatcher(url).forward(request, response);
            }
      }

<<<<<<< HEAD
      private static String getNextProcessID(String processID) {
            String prefix = processID.substring(0, 2); // Lấy phần tiền tố "PR"
            int number = Integer.parseInt(processID.substring(2)); // Lấy phần số xxx
            int nextNumber = number + 1; // Tăng giá trị số xxx lên 1
            String nextNumberString = String.format("%03d", nextNumber); // Định dạng lại số xxx thành chuỗi có 3 chữ số
            return prefix + nextNumberString; // Tạo chuỗi processID mới bằng cách kết hợp phần tiền tố và phần số
      }

=======
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
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
