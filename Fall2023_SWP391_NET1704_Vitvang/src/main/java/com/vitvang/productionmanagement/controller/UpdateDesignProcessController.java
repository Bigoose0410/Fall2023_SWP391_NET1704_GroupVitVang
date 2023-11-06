<<<<<<< HEAD
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vitvang.productionmanagement.controller;

=======
package com.vitvang.productionmanagement.controller;
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
import com.vitvang.productionmanagement.dao.designforprocess.DesignForProcessDAO;
import com.vitvang.productionmanagement.exception.processs.DesignProcessErr;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import javax.naming.NamingException;

<<<<<<< HEAD
/**
 *
 * @author Admin
 */
=======
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
@WebServlet(name = "UpdateDesignProcessController", urlPatterns = {"/UpdateDesignProcessController"})
public class UpdateDesignProcessController extends HttpServlet {

      private final String EDITDESIGN_PAGE = "EditDeisgn.jsp";

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
<<<<<<< HEAD
             response.setContentType("text/html;charset=UTF-8");
=======
            response.setContentType("text/html;charset=UTF-8");
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
            String Phrase = request.getParameter("txtPhrase");
            String CageID = request.getParameter("txtCageID");
            String TimeProcess = request.getParameter("txtTimeProcess");
            String Description = request.getParameter("txtDescription");
            String NumberOfEmployee = request.getParameter("txtNumberOfEmployee");
            DesignProcessErr error = new DesignProcessErr();
            boolean foundErr = false;
            String url = EDITDESIGN_PAGE;
            try {
<<<<<<< HEAD
                  if(Description.length()< 5 || Description.length() > 251){
                        error.setDescriptionLengthErr("Your description from 6-251 chars please");
                        foundErr = true;
                  }
                  if(foundErr){
                        request.setAttribute("UPDATE_DESIGN_ERR", error);
                  } else {
                  int timeprocess;
                  timeprocess = (TimeProcess != null) ? Integer.parseInt(TimeProcess) : 1;
                  int numemployee;
                  numemployee = (NumberOfEmployee != null) ? Integer.parseInt(NumberOfEmployee) : 1;
                  
                  DesignForProcessDAO designdao = new DesignForProcessDAO();
                  designdao.updateDesign(Phrase, CageID, timeprocess, Description, numemployee);
                  }
                  url = "MainController"
                          + "?btAction=EditDesign"
                          + "&txtCageID="+CageID;
=======
                  if (Description.length() < 5 || Description.length() > 251) {
                        error.setDescriptionLengthErr("Your description from 6-251 chars please");
                        foundErr = true;
                  }
                  int timeprocess;
                  timeprocess = (TimeProcess != null ) ? Integer.parseInt(TimeProcess) : 1;
                  if (timeprocess < 1 || timeprocess > 10) {
                        error.setTimeProcessErr("time process can not be '"+ TimeProcess +"', check again please");
                        foundErr = true;
                  }
                  int numemployee;
                  numemployee = (NumberOfEmployee != null ) ? Integer.parseInt(NumberOfEmployee) : 1;
                  if (numemployee < 1 || numemployee > 10) {
                        error.setEmployeeFormatErr("Number of employee can not '"+NumberOfEmployee+"' check again please");
                        foundErr = true;
                  }
                  if (foundErr) {
                        request.setAttribute("UPDATE_DESIGN_ERR_IN_PHRASE", Phrase);
                        request.setAttribute("UPDATE_DESIGN_ERR", error);
                  } else {
                        DesignForProcessDAO designdao = new DesignForProcessDAO();
                        designdao.updateDesign(Phrase, CageID, timeprocess, Description, numemployee);
                  }
                  url = "MainController"
                          + "?btAction=EditDesign"
                          + "&txtCageID=" + CageID;
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
            } catch (SQLException ex) {
                  log("AddDesignProcess _ SQL " + ex.getMessage());
            } catch (NamingException ex) {
                  log("AddDesignProcess _ Naming " + ex.getMessage());
            } finally {
                  RequestDispatcher rd = request.getRequestDispatcher(url);
                  rd.forward(request, response);
            }
<<<<<<< HEAD
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
=======
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
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
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
<<<<<<< HEAD
protected void doPost(HttpServletRequest request, HttpServletResponse response)
=======
      protected void doPost(HttpServletRequest request, HttpServletResponse response)
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
              throws ServletException, IOException {
            processRequest(request, response);
      }

      /**
       * Returns a short description of the servlet.
       *
       * @return a String containing servlet description
       */
      @Override
<<<<<<< HEAD
public String getServletInfo() {
=======
      public String getServletInfo() {
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
            return "Short description";
      }// </editor-fold>

}
