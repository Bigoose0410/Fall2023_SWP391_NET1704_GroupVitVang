/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author Admin
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {
        private final String LoginController = "LoginServlet";
        private final String StartUpController = "StartUpController";
        private final String LogOutController = "LogOutServlet";
        private final String SearchOrderController = "SearchOrderController";
        private final String UpdateOrderController = "UpdateServlet";
        private final String DeleteOrderController = "DeleteOrderServlet";

        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
                response.setContentType("text/html;charset=UTF-8");

                String button = request.getParameter("btAction");
                String url = "errorPageLogin.html";
                try {
                        if (button == null) {
                                url = StartUpController;
                        } else if (button.equals("Login")) {
                                url = LoginController;
                        } else if (button.equals("LogOut")) {
                                url = LogOutController;
                        } else if (button.equals("Search")) {
                                url = SearchOrderController;
                        } if (button.equals("Update")) {
                                url = UpdateOrderController;
                        } if (button.equals("Delete")) {
                                url = DeleteOrderController;
                        }
                } finally {
                        RequestDispatcher rd = request.getRequestDispatcher(url);
                        rd.forward(request, response);
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

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
}