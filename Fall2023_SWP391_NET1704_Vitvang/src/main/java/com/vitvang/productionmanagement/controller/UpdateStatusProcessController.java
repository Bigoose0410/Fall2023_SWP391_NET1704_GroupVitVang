/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.dao.process.ProcessDAO;
import com.vitvang.productionmanagement.model.ProcessDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import static java.lang.System.out;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
            String Status = request.getParameter("txtStatus");
            String ProcessID = request.getParameter("txtProcessID");
            String OrderID = request.getParameter("txtOrderID");
            String CageID = request.getParameter("txtCageID");
//            String NumberOfEmployee = request.getParameter("txtNumberOfEmployee");
            String url = "NewLogin.jsp";
            try {
                  boolean result = false;
                  int count = 0;
                  ProcessDAO dao = new ProcessDAO();
//                  if (ProcessID.equals("PR001") && Status.equals("Done")) {
//                        result = dao.updateStatusProcess1(Status, ProcessID, OrderID, CageID);
//                  } else if (ProcessID.equals("PR002") && Status.equals("Done")) {
//                        result = dao.updateStatusProcess2(Status, ProcessID, OrderID, CageID);
//                  } else if (ProcessID.equals("PR003") && Status.equals("Done")) {
//                        result = dao.updateStatusProcess3(Status, ProcessID, OrderID, CageID);
//                  } else if (ProcessID.equals("PR004") && Status.equals("Done")) {
//                        result = dao.updateStatusProcess4(Status, ProcessID, OrderID, CageID);
//                  } else if (ProcessID.equals("PR005") && Status.equals("Done")) {
//                        result = dao.updateStatusProcess5(Status, ProcessID, OrderID, CageID);
//                  } else {
//                        result = dao.updateStatusProcess(Status, ProcessID, OrderID, CageID);
//                  }
                  dao.ViewProcessingOrder(OrderID, CageID, CageID);
                  List<ProcessDTO> list = dao.getListOrdersProcess();
                  for (ProcessDTO process : list) {
                        count++;

                        if (process.getProcessID().equals(ProcessID) && !Status.equals("Done")) {
                              result = dao.updateStatusProcess(Status, ProcessID, OrderID, CageID);
                              break;
                        }

                        if (process.getProcessID().equals(ProcessID) && Status.equals("Done") && count != list.size()) {
//                              request.setAttribute("UPDATE_STATUS", ProcessID);
                              String nextProcessID = getNextProcessID(ProcessID);
                              result = dao.updateStatusProcessToDone(Status, ProcessID, nextProcessID, OrderID, CageID);
                              break;
                        }

                        if (process.getProcessID().equals(ProcessID) && Status.equals("Done") && count == list.size()) {
                              result = dao.updateStatusLastProcess(Status, ProcessID, OrderID, CageID);
                              break;
                        }
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

      private static String getNextProcessID(String processID) {
            String prefix = processID.substring(0, 2); // Lấy phần tiền tố "PR"
            int number = Integer.parseInt(processID.substring(2)); // Lấy phần số xxx
            int nextNumber = number + 1; // Tăng giá trị số xxx lên 1
            String nextNumberString = String.format("%03d", nextNumber); // Định dạng lại số xxx thành chuỗi có 3 chữ số
            return prefix + nextNumberString; // Tạo chuỗi processID mới bằng cách kết hợp phần tiền tố và phần số
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
