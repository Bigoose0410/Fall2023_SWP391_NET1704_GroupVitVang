/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.OrderInsertError;
import Order.OrderDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;

/**
 *
 * @author Admin
 */
public class AddOrderController extends HttpServlet {

        private final String HistoryOrderPAGE = "historyOrder.jsp";

        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException, ParseException, SQLException {
                response.setContentType("text/html;charset=UTF-8");
                try (PrintWriter out = response.getWriter()) {
                        String url = "orderHome.html";
                        // test
                        String orderId = request.getParameter("txtOrderID");
                        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                        String startDate = request.getParameter("txtStartDate");
                        Date sDate = (Date) formatter.parse(startDate);
                        String endDate = request.getParameter("txtEndDate");
                        Date eDate = (Date) formatter.parse(endDate);
                        String customerId = request.getParameter("txtCustomerID");
                        OrderInsertError errors = new OrderInsertError();
                        Pattern pattern = Pattern.compile("^[O]\\d{2}$");
                        Pattern pattern1 = Pattern.compile("^[C]\\d{2}$");
                        Date now = new Date(2023, 9, 29);
                        boolean berrors = false;
                        OrderDAO dao = new OrderDAO();
                        if (pattern.matcher(orderId).find()) {
                                errors.setOrderIdErr("Pls type again OrderID with two digit");
                                berrors = true;
                        }
                        if (sDate.before(now)) {
                                errors.setStartDateErr("pls type again valid Date");
                                berrors = true;
                        }
                        if (eDate.after(now)) {
                                errors.setStartDateErr("pls type again valid Date");
                                berrors = true;
                        }
                        if (pattern.matcher(customerId).find()) {
                                errors.setOrderIdErr("Pls type again CustomerID with two digit");
                                berrors = true;
                        }

                        if (berrors) {
                                request.setAttribute("INSERTERROR", errors);
                        } else {
                                boolean result = dao.insertOrder(orderId, sDate, eDate, customerId, startDate, orderId);
                                if (result) {
                                        url = HistoryOrderPAGE;
                                }
                        }
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
                try {
                        processRequest(request, response);
                } catch (ParseException ex) {
                        Logger.getLogger(AddOrderController.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SQLException ex) {
                        Logger.getLogger(AddOrderController.class.getName()).log(Level.SEVERE, null, ex);
                }
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
                try {
                        processRequest(request, response);
                } catch (ParseException ex) {
                        Logger.getLogger(AddOrderController.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SQLException ex) {
                        Logger.getLogger(AddOrderController.class.getName()).log(Level.SEVERE, null, ex);
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
