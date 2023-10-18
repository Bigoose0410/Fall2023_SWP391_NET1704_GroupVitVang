/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vitvang.productionmanagement.controller;

import my.vitvang.productionmanagement.model.OrderDTO;
import my.vitvang.productionmanagement.dao.order.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "SearchOrderController", urlPatterns = {"/SearchOrderController"})
public class SearchOrderController extends HttpServlet {

        private final String OrderSearch = "order.jsp";

        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
                response.setContentType("text/html;charset=UTF-8");
                String searchValue = request.getParameter("txtSearchValue");
                String url = "login.jsp";
                try {
                        // kiem tra search value truyen ve co phai rong khong
                        if (!searchValue.isEmpty()) {
                                //1. call DAO
                                OrderDAO dao = new OrderDAO();
                                //1.2. call method
                                dao.searchOrder(searchValue);
                                // process result
                                List<OrderDTO> result = dao.getListOrders();

                                request.setAttribute("SEARCH_RESULT", result);
                                url = OrderSearch;
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
         * @throws ServletException if a servlet-specific
         * error occurs
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
         * @throws ServletException if a servlet-specific
         * error occurs
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
