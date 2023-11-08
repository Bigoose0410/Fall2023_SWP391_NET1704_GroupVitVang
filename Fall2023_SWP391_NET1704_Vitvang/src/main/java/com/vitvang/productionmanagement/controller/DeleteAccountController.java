/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.dao.account.AccountDAO;
import com.vitvang.productionmanagement.model.AccountDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;


/**
 *
 * @author Admin
 */
@WebServlet(name = "DeleteAccountController", urlPatterns = {"/DeleteAccountController"})
public class DeleteAccountController extends HttpServlet {

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            String url = "NewLogin.jsp";
            try {
                  String Username = request.getParameter("txtUsername");
                  String UserID = request.getParameter("txtUserID");
                  String RoleID = request.getParameter("txtRoleID");
                  boolean check = true;

                  AccountDAO dao = new AccountDAO();
                  dao.checkBeforeDelete(UserID);
                  List<AccountDTO> list = dao.getListCheck();
                  if (list != null) {
                        for (AccountDTO account : list) {
                              if (account.getOrderDetailStatus().equalsIgnoreCase("new order") || account.getOrderDetailStatus().equalsIgnoreCase("Processing")) {
                                    check = false;
                                    break;
                              }
                        }
                  }
                  if (check && !RoleID.equals("1")) {
                        boolean result = dao.deleteAccount(Username);
                        if (result) {
                              url = "MainController?btAction=Manage Account";
                        }
                  } else {
                        request.setAttribute("DELETE_MESSAGE", "Cannot delete account!!!");
                        url = "MainController?btAction=ViewAccountDetail&UserID=" + UserID;
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
