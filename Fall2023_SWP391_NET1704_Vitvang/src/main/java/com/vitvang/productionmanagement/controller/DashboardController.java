/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.dao.dashboard.DashboardDAO;
import com.vitvang.productionmanagement.model.CageDTO;
import com.vitvang.productionmanagement.model.OrderDTO;
<<<<<<< HEAD
import java.io.IOException;
import java.io.PrintWriter;
=======
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
>>>>>>> 6c7328056a33b9fcd7a9d8679e94c4b00580764c
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
<<<<<<< HEAD
import java.sql.SQLException;
import java.util.List;
=======
>>>>>>> 6c7328056a33b9fcd7a9d8679e94c4b00580764c

/**
 *
 * @author Admin
 */
@WebServlet(name = "DashboardController", urlPatterns = {"/DashboardController"})
public class DashboardController extends HttpServlet {

<<<<<<< HEAD
=======
      /**
       * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
       *
       * @param request servlet request
       * @param response servlet response
       * @throws ServletException if a servlet-specific error occurs
       * @throws IOException if an I/O error occurs
       */
>>>>>>> 6c7328056a33b9fcd7a9d8679e94c4b00580764c
      private final String Dashboard = "Dashboard.jsp";

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            String url = "NewLogin.jsp";
            try {
                  int quantity_newOrder = 0;
                  int quantity_processingOrder = 0;
                  int quantity_doneOrder = 0;
                  int quantity_cage = 0;

                  DashboardDAO dao = new DashboardDAO();
                  dao.showListOrder();
                  List<OrderDTO> listOrder = dao.getListOrder();
                  for (OrderDTO order : listOrder) {
                        if (order.getStatusProgress().equals("new order")) {
                              quantity_newOrder++;
                        } else if (order.getStatusProgress().equals("Processing")) {
                              quantity_processingOrder++;
                        } else if (order.getStatusProgress().equals("Done")) {
                              quantity_doneOrder++;
                        }
                        request.setAttribute("NEWORDER_QUANTITY", quantity_newOrder);
                        request.setAttribute("PROCESSINGORDER_QUANTITY", quantity_processingOrder);
                        request.setAttribute("DONEORDER_QUANTITY", quantity_doneOrder);
                  }

                  dao.showListCage();
                  List<CageDTO> listCage = dao.getListCage();
                  for (CageDTO cage : listCage) {
                        quantity_cage++;
                  }
                  request.setAttribute("CAGE_QUANTITY", quantity_cage);

                  dao.countCage();
                  List<CageDTO> countCage = dao.getListCountCage();
                  request.setAttribute("COUNT_CAGE", countCage);

                  url = Dashboard;
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
            processRequest(request, response);
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
            processRequest(request, response);
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
