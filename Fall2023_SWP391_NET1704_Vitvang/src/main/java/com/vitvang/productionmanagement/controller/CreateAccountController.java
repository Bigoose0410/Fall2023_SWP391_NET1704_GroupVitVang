/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.dao.account.AccountDAO;
import com.vitvang.productionmanagement.dao.users.UserDAO;
import com.vitvang.productionmanagement.exception.account.CreateAccountError;
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

      private final String AdminCreateAccount = "AdminCreateAccount.jsp";
      private final String CUSTOMERID_PATTERN = "CS\\d{3}";
      private final String PHONENUMBER_PATTERN = "((^(\\+84|84|0|0084){1})(3|5|7|8|9))+([0-9]{8})$";
      private final String EMAIL_PATTERN = "^[a-z0-9](\\.?[a-z0-9]){5,}@g(oogle)?mail\\.com$";
      private final String PASSWORD_PATTERN = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$";//check 1 ky tu hoa, 1 ky tu thuong, 1 so, it nhat 8 ky tu
      private final String SPACE_PATTERN = "^[^\\s]+$"; //check neu khong co khoang trong
      private final String NAME_PATTERN = "^[^0-9]$"; //khong chua so

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException, Exception {
            response.setContentType("text/html;charset=UTF-8");
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
//                  String txtUserStatus = request.getParameter("txtUserStatus");

            Date BirthDate = Date.valueOf(txtBirthDate);
            int RoleID = Integer.parseInt(txtRoleID);
//                  Boolean UserStatus = Boolean.parseBoolean("txtUserStatus");

            String url = AdminCreateAccount;
            boolean foundErr = false;
            CreateAccountError error = new CreateAccountError();
            try {
                  if (!checkFormat(Username.trim(), SPACE_PATTERN, true)) {
                        error.setUsernameFormatErr("Username cannot inclue space");
                        foundErr = true;
                  } else if (Username.trim().length() < 6 || Username.trim().length() > 30) {
                        error.setUsernameFormatErr("Username (6 - 30 chars)");
                        foundErr = true;
                  }

                  if (!checkFormat(Password, PASSWORD_PATTERN, true)) {
                        error.setPasswordFormatErr("Password (at least 1 upper letter, 1 lower letter, 1 number)");
                        foundErr = true;
                  }

                  if (!ConfirmPassword.trim().equals(Password.trim())) {
                        error.setConfirmPasswordNotMatchErr("Confirm password not match");
                        foundErr = true;
                  }

                  if (RoleID < 1 || RoleID > 4) {
                        error.setRoleIDFormatErr("Role ID (1 - 4)");
                        foundErr = true;
                  }

                  if (Name.trim().length() < 6 || Name.trim().length() > 30) {
                        error.setNameFormatErr("Name (6 - 30 chars)");
                        foundErr = true;
                  } else if (!checkFormat(Name, NAME_PATTERN, true)) {
                        error.setNameFormatErr("Name cannot include number");
                  }

                  if (!checkFormat(Email, EMAIL_PATTERN, true)) {
                        error.setEmailFormatErr("Wrong format email (***@gmail.com");
                        foundErr = true;
                  }

                  if (!checkFormat(PhoneNumber, PHONENUMBER_PATTERN, true)) {
                        error.setPhoneNumberFormatErr("Wrong format phone number (+84xxxxxxxxx)");
                        foundErr = true;
                  }

                  if (Adress.trim().length() < 6) {
                        error.setAddressFormatErr("Addrress too short (>6)");
                        foundErr = true;
                  }

                  if (tool.getVaildYob(BirthDate) < 18) {
                        error.setBirthDateValidErr("Your age under 18 ");
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
                        AccountDTO account = new AccountDTO(UserID, Name, PhoneNumber, Sex, Adress, BirthDate, Email, Username, Password, RoleID, Username, true);
                        boolean result = accountdao.createNewAccount(account);
                        if (result) {
//                                    HttpSession session = request.getSession();
//                                    session.removeAttribute("SHOW_CUS_CREATE_FORM");
//                              
                              url = "MainController?btAction=Manage Account";
                        }
                  }
            } catch (SQLException ex) {
//                  String msg = ex.getMessage();
//                  log("CreateUserControlerr_ SQL" + msg);

                  error.setUserIDExistErr(UserID + " is existed!!!");
                  request.setAttribute("MESSAGE_CREATE_FAIL", "Create new account failed!!!");
            } catch (NamingException ex) {
                  log("CreateUserController _ NAMING " + ex.getMessage());
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
