/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.dao.users.UserDAO;
import com.vitvang.productionmanagement.exception.users.UserCreateError;
import com.vitvang.productionmanagement.model.UserDTO;
import com.vitvang.productionmanagement.util.Constant;
import com.vitvang.productionmanagement.util.SendEmail;
import com.vitvang.productionmanagement.util.tool;
import static com.vitvang.productionmanagement.util.tool.checkFormat;
import static com.vitvang.productionmanagement.util.tool.checkRole;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CreateUserController", urlPatterns = {"/CreateUserController"})
public class CreateUserController extends HttpServlet {

      private static final String ERROR_PAGE = "ErrorPage.html";
      private final String SEARCH_CUS_PAGE = "SearchCustomer.jsp";
//      private final String CUSTOMERID_PATTERN = "CS\\d{3}";
      private final String PHONENUMBER_PATTERN = "((^(\\+84|84|0|0084){1})(3|5|7|8|9))+([0-9]{8})$";
      private final String GMAIL_PATTERN = "^[a-z0-9](\\.?[a-z0-9]){5,}@g(oogle)?mail\\.com$";
//   > 8 chars, one upper letters, 
      private final String PASSWORD_PATTERN = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$";

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException, Exception {
            response.setContentType("text/html;charset=UTF-8");

            // get parameter from form
//            String CusID = request.getParameter("txtUserID");
            String Name = request.getParameter("txtName");
            String PhoneNumber = request.getParameter("txtPhoneNumber");
            String Sex = request.getParameter("txtGender");
            String Adress = request.getParameter("txtAdress");
            String BirthDateStr = request.getParameter("txtBirthDate");
            String Gmail = request.getParameter("txtEmail");
            String Username = request.getParameter("txtUsername");
            String Password = request.getParameter("txtPassword");
            String Confirm = request.getParameter("txtConfirm");
            // parse to suitable data
            Date BirthDate = Date.valueOf(BirthDateStr);
            String PasswordOrigin = Password;

            String url = ERROR_PAGE;
            boolean foundErr = false;
            UserCreateError error = new UserCreateError();
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
                  if (Name.trim().length() < 6 || Name.trim().length() > 30) {
                        error.setNameLengthErr("Please enter again full name within (6 -> 30 chars)");
                        foundErr = true;
                  }
                  if (Username.trim().length() < 6 || Username.trim().length() > 30) {
                        error.setUsernameLengthErr("Please enter Username within (6 -> 30 chars)");
                        foundErr = true;
                  }
//                  if (!checkFormat(CusID, CUSTOMERID_PATTERN, true)) {
//                        error.setCustomerIDFormatErr("Please type again, CustomerID with correct format CSxxx");
//                        foundErr = true;
//                  }
                  if (!checkFormat(Password, PASSWORD_PATTERN, true)) {
                        foundErr = true;
                        error.setPasswordLengthErr("Password is required typed ( more 8 chars, at least one upper letter)");
                  } else if (!Confirm.trim().equals(Password.trim())) {
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
                  if (!checkFormat(Gmail, GMAIL_PATTERN, true)) {
                        error.setGmailTypeErr("Please type follow to the format Gmail");
                        foundErr = true;
                  }
                  if (!checkFormat(PhoneNumber, PHONENUMBER_PATTERN, true)) {
                        error.setPhoneNumberTypeErr("Please type again PhoneNumber");
                        foundErr = true;
                  }
                  if (foundErr) {
                        request.setAttribute("CREATE_CUS_ERROR", error);
                        url = SEARCH_CUS_PAGE;
                  } else {
                        // 1. new DAO
                        UserDAO dao = new UserDAO();
                        // 2. call method
                        Password = dao.EncodePass(Password);
                        boolean sendMail = SendEmail.sendEmailAccount(Gmail, Username, PasswordOrigin, "Create New Account");
                        UserDTO user = new UserDTO(Name, PhoneNumber, Sex, Adress, BirthDate, Gmail, Username, Password, 4, true);
                        boolean result = dao.createNewAccountCustomer(user);
                        if (result && sendMail) {
                              session.removeAttribute("SHOW_CUS_CREATE_FORM");
//                              
                              url = "MainController"
                                      + "?btAction=New Order"
                                      + "&txtCustomerID=" + dao.NewestCustomer();
                        }
                  }
            } catch (SQLException ex) {
                  String msg = ex.getMessage();
                  log("CreateUserControlerr_ SQL" + msg);

                  if (msg.contains("duplicate")) {
                       
                  }
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
                  Logger.getLogger(CreateUserController.class.getName()).log(Level.SEVERE, null, ex);
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
                  Logger.getLogger(CreateUserController.class.getName()).log(Level.SEVERE, null, ex);
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
