 
package com.vitvang.productionmanagement.controller;
import com.vitvang.productionmanagement.dao.account.AccountDAO;
import com.vitvang.productionmanagement.dao.users.UserDAO;
import com.vitvang.productionmanagement.model.AccountDTO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "UpdateAccountController", urlPatterns = {"/UpdateAccountController"})
public class UpdateAccountController extends HttpServlet {
      private static final String ERROR_PAGE = "ErrorPage.html";
      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException, Exception {
            response.setContentType("text/html;charset=UTF-8");
            String url = ERROR_PAGE;
            String UserID = request.getParameter("txtUserID");
            String Username = request.getParameter("txtUsername");
            String Password = request.getParameter("txtPassword");
            String Email = request.getParameter("txtEmail");
            String Address = request.getParameter("txtAddress");
            String PhoneNumber = request.getParameter("txtPhoneNumber");

            try {
                  UserDAO userdao = new UserDAO();
                  AccountDAO dao = new AccountDAO();
                  dao.ViewAccountDetail(UserID);
                  List<AccountDTO> detail = dao.getListAccount();
                  request.setAttribute("ACCOUNT_DETAIL", detail);
                  Password = userdao.EncodePass(Password);
                  boolean update = dao.UpdateAccount(UserID, Username, Password, Email, Address, PhoneNumber);
                  if (update) {
                        url = "MainController?btAction=ViewAccountDetail&UserID=" + UserID;
                        request.setAttribute("MESSAGE", "Update successfully");
                  } else {
                        url = "MainController?btAction=ViewAccountDetail&UserID=" + UserID;
                        request.setAttribute("MESSAGE", "Update failed");
                  }
            } catch (SQLException e) {
                  e.printStackTrace();
            } finally {
                  request.getRequestDispatcher(url).forward(request, response);
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
            try {
                  processRequest(request, response);
            } catch (Exception ex) {
                  Logger.getLogger(UpdateAccountController.class.getName()).log(Level.SEVERE, null, ex);
            }
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
            try {
                  processRequest(request, response);
            } catch (Exception ex) {
                  Logger.getLogger(UpdateAccountController.class.getName()).log(Level.SEVERE, null, ex);
            }
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
