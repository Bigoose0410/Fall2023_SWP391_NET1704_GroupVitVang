/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.dao.account.AccountDAO;
import com.vitvang.productionmanagement.dao.users.UserDAO;
import com.vitvang.productionmanagement.exception.users.UserCreateError;
import com.vitvang.productionmanagement.model.AccountDTO;
import com.vitvang.productionmanagement.model.UserDTO;
import com.vitvang.productionmanagement.util.tool;
import static com.vitvang.productionmanagement.util.tool.checkFormat;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CreateAccountController", urlPatterns = {"/CreateAccountController"})
public class CreateAccountController extends HttpServlet {
      private static final String ERROR_PAGE = "ErrorPage.html";
      private final String AdminCreateAccount = "AdminCreateAccount.jsp";
      private final String CUSTOMERID_PATTERN = "CS\\d{3}";
      private final String PHONENUMBER_PATTERN = "((^(\\+84|84|0|0084){1})(3|5|7|8|9))+([0-9]{8})$";
      private final String GMAIL_PATTERN = "^[a-z0-9](\\.?[a-z0-9]){5,}@g(oogle)?mail\\.com$";
//   > 8 chars, one upper letters, 
      private final String PASSWORD_PATTERN = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$";

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException, Exception {
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                  /* TODO output your page here. You may use following sample code. */
                  String UserID = request.getParameter("txtUserID");
                  String txtRoleID = request.getParameter("txtRoleID");
                  String Name = request.getParameter("txtName");
                  String PhoneNumber = request.getParameter("txtPhoneNumber");
                  String Sex = request.getParameter("txtSex");
                  String Adress = request.getParameter("txtAdress");
                  String txtBirthDate = request.getParameter("txtBirthDate");
                  String Email = request.getParameter("txtEmail");
                  String Username = request.getParameter("txtUsername");
                  String Password = request.getParameter("txtPassword");
                  String ConfirmPassword = request.getParameter("txtConfirmPassword");

                  Date BirthDate = Date.valueOf(txtBirthDate);
                  int RoleID = Integer.parseInt(txtRoleID);
                  String url = ERROR_PAGE;
                  boolean foundErr = false;
                  UserCreateError error = new UserCreateError();
                  try {
                        if (Name.trim().length() < 6 || Name.trim().length() > 30) {
                              error.setNameLengthErr("Please enter again full name within (6 -> 30 chars)");
                              foundErr = true;
                        }
                        if (Username.trim().length() < 6 || Username.trim().length() > 30) {
                              error.setUsernameLengthErr("Please enter Username within (6 -> 30 chars)");
                              foundErr = true;
                        }
                        if (!checkFormat(UserID, CUSTOMERID_PATTERN, true)) {
                              error.setCustomerIDFormatErr("Please type again, CustomerID with correct format CSxxx");
                              foundErr = true;
                        }
                        if (!checkFormat(Password, PASSWORD_PATTERN, true)) {
                              foundErr = true;
                              error.setPasswordLengthErr("Password is required typed ( more 8 chars, at least one upper letter)");
                        } else if (!ConfirmPassword.trim().equals(Password.trim())) {
                              error.setConfirmNotMatch("Confirm not match password!!");
                              foundErr = true;
                        }
                        if (Adress.trim().length() < 5) {
                              error.setAddressLenghtErr("Addres too short,please enter detail address");
                              foundErr = true;
                        }
                        if (tool.getVaildYob(BirthDate) < 18) {
                              error.setBirthDateVaildErr("Please type the BirthDate form > 18+ ");
                              foundErr = true;
                        }
                        if (!checkFormat(Email, GMAIL_PATTERN, true)) {
                              error.setGmailTypeErr("Please type follow to the format Gmail");
                              foundErr = true;
                        }
                        if (!checkFormat(PhoneNumber, PHONENUMBER_PATTERN, true)) {
                              error.setPhoneNumberTypeErr("Please type again PhoneNumber");
                              foundErr = true;
                        }
                        if (foundErr) {
                              request.setAttribute("CREATE_ACCOUNT_ERR", error);
                              request.setAttribute("MESSAGE_CREATE_FAIL", "Create new account failed!!!");
                              url = AdminCreateAccount;
                        } else {
                              UserDAO userdao = new UserDAO();
                              // 1. new DAO
                              AccountDAO accountdao = new AccountDAO();
                              // 2. call method
                              Password = userdao.EncodePass(Password);
                              AccountDTO account = new AccountDTO(UserID, Name, PhoneNumber, Sex, Adress, BirthDate, Email, Username, Password, RoleID, Username);
                              boolean result = accountdao.createNewAccount(account);
                              if (result) {
//                                    HttpSession session = request.getSession();
//                                    session.removeAttribute("SHOW_CUS_CREATE_FORM");
//                              
                                    url = "MainController?btAction=Manage Account";
                              }
                        }
                  } catch (SQLException ex) {
                        String msg = ex.getMessage();
                        log("CreateUserControlerr_ SQL" + msg);

                        if (msg.contains("duplicate")) {
                              error.setCustomerIDexistErr(UserID + " is existed!!!");
                              request.setAttribute("CREATE_CUS_ERROR", error);
                        }
                  } catch (NamingException ex) {
                        log("CreateUserController _ NAMING " + ex.getMessage());
                  } finally {
                        RequestDispatcher rd = request.getRequestDispatcher(url);
                        rd.forward(request, response);
                  }
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
                  Logger.getLogger(CreateAccountController.class.getName()).log(Level.SEVERE, null, ex);
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
                  Logger.getLogger(CreateAccountController.class.getName()).log(Level.SEVERE, null, ex);
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
