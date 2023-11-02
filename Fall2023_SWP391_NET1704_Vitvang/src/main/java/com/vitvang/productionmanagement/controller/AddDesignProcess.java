package com.vitvang.productionmanagement.controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import com.vitvang.productionmanagement.dao.designforprocess.DesignForProcessDAO;
import com.vitvang.productionmanagement.exception.processs.DesignProcessErr;
import com.vitvang.productionmanagement.model.DesignForProcessDTO;
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
@WebServlet(urlPatterns = {"/AddDesignProcess"})
public class AddDesignProcess extends HttpServlet {

      private final String STEP_PATTERN = "P\\d{3}";
      private final String ERROR_PAGE = "";

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
            String Phrase = request.getParameter("txtPhrase");
            String CageID = request.getParameter("txtCageID");
            String TimeProcess = request.getParameter("txtTimeProcess");
            String Description = request.getParameter("txtDescription");
            String NumberOfEmployee = request.getParameter("txtNumberOfEmployee");
            DesignProcessErr error = new DesignProcessErr();
            boolean foundErr = false;
            boolean result = false;

            String url = ERROR_PAGE;
            try {
                  if (Description.length() < 5 || Description.length() > 251) {
                        error.setDescriptionLengthErr("     Your description from 6-251 chars please");
                        foundErr = true;
                  }
                  int timeprocess;
                  timeprocess = (TimeProcess != null) ? Integer.parseInt(TimeProcess) : 1;
                  if (timeprocess < 1 || timeprocess > 10) {
                        error.setTimeProcessErr("    Time process can not be " + TimeProcess + " again please");
                        foundErr = true;
                  }

                  int numemployee;
                  numemployee = (NumberOfEmployee != null) ? Integer.parseInt(NumberOfEmployee) : 1;
                  if (numemployee < 1 || numemployee > 10) {
                        error.setEmployeeFormatErr("    Number of employee " + NumberOfEmployee + " again please");
                        foundErr = true;

                  }
                  // if have execption
                  if (foundErr) {
                        request.setAttribute("ADD_DESIGN_ERR", error);
                        url = "MainController"
                                + "?btAction=EditDesign"
                                + "&txtCageID=" + CageID;
                  } else {
                        DesignForProcessDAO designdao = new DesignForProcessDAO();
                        DesignForProcessDTO design = new DesignForProcessDTO(Phrase, CageID, timeprocess, Description, numemployee, 1);
                        result = designdao.AddDesignPrcess(design);
                  }
                  url = "MainController"
                          + "?btAction=EditDesign"
                          + "&txtCageID=" + CageID;
            } catch (SQLException ex) {
                  log("AddDesignProcess _ SQL " + ex.getMessage());
                  String msg = ex.getMessage();
                  if (msg.contains("duplicate")) {
                        error.setDuplicateIDErr("    This phrase ID has exist!!");
                        request.setAttribute("ADD_DESIGN_ERR", error);
                        url = "MainController"
                                + "?btAction=EditDesign"
                                + "&txtCageID=" + CageID;
                  }
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

}
