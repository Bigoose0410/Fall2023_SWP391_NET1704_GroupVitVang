package com.vitvang.productionmanagement.controller;
import com.vitvang.productionmanagement.dao.users.UserDAO;
import com.vitvang.productionmanagement.model.UserDTO;
import com.vitvang.productionmanagement.util.Constant;
import static com.vitvang.productionmanagement.util.tool.checkRole;
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
@WebServlet(name = "SearchCustomerController", urlPatterns = {"/SearchCustomerController"})
public class SearchCustomerController extends HttpServlet {

      private final String SEARCH_CUSTOMER_PAGE = "SearchCustomer.jsp";
      private static final String ERROR_PAGE = "ErrorPage.html";
      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            String searchName = request.getParameter("txtSearchvalue");
            String RoleID = request.getParameter("txtRoleSearch");
            int role = Integer.parseInt(RoleID);
            String url = ERROR_PAGE;
            try {
                  HttpSession session = request.getSession();// phai luon co san session
                  UserDTO currUser = (UserDTO) session.getAttribute("USER");
                  if (currUser == null) {
                        return;
                  }
                  int roleID = currUser.getRoleID();
                  //0. check role 
                  if (!checkRole(roleID, Constant.isManager) && !checkRole(roleID, Constant.isStaff)) {
                        return;
                  }
                  // 1. new dao
                  UserDAO dao = new UserDAO();
                  // 2. call method
                  dao.searchUserByNameAndRole(searchName, role);
                  //3. process result
                  List<UserDTO> result = dao.getListUser();

                  request.setAttribute("SEARCH_CUS_RESULT", result);
                  url = SEARCH_CUSTOMER_PAGE;
                  session.removeAttribute("SHOW_CUS_CREATE_FORM");

            } catch (SQLException ex) {
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
