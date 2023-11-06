/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vitvang.productionmanagement.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import javax.naming.NamingException;
import com.vitvang.productionmanagement.dao.material.MaterialDAO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "DeleteMaterialofCageController", urlPatterns = {"/DeleteMaterialofCageController"})
public class DeleteMaterialofCageController extends HttpServlet {
<<<<<<< HEAD
      private final String EDIT_MATERIAL_PAGE = "EditMaterial.jsp";
    
      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
             String materialID = request.getParameter("txtMaterialID").trim();
            String CageID = request.getParameter("txtCageID").trim();
            String url = EDIT_MATERIAL_PAGE;
            try {
                  
=======

      private final String EDIT_MATERIAL_PAGE = "EditMaterial.jsp";
      private static final String ERROR_PAGE = "ErrorPage.html";

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            String materialID = request.getParameter("txtMaterialID").trim();
            String CageID = request.getParameter("txtCageID").trim();
            String url = ERROR_PAGE;
            try {

>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
                  MaterialDAO dao = new MaterialDAO();
                  dao.deleteMaterialOfCage(materialID, CageID);
                  url = "MainController"
                          + "?btAction=EditMaterial"
                          + "&txtCageID=" + CageID;
            } catch (SQLException ex) {
                  log("AddDesignProcess _ SQL " + ex.getMessage());
            } catch (NamingException ex) {
                  log("AddDesignProcess _ Naming " + ex.getMessage());
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
