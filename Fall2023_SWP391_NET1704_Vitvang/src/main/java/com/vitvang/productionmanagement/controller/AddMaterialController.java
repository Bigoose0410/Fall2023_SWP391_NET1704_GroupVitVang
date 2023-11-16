/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.dao.material.MaterialDAO;
import com.vitvang.productionmanagement.model.MaterialDTO;
import com.vitvang.productionmanagement.model.UserDTO;
import com.vitvang.productionmanagement.util.Constant;
import static com.vitvang.productionmanagement.util.tool.checkRole;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class AddMaterialController extends HttpServlet {

      private static final String ERROR_PAGE = "ErrorPage.html";
      private final String MATERIAL_PAGE = "MainController?&btAction=View All Material";

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            String url = ERROR_PAGE;
            String NameMaterial = request.getParameter("txtMaterialName");
            String Origin = request.getParameter("txtOrigin");
            String Price = request.getParameter("txtPrice");
            String Quantity = request.getParameter("txtQuantity");
            String Unit = request.getParameter("txtUnit");

            try {
                  HttpSession session = request.getSession(); // phai luon co san session
                  UserDTO currUser = (UserDTO) session.getAttribute("USER");
                  if (currUser == null) {
                        return;
                  }
                  int roleID = currUser.getRoleID();
                  //0. check role 
                  if (!checkRole(roleID, Constant.isManager) && !checkRole(roleID, Constant.isStaff)) {
                        return;
                  }
                  int numadd, numdPrice;
                  numadd = (Quantity != null) ? Integer.parseInt(Quantity) : 1;
                  numdPrice = (Price != null) ? Integer.parseInt(Price) : 1;
                  // 1. new DAO
                  MaterialDAO materialDao = new MaterialDAO();
                  // 2. call method
                  MaterialDTO material = new MaterialDTO(NameMaterial, numdPrice, numadd, Origin, Unit);
                  boolean result = materialDao.AddMaterial(material);
                  if (result) {
                        url = MATERIAL_PAGE;
                  }
            } catch (Exception e) {
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
