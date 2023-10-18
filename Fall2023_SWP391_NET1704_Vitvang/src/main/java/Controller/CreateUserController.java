/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;


import Model.UserDTO;
import static Util.tool.checkFormat;
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
import users.UserCreateError;
import users.UserDAO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CreateUserController", urlPatterns = {"/CreateUserController"})
public class CreateUserController extends HttpServlet {

      private final String ADD_ORDER_PAGE = "orderAdd.jsp";
      private final String SEARCH_CUS_PAGE = "searchCustomer.jsp";
      private final String CUSTOMERID_PATTERN = "CS\\d{3}";

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException, Exception {
            response.setContentType("text/html;charset=UTF-8");

            // get parameter from form
            String CusID = request.getParameter("txtUserID");
            String Name = request.getParameter("txtName");
            String PhoneNumber = request.getParameter("txtPhoneNumber");
            String Sex = request.getParameter("txtGender");
            String Adress = request.getParameter("txtAdress");
            String BirthDateStr = request.getParameter("txtBirthDate");
            String Email = request.getParameter("txtEmail");
            String Username = request.getParameter("txtUsername");
            String Password = request.getParameter("txtPassword");
            String Confirm = request.getParameter("txtConfirm");
            // parse to suitable data
            Date BirthDate = Date.valueOf(BirthDateStr);

            String url = SEARCH_CUS_PAGE;
            boolean foundErr = false;
            UserCreateError error = new UserCreateError();
            try {
                  if (Name.trim().length() < 6) {
                        error.setNameLengthErr("Name too short,please enter full name");
                  }
                  if (Username.trim().length() < 3) {
                        error.setNameLengthErr("UserName too short,please enter full name");
                  }
                  if (!checkFormat(CusID, CUSTOMERID_PATTERN, true)) {
                        error.setCustomerIDFormatErr("Pls type again CustomerID with correct format CSxxx");
                        foundErr = true;
                  }
                  if (Password.trim().length() < 6
                          || Password.trim().length() > 25) {
                        foundErr = true;
                        error.setPasswordLengthErr("Pass word is required typed length form 6-25 chars");
                  } else if (!Confirm.trim().equals(Password.trim())) {
                        foundErr = true;
                        error.setConfirmNotMatch("Confirm not match password");
                  }
                  if (Adress.trim().length() < 5) {
                        error.setAddressLenghtErr("Addres too short,please enter detail address");
                  }
                  if (foundErr) {
                        request.setAttribute("CREATE_CUS_ERROR", error);
                  } else {
                        // 1. new DAO
                        UserDAO dao = new UserDAO();
                        // 2. call method
                        Password = dao.EncodePass(Password);
                        UserDTO user = new UserDTO(CusID, Name, PhoneNumber, Sex, Adress, BirthDate, Email, Username, Password, 4);
                        boolean result = dao.createAccount(user);
                        if (result) {
                        HttpSession session = request.getSession();
                        session.removeAttribute("SHOW_CUS_CREATE_FORM");
                              url = "orderAdd.jsp"
                                      + "?txtCustomerID=" + CusID;
                        }
                  }
            } catch (SQLException ex) {
                  String msg = ex.getMessage();
                  log("CreateUserControlerr_ SQL" + msg);
//                  if (msg.contains("duplicate")) {
//                        error.setUsernameIsExist(Username + " is existed!!!");
//                        request.setAttribute("CREATE_CUS_ERROR", error);
//                  } 
                  if (msg.contains("duplicate")) {
                        error.setCustomerIDexistErr(CusID + " is existed!!!");
                        request.setAttribute("CREATE_CUS_ERROR", error);
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
