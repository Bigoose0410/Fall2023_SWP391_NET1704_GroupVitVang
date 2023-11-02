/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.dao.material.MaterialDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UpdateMaterialofCageController", urlPatterns = {"/UpdateMaterialofCageController"})
public class UpdateMaterialofCageController extends HttpServlet {

      private final String EDIT_MATERIAL_PAGE = "EditMaterial.jsp";

      /**
       * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
       *
       * @param request servlet request
       * @param response servlet response
       * @throws ServletException if a servlet-specific error occurs
       * @throws IOException if an I/O error occurs
       */
      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            String materialID = request.getParameter("txtMaterialID").trim();
            String CageID = request.getParameter("txtCageID").trim();
            String quantity = request.getParameter("txtQuantity").trim();
            String url = EDIT_MATERIAL_PAGE;
            try {
                  int qunaitybuild;
                  qunaitybuild = (quantity != null && !quantity.equals("0")) ? Integer.parseInt(quantity) : 1;
                  
                  MaterialDAO dao = new MaterialDAO();
                  dao.updateMaterialOfCage(CageID, materialID, qunaitybuild);
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
