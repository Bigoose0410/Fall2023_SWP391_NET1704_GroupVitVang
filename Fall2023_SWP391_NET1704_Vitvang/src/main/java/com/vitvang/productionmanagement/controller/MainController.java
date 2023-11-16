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
      private final String AutoAddProcessController = "AutoAddProcessController";
      private final String AddCageController = "AddCageController";
      private final String AddMaterialController = "AddMaterialController";
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
      private final String ViewMaterialController = "ViewMaterialController";
      private final String DashboardController = "DashboardController";
      private final String CustomerAccountController = "CustomerAccountController";
      private final String CustomerOrderController = "CustomerOrderController";
      private final String CustomerProcessController = "CustomerProcessController";
      private final String CustomerUpdateAccountController = "CustomerUpdateAccountController";

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");

            String button = request.getParameter("btAction");
            String url = ERROR_PAGE;
            try {
                  if (null == button) {
                        url = StartUpController;
                  } else {
                        switch (button) {
                              case "Login":
                                    url = LoginController;
                                    break;
                              case "Log Out":
                                    url = LogOutController;
                                    break;
                              case "Search":
                                    url = SearchOrderController;
                                    break;
                              case "Update":
                                    url = UpdateOrderController;
                                    break;
                              case "Delete":
                                    url = DeleteOrderController;
                                    break;
                              case "Order":
                                    url = OrderHistoryController;
                                    break;
                              case "New Order":
                                    url = ListCageController;
                                    break;
                              case "Create Order":
                                    url = AddOrderController;
                                    break;
                              case "addToCart":
                                    url = AddItemToCartController;
                                    break;
                              case "RemoveItemFromCart":
                                    url = RemoveItemFromCartController;
                                    break;
                              case "Search Customer":
                                    url = SearchCustomerController;
                                    break;
                              case "New Customer":
                                    url = CreateUserController;
                                    break;
                              case "Create New Customer":
                                    url = ShowCusCreateFormController;
                                    break;
                              case "View Detail":
                                    url = CalculateDetailMaterial;
                                    break;
                              case "Detail":
                                    url = DetailOrderController;
                                    break;
                              case "SearchCage":
                                    url = SearchCageController;
                                    break;
                              case "DetailProduct":
                                    url = DetailProductController;
                                    break;
                              case "EditDesign":
                                    url = EditDesignController;
                                    break;
                              case "AddDesignProcess":
                                    url = AddDesignProcess;
                                    break;
                              case "updateDesign":
                                    url = UpdateDesignProcessController;
                                    break;
                              case "UpdateMaterialofCage":
                                    url = UpdateMaterialofCageController;
                                    break;
                              case "EditMaterial":
                                    url = EditMaterialController;
                                    break;
                              case "DeleteMaterialofCage":
                                    url = DeleteMaterialofCageController;
                                    break;
                              case "AddMaterialToCage":
                                    url = AddMaterialToCageController;
                                    break;
                              case "Production process":
                                    url = ProcessController;
                                    break;
                              case "AddToProcess":
                                    url = AutoAddProcessController;
                                    break;
                              case "Customers":
                                    url = CustomerController;
                                    break;
                              case "StaffViewCustomerDetail":
                                    url = CustomerController;
                                    break;
                              case "ViewProcessDetail":
                                    url = ProcessController;
                                    break;
                              case "UpdateStatusProcess":
                                    url = UpdateStatusProcessController;
                                    break;
                              case "UpdateEmployee":
                                    url = UpdateEmpProcessController;
                                    break;
                              case "AddNewCage":
                                    url = AddCageController;
                                    break;
                              case "FormAddCage":
                                    url = ShowAddCageFormController;
                                    break;
                              case "Manage Account":
                                    url = ManageAccountController;
                                    break;
                              case "ViewAccountDetail":
                                    url = ViewAccountDetailController;
                                    break;
                              case "UpdateAccount":
                                    url = UpdateAccountController;
                                    break;
                              case "CreateAccount":
                                    url = CreateAccountController;
                                    break;
                              case "DeleteAccount":
                                    url = DeleteAccountController;
                                    break;
                              case "SearchAccount":
                                    url = SearchAccountController;
                                    break;
                              case "Dashboard":
                                    url = DashboardController;
                                    break;
                              case "CustomerAccount":
                                    url = CustomerAccountController;
                                    break;
                              case "CustomerOrder":
                                    url = CustomerOrderController;
                                    break;
                              case "CustomerTracking":
                                    url = CustomerProcessController;
                                    break;
                              case "AddMaterial":
                                    url = AddMaterialController;
                                    break;
                              case "View All Material":
                                    url = ViewMaterialController;
                                    break;
                              case "CustomerUpdaterAccount":
                                    url = CustomerUpdateAccountController;
                                    break;
                              case "View Order Detail":
                                    url = CustomerOrderController;
                                    break;
                              default:
                                    break;
                        }
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
