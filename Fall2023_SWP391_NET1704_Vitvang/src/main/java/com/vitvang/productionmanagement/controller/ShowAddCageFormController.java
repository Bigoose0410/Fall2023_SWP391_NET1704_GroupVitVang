<<<<<<< HEAD
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vitvang.productionmanagement.controller;

=======
package com.vitvang.productionmanagement.controller;
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

<<<<<<< HEAD
/**
 *
 * @author Admin
 */
@WebServlet(name = "ShowAddCageFormController", urlPatterns = {"/ShowAddCageFormController"})
public class ShowAddCageFormController extends HttpServlet {

      /**
       * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
       *
       * @param request servlet request
       * @param response servlet response
       * @throws ServletException if a servlet-specific error occurs
       * @throws IOException if an I/O error occurs
       */
=======

@WebServlet(name = "ShowAddCageFormController", urlPatterns = {"/ShowAddCageFormController"})
public class ShowAddCageFormController extends HttpServlet {

>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            String status = request.getParameter("txtFormStatus");
            String url = "MainController?btAction=SearchCage";
            try {
                  if(status.equals("open") || status.equals("error")){
                  request.setAttribute("SHOW_FORM_ADD", "ShowForm");
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
