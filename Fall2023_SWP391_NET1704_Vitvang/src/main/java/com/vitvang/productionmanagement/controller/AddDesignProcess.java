package com.vitvang.productionmanagement.controller;


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

//      private final String EDITDESIGN_PAGE = "EditDeisgn.jsp";
      private final String STEP_PATTERN = "P\\d{3}";
      private static final String ERROR_PAGE = "ErrorPage.html";
      
      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            String Phrase = request.getParameter("txtPhrase");
            String CageID = request.getParameter("txtCageID");
            String TimeProcess = request.getParameter("txtTimeProcess");
            String Description = request.getParameter("txtDescription");
            String CompletionCage = request.getParameter("txtCompletionCage");
            DesignProcessErr error = new DesignProcessErr();
            boolean foundErr = false;
            String url = ERROR_PAGE;
            try {
                   if(Description.length()< 5 || Description.length() > 251){
                        error.setDescriptionLengthErr("Your description from 6-251 chars please");
                        foundErr = true;
                  }
                  if(foundErr){
                        request.setAttribute("UPDATE_DESIGN_ERR", error);
                  } else {
                        
                  int timeprocess;
                  timeprocess = (TimeProcess != null) ? Integer.parseInt(TimeProcess) : 1;
                  int numcompletetion;
                  numcompletetion = (CompletionCage != null) ? Integer.parseInt(CompletionCage) : 1;

                  DesignForProcessDAO designdao = new DesignForProcessDAO();
                  DesignForProcessDTO design = new DesignForProcessDTO(Phrase, CageID, timeprocess, Description, 1, numcompletetion);
                  designdao.AddDesignPrcess(design);
                  }
                  url = "MainController"
                          + "?btAction=EditDesign"
                          + "&txtCageID="+CageID;
            } catch (SQLException ex) {
                  log("AddDesignProcess _ SQL " + ex.getMessage());
                  error.setDuplicateIDErr("Not accept Null quantity!!!");
                  request.setAttribute("UPDATE_DESIGN_ERR", error);
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
