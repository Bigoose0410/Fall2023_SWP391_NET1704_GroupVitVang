/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vitvang.productionmanagement.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

      private final String LoginController = "LoginServlet";
      private final String StartUpController = "StartUpController";
      private final String LogOutController = "LogOutServlet";
      //search-show
      private final String SearchOrderController = "SearchOrderController";
      private final String SearchCageController = "SearchCageController";
      private final String SearchCustomerController = "SearchCustomerController";
      private final String OrderHistoryController = "OrderHistoryController";
      private final String ListCageController = "ListCageController";
      private final String ShowCusCreateFormController = "ShowCusCreateFormController";
      private final String CalculateDetailMaterial = "CalculateDetailMaterial";
      private final String DetailOrderController = "DetailOrderController";
      private final String DetailProductController = "DetailProductController";
      private final String EditDesignController = "EditDesignController";
      private final String EditMaterialController = "EditMaterialController";
      private final String ShowAddCageFormController = "ShowAddCageFormController";
      //create-add
      private final String AddOrderController = "AddOrderController";
      private final String AddItemToCartController = "AddItemToCartController";
      private final String AddDesignProcess = "AddDesignProcess";
      private final String CreateUserController = "CreateUserController";
      private final String AddMaterialToCageController = "AddMaterialToCageController";
      private final String AddAutoProcessController = "ProductionProcessController";
      private final String AddCageController = "AddCageController";
      //update
      private final String UpdateOrderController = "UpdateOrderController";
      private final String UpdateDesignProcessController = "UpdateDesignProcessController";
      private final String UpdateMaterialofCageController = "UpdateMaterialofCageController";
      //delete
      private final String RemoveItemFromCartController = "RemoveItemFromCartController";
      private final String DeleteOrderController = "DeleteOrderController";
      private final String DeleteMaterialofCageController = "DeleteMaterialofCageController";
      private final String ProcessController = "ProcessController";
      private final String UpdateSatusNewOrderController = "UpdateSatusNewOrderController";
      private final String CustomerController = "CustomerController";
      private final String UpdateStatusProcessController = "UpdateStatusProcessController";
      private final String UpdateEmpProcessController = "UpdateEmpProcessController";
      private final String ManageAccountController = "ManageAccountController";
      private final String UpdateAccountController = "UpdateAccountController";
      private final String ViewAccountDetailController = "ViewAccountDetailController";
      private final String CreateAccountController = "CreateAccountController";
      private static final String ERROR_PAGE = "ErrorPage.html";
      private final String DeleteAccountController = "DeleteAccountController";
      private final String SearchAccountController = "SearchAccountController";

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");

            String button = request.getParameter("btAction");
            String url = ERROR_PAGE;
            try {
                  if (button == null) {
                        url = StartUpController;
                  } else if (button.equals("Login")) {
                        url = LoginController;
                  } else if (button.equals("Log Out")) {
                        url = LogOutController;
                  } else if (button.equals("Search")) {
                        url = SearchOrderController;
                  } else if (button.equals("Update")) {
                        url = UpdateOrderController;
                  } else if (button.equals("Delete")) {
                        url = DeleteOrderController;
                  } else if (button.equals("Order")) {
                        url = OrderHistoryController;
                  } else if (button.equals("New Order")) {
                        url = ListCageController;
                  } else if (button.equals("Create Order")) {
                        url = AddOrderController;
                  } else if (button.equals("addToCart")) {
                        url = AddItemToCartController;
                  } else if (button.equals("RemoveItemFromCart")) {
                        url = RemoveItemFromCartController;
                  } else if (button.equals("Search Customer")) {
                        url = SearchCustomerController;
                  } else if (button.equals("New Customer")) {
                        url = CreateUserController;
                  } else if (button.equals("Create New Customer")) {
                        url = ShowCusCreateFormController;
                  } else if (button.equals("View Detail")) {
                        url = CalculateDetailMaterial;
                  } else if (button.equals("Detail")) {
                        url = DetailOrderController;
                  } else if (button.equals("SearchCage")) {
                        url = SearchCageController;
                  } else if (button.equals("DetailProduct")) {
                        url = DetailProductController;
                  } else if (button.equals("EditDesign")) {
                        url = EditDesignController;
                  } else if (button.equals("AddDesignProcess")) {
                        url = AddDesignProcess;
                  } else if (button.equals("updateDesign")) {
                        url = UpdateDesignProcessController;
                  } else if (button.equals("UpdateMaterialofCage")) {
                        url = UpdateMaterialofCageController;
                  } else if (button.equals("EditMaterial")) {
                        url = EditMaterialController;
                  } else if (button.equals("DeleteMaterialofCage")) {
                        url = DeleteMaterialofCageController;
                  } else if (button.equals("AddMaterialToCage")) {
                        url = AddMaterialToCageController;
                  } else if (button.equals("Production process")) {
                        url = ProcessController;
                  } else if (button.equals("AddToProcess")) {
                        url = UpdateSatusNewOrderController;
                  } else if (button.equals("Customers")) {
                        url = CustomerController;
                  } else if (button.equals("ViewProcessDetail")) {
                        url = ProcessController;
                  } else if (button.equals("UpdateStatusProcess")) {
                        url = UpdateStatusProcessController;
                  } else if (button.equals("UpdateEmployee")) {
                        url = UpdateEmpProcessController;
                  } else if (button.equals("AddNewCage")) {
                        url = AddCageController;
                  } else if (button.equals("FormAddCage")) {
                        url = ShowAddCageFormController;
                  } else if (button.equals("Manage Account")) {
                        url = ManageAccountController;
                  } else if (button.equals("ViewAccountDetail")) {
                        url = ViewAccountDetailController;
                  } else if (button.equals("UpdateAccount")) {
                        url = UpdateAccountController;
                  } else if (button.equals("CreateAccount")) {
                        url = CreateAccountController;
                  } else if (button.equals("DeleteAccount")) {
                        url = DeleteAccountController;
                  } else if (button.equals("SearchAccount")) {
                        url = SearchAccountController;
                  }

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

      /**
       * Returns a short description of the servlet.
       *
       * @return a String containing servlet description
       */
}
