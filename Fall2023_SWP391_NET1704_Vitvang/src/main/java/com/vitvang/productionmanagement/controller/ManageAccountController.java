/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.dao.account.AccountDAO;
import com.vitvang.productionmanagement.model.AccountDTO;
import com.vitvang.productionmanagement.model.UserDTO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ManageAccountController", urlPatterns = {"/ManageAccountController"})
public class ManageAccountController extends HttpServlet {

      private final String AdminManageAccount = "AdminManageAccount.jsp";
      private static final String ERROR_PAGE = "ErrorPage.html";

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException, SQLException, NamingException {
            response.setContentType("text/html;charset=UTF-8");
            String url = ERROR_PAGE;
            try {
                  HttpSession session = request.getSession();// phai luon co san session
                  UserDTO currUser = (UserDTO) session.getAttribute("USER");
                  if (currUser == null) {
                        return;
                  }
                 
                  AccountDAO dao = new AccountDAO();
                  dao.showListAccount();
                  List<AccountDTO> list = dao.getListAccount();
//                  for (AccountDTO accountDTO : list) {
//                        if (accountDTO.isUserStatus()) {
//                              request.setAttribute("USER_STATUS", "True");
//                        }
//                  }
                  request.setAttribute("ACCOUNT_RESULT", list);
                  url = AdminManageAccount;
            } catch (SQLException e) {
                  log("LOGINSERVLET _ SQL" + e.getMessage());
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
            } catch (SQLException ex) {
                  Logger.getLogger(ManageAccountController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (NamingException ex) {
                  Logger.getLogger(ManageAccountController.class.getName()).log(Level.SEVERE, null, ex);
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
            } catch (SQLException ex) {
                  Logger.getLogger(ManageAccountController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (NamingException ex) {
                  Logger.getLogger(ManageAccountController.class.getName()).log(Level.SEVERE, null, ex);
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
