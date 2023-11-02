/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.dao.cage.CageDAO;
import com.vitvang.productionmanagement.dao.designforprocess.DesignForProcessDAO;
import com.vitvang.productionmanagement.model.CageDTO;
import com.vitvang.productionmanagement.model.CageMaterialDTO;
import com.vitvang.productionmanagement.model.DesignForProcessDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
@WebServlet(name = "DetailProduct", urlPatterns = {"/DetailProductController"})
public class DetailProductController extends HttpServlet {

      private final String CAGE_DETAIL_PAGE = "ProductDetail.jsp";

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
            String cageID = request.getParameter("txtCageID");
            String url = "errorPageLogin.html";
            try {
                  //1. new DAO
                  CageDAO cagedao = new CageDAO();
                  DesignForProcessDAO designdao = new DesignForProcessDAO();
                  
                  //2. Call method
                  CageDTO cage = cagedao.GetCageByID(cageID);
                  // get material list
                  cagedao.ViewCageMaterial2(cageID);
                  // get design
                  designdao.ViewDesignForProcess(cageID);
                  
                  //3. process result     
                  List<CageMaterialDTO> result1 = cagedao.getListCageMaterial();
                  int materialPirce = cagedao.TotalPriceMaterial();
                  List<DesignForProcessDTO> result3 = designdao.getDesignProcessList();
                  int processPrice = designdao.TotalPriceProcess();
                  request.setAttribute("CAGE_MATERIAL", result1);
                  request.setAttribute("CAGE_DTO", cage);
                  request.setAttribute("DESIGN_PROCESS", result3);
                  request.setAttribute("MATERIAL_PRICE", materialPirce);
                  request.setAttribute("PROCESS_PRICE", processPrice);
                  url = CAGE_DETAIL_PAGE;

            } catch (SQLException ex) {
                  String msg = ex.getMessage();
                  log("CalculateDetailMaterial SQL" + msg);
            } catch (NamingException ex) {
                  log("CalculateDetailMaterial _ NAMING " + ex.getMessage());
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
