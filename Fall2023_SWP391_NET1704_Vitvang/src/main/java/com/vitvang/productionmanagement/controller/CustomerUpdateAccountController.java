package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.dao.account.AccountDAO;
import com.vitvang.productionmanagement.dao.users.UserDAO;
import com.vitvang.productionmanagement.exception.account.CreateAccountError;
import com.vitvang.productionmanagement.model.AccountDTO;
import com.vitvang.productionmanagement.model.UserDTO;
import com.vitvang.productionmanagement.util.Constant;
import static com.vitvang.productionmanagement.util.tool.checkFormat;
import static com.vitvang.productionmanagement.util.tool.checkRole;
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

@WebServlet(name = "CustomerUpdateAccountController", urlPatterns = {"/CustomerUpdateAccountController"})
public class CustomerUpdateAccountController extends HttpServlet {

      private static final String ERROR_PAGE = "ErrorPage.html";
      private final String AdminCreateAccount = "AdminCreateAccount.jsp";
      private final String PHONENUMBER_PATTERN = "((^(\\+84|84|0|0084){1})(3|5|7|8|9))+([0-9]{8})$";
      private final String EMAIL_PATTERN = "^[a-z0-9](\\.?[a-z0-9]){5,}@g(oogle)?mail\\.com$";
      private final String PASSWORD_PATTERN = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$";//check 1 ky tu hoa, 1 ky tu thuong, 1 so, it nhat 8 ky tu
      private final String SPACE_PATTERN = "^\\S+$"; //check neu khong co khoang trong
      private final String NOT_NUMBER_PATTERN = "^[^0-9]*$"; //khong chua so
      private final String CHECK_SPACE_PATTERN = "^(?!.*\\s{2})\\S+(\\s\\S+)?\\s{0,4}\\S+$"; //dau va cuoi khong co khoang trang, giua 2 tu khong qua 2 khoang trang, toi da 5 khoang trang
      private final String CHECK_SPACE_FOR_ADDRESS = "^\\w+(\\s\\w+)*$"; //dau cuoi khong co khoang trang, giua 2 tu toi da 1 khoang trang
      private final String CHECK_SPACE_FOR_NAME = "^(?!.*\\s{6,})\\w+(\\s\\w+){0,5}$"; //dau cuoi khong co khoang trang, giua 2 tu toi da 1 khoang trang, tong cong toi da 5 khoang trang

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
            boolean foundErr = false;
            CreateAccountError error = new CreateAccountError();
            boolean update = false;

            try {
                  HttpSession session = request.getSession();// phai luon co san session
                  UserDTO currUser = (UserDTO) session.getAttribute("USER");
                  if (currUser == null) {
                        return;
                  }
                  int roleID = currUser.getRoleID();
                  //0. check role 
                  if (!checkRole(roleID, Constant.isCustomer)) {
                        return;
                  }
                  if (!Password.equalsIgnoreCase("")) {
                        if (!checkFormat(Password, PASSWORD_PATTERN, true)) {
                              error.setPasswordFormatErr("Password (at least 1 upper letter, 1 lower letter, 1 number)");
                              foundErr = true;
                        } else if (!checkFormat(Password, SPACE_PATTERN, true)) {
                              error.setPasswordFormatErr("Password cannot inclue space");
                              foundErr = true;
                        }
                  }

                  if (Password.equalsIgnoreCase("")) {
                        foundErr = false;
                  }

//                  if (!ConfirmPassword.trim().equals(Password.trim())) {
//                        error.setConfirmPasswordNotMatchErr("Confirm password not match");
//                        foundErr = true;
//                  }
                  if (!checkFormat(Email, EMAIL_PATTERN, true)) {
                        error.setEmailFormatErr("Wrong format email (***@gmail.com");
                        foundErr = true;
                  } else if (!checkFormat(Email, SPACE_PATTERN, true)) {
                        error.setEmailFormatErr("Email cannot inclue space");
                        foundErr = true;
                  }

                  if (!checkFormat(PhoneNumber, PHONENUMBER_PATTERN, true)) {
                        error.setPhoneNumberFormatErr("Wrong format phone number (+84xxxxxxxxx)");
                        foundErr = true;
                  }

                  if (Address.trim().length() < 6) {
                        error.setAddressFormatErr("Addrress too short (>6)");
                        foundErr = true;
                  } else if (!checkFormat(Address, CHECK_SPACE_FOR_ADDRESS, true)) {
                        error.setAddressFormatErr("Wrong format about space");
                        foundErr = true;
                  }
                  if (foundErr) {
                        request.setAttribute("UPDATE_ACCOUNT_ERR", error);
                        request.setAttribute("MESSAGE_CREATE_FAIL", "Update account failed!!!");
                        url = "MainController?btAction=CustomerAccount&UserID=" + UserID;
                  } else //else {
                  //                        UserDAO userdao = new UserDAO();
                  //                        AccountDAO dao = new AccountDAO();
                  //                        dao.ViewAccountDetail(UserID);
                  //                        List<AccountDTO> detail = dao.getListAccount();
                  //                        request.setAttribute("ACCOUNT_DETAIL", detail);
                  //                        Password = userdao.EncodePass(Password);
                  //                        boolean update = dao.UpdateAccount(UserID, Username, Password, Email, Address, PhoneNumber);
                  //                        if (update) {
                  //                              url = "MainController?btAction=CustomerAccount&UserID=" + UserID;
                  //                              request.setAttribute("MESSAGE", "Update successfully");
                  //                        } else {
                  //                              url = "MainController?btAction=CustomerAccount&UserID=" + UserID;
                  //                              request.setAttribute("MESSAGE", "Update account failed");
                  //                        }
                  //                  }
                  {
                        UserDAO userdao = new UserDAO();
                        AccountDAO dao = new AccountDAO();
                        dao.ViewAccountDetail(UserID);
                        List<AccountDTO> detail = dao.getListAccount();
                        request.setAttribute("ACCOUNT_DETAIL", detail);
                        if (Password.equalsIgnoreCase("")) {
                              update = dao.UpdateAccountWithoutPassword(UserID, Email, Address, PhoneNumber);
                        } else {
                              Password = userdao.EncodePass(Password);
                              update = dao.UpdateAccountWithPassowd(UserID, Password, Email, Address, PhoneNumber);
                        }
                        if (update) {
                              url = "MainController?btAction=CustomerAccount&UserID=" + UserID;
                              request.setAttribute("MESSAGE", "Update successfully");
                        } else {
                              url = "MainController?btAction=CustomerAccount&UserID=" + UserID;
                              request.setAttribute("MESSAGE", "Update account failed");
                        }
                  }
            } catch (SQLException e) {
                  error.setUsernameExistErr("UsserName is Dupplicate");
                  request.setAttribute("UPDATE_ACCOUNT_ERR", error);
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
