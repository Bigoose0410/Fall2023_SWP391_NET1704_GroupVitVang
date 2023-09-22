/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UpdateServlet", urlPatterns = {"/UpdateServlet"})
public class UpdateServlet extends HttpServlet {

        private final String ERROR_PAGE = "errorPageLogin.html";

        /**
         * Processes requests for both HTTP <code>GET</code>
         * and <code>POST</code> methods.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific
         * error occurs
         * @throws IOException if an I/O error occurs
         */
        // update form fields
        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
                response.setContentType("text/html;charset=UTF-8");
                String OrderID = request.getParameter("txtOrderID");
                String StartDate = request.getParameter("txtStartDate");
                String EndDate = request.getParameter("txtEndDate");
                String Quantity = request.getParameter("txtQuantity");
                String Price = request.getParameter("txtPrice");
                String Delivery = request.getParameter("txtDelivery");
                String Address = request.getParameter("txtAddress");
                String StaffID = request.getParameter("txtStaffID");
                String CustomerID = request.getParameter("txtCustomerID");
                // this param use for reload search page after update sucess
                String searchValue = request.getParameter("lastSearchValue");
                String url = "";
//                try {
//                        // get user session
//                        HttpSession session = request.getSession();
//                        boolean foundErr = false;
//
//                        if (foundErr) {// found error
//                                // set errors obj to attribute of request scope
////                                request.setAttribute("UPDATE_ERRORS", errors);
//                        } else {// not found any error
//                                //1. cal model
//                                //1.1 new DAO
//                                OrderDAO dao = new OrderDAO();
//                                //1.2 call DAO's methods
//                                int productQuantity = Integer.parseInt(Quantity);
//                                int productPrice = Integer.parseInt(Price);
////                                boolean result = dao.updateOrder(OrderID, StartDate, EndDate, productQuantity, productPrice, Delivery, Address, , StaffID)
//                                //2.processAddress, Address);
//                                if (result) {
//                                        //2.1 call the search function again using URL Rewriting
//
//                                        url = "MainController"
//                                                + "?btAction=Search"
//                                                + "&txtSearchValue=" + searchValue;
//                                        // noti to user that update sucess
//                                        request.setAttribute("msg", "Update account '" + username + "' Sucess!");
//
//                                        //2.1 go to error page
//                                }// end of process
//                        }
//                } catch (SQLException ex) {
//                        log("UpdateAccountServlet _ SQL " + ex.getMessage());
//                        ;
//                } catch (NamingException ex) {
//                        log("UpdateAccountServlet _ Naming " + ex.getMessage());
//
//                }
//        }
//
//        
//                finally {
////            response.sendRedirect(url);
//                        RequestDispatcher rd = request.getRequestDispatcher(url);
//                rd.forward(request, response);
//        }
}

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
/**
 * Handles the HTTP <code>GET</code> method.
 *
 * @param request servlet request
 * @param response servlet response
 * @throws ServletException if a servlet-specific error
 * occurs
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
