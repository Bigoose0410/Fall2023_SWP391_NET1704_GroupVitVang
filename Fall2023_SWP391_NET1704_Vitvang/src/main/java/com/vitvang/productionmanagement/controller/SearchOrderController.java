package com.vitvang.productionmanagement.controller;
import com.vitvang.productionmanagement.dao.order.OrderDAO;
import com.vitvang.productionmanagement.model.OrderDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "SearchOrderController", urlPatterns = {"/SearchOrderController"})
public class SearchOrderController extends HttpServlet {

      private final String OrderSearch = "Order.jsp";
      private static final String ERROR_PAGE = "ErrorPage.html";
      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            String searchValue = request.getParameter("txtSearchValue");
            String page = request.getParameter("page");

            String url = ERROR_PAGE;
            try {
                  OrderDAO dao = new OrderDAO();
                  if (searchValue == null) {
                        searchValue = "";
                  }
                  if (page == null) {
                        page = "1";
                  }
                  int indexPage = Integer.parseInt(page);
                  int fieldShow = 5;

                  int endPage = dao.getNumberPage( searchValue.trim(), fieldShow);
                  List<OrderDTO> result = dao.getPagingByCreateDateDesc(indexPage, searchValue.trim(), fieldShow);
                  int start = 1;
                  int distance = 3;

                  int end;
                  if (endPage < distance) {
                        end = endPage;
                  } else {
                        end = start + distance;
                  }

                  if (indexPage >= 3) {
                        start = indexPage - 2;
                        end = indexPage + 2;
                        if (indexPage + distance >= endPage) {
                              start = endPage - distance;
                              end = endPage;
                        }
                  }
                 
                  url = OrderSearch;
                  request.setAttribute("TOTAL_ORDER", result.size());
                  request.setAttribute("PROCESS_ORDER", dao.countProcessingOrder());
                  request.setAttribute("NEW_ORDER", dao.countNewOrder());
                  request.setAttribute("START", start);
                  request.setAttribute("END", end);
                  request.setAttribute("indexCurrent", indexPage);
                  request.setAttribute("endPage", endPage);
                  request.setAttribute("SEARCH_RESULT", result);
            } catch (SQLException ex) {
                  ex.printStackTrace();
            } catch (ClassNotFoundException ex) {
                  ex.printStackTrace();
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

}