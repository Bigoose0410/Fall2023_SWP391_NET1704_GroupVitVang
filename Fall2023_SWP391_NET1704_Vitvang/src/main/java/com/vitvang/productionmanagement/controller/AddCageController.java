/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.dao.cage.CageDAO;
import com.vitvang.productionmanagement.exception.cage.CageInsertError;
import static com.vitvang.productionmanagement.util.tool.checkFormat;
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
@WebServlet(name = "AddCageController", urlPatterns = {"/AddCageController"})
public class AddCageController extends HttpServlet {

      private static String ADD_CAGE_PAGE = "AddProductionInfo.jsp";
      private static final String CAGEID_PATTERN = "CG\\d{3}";
      private static final String ERROR_PAGE = "ErrorPage.html";

      
      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            String cageID = request.getParameter("txtCageIDadd");
            String CageName = request.getParameter("txtCageNameadd");
            String Origin = request.getParameter("txtOrigin");
            String Description = request.getParameter("txtDescription");
            String Price = request.getParameter("txtPrice");
            int price = 0;
            if (!Price.isEmpty()) {
                  price = Integer.parseInt(Price);
            }
            boolean result = false;
            CageInsertError error = new CageInsertError();
            boolean foundErr = false;
            String url = ERROR_PAGE;
            try {
                  if (checkFormat(CageName, CAGEID_PATTERN, true)) {
                        error.setIDFormatErr("Cage ID must has fromat CGxxx, e.g: CG001");
                        foundErr = true;
                  }
                  if (CageName.length() < 6 || CageName.length() > 50) {
                        error.setNameLengthErr("Name legnth from 6 - 50 chars");
                        foundErr = true;
                  }
                  if (Origin.length() < 1 || Origin.length() > 20) {
                        error.setOriginLengthErr("Origin legnth from 1-20 char");
                        foundErr = true;
                  }
                  if (Description.length() < 6 || Description.length() > 251) {
                        error.setDescriptionengthErr("Description legnth from 1-251 char");
                        foundErr = true;
                  }
                  if (price < 100) {
                        error.setPriceErr("Price to small, type again");
                        foundErr = true;
                  }
                  if (foundErr) {
                        request.setAttribute("CREATE_CAGE_ERROR", error);
                        // truyền về thêm tham số txtFormStatus để tiếp tục mở form
                        url = "MainController?btAction=FormAddCage&txtFormStatus=open";
                  } else {

                        CageDAO cagedao = new CageDAO();
                        //2. Call method
                        result = cagedao.CreateCage(cageID, CageName, price, Origin, Description);

                        //3. process result     
                        if (result) {
                              url = "MainController"
                                      + "?txtCageID="+cageID
                                      + "&btAction=DetailProduct";
                                      
                        }

                  }
            } catch (SQLException ex) {
                  String msg = ex.getMessage();
                  log("AddCageController SQL" + msg);
                  if (msg.contains("duplicate")) {
                        error.setIDExistErr(cageID + " is existed!!!");
                        request.setAttribute("CREATE_CAGE_ERROR", error);
                        url = "MainController?btAction=FormAddCage&txtFormStatus=open";
                  }
            } catch (NamingException ex) {
                  log("AddCageController _ NAMING " + ex.getMessage());
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
