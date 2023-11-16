package com.vitvang.productionmanagement.controller;
import com.vitvang.productionmanagement.model.CageDTO;
import com.vitvang.productionmanagement.dao.cage.CageDAO;
import com.vitvang.productionmanagement.model.UserDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
@WebServlet(name = "SearchCageController", urlPatterns = {"/SearchCageController"})
public class SearchCageController extends HttpServlet {
      private static String PRODUCT_PAGE = "Product.jsp";
      private static final String ERROR_PAGE = "ErrorPage.html";
      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            
            String url = ERROR_PAGE;
            String searchCageValue = request.getParameter("txtSearchValue");
            try {
                  HttpSession session = request.getSession();// phai luon co san session
                  UserDTO currUser = (UserDTO) session.getAttribute("USER");
                  if (currUser == null) {
                        return;
                  }                
                  // 1.new dao
                  CageDAO dao = new CageDAO();
                  // 2. call method
                  if(searchCageValue == null ){
                        searchCageValue = "";
                  }
                  dao.searchProductionbyName(searchCageValue);
                  //3. process result
                  List<CageDTO> result = dao.getListCage();
                  request.setAttribute("SEARCH_CAGE_RESULT", result);
                  url = PRODUCT_PAGE;
           }catch (SQLException ex) {
                  log("SearchUserController _ SQL" + ex.getMessage());
            } catch (NamingException ex) {
                  log("SearchUserController _ NAMING" + ex.getMessage());
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
