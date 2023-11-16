
package com.vitvang.productionmanagement.controller;
import com.vitvang.productionmanagement.dao.cage.CageDAO;
import com.vitvang.productionmanagement.dao.order.OrderDAO;
import com.vitvang.productionmanagement.dao.users.UserDAO;
import com.vitvang.productionmanagement.model.CageMaterialDTO;
import com.vitvang.productionmanagement.model.DetailOrderDTO;
import com.vitvang.productionmanagement.model.OrderDTO;
import com.vitvang.productionmanagement.model.UserDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
@WebServlet(name = "Detail Order", urlPatterns = {"/DetailOrderController"})
public class DetailOrderController extends HttpServlet {

      private final String ORDER_DETAIL_PAGE = "OrderDetail.jsp";
      private static final String ERROR_PAGE = "ErrorPage.html";
      
      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            String OrderID = request.getParameter("txtOrderID");
            String url = ERROR_PAGE;
            try {
                  HttpSession session = request.getSession();// phai luon co san session
                  UserDTO currUser = (UserDTO) session.getAttribute("USER");
                  if (currUser == null) {
                        return;
                  }
                  // new DAO
                  OrderDAO orderdao = new OrderDAO();
                  UserDAO userdao = new UserDAO();
                  CageDAO dao = new CageDAO();
                  // call method orderDao
                  orderdao.searchOrder(OrderID);
                  orderdao.queryOrderDetail(OrderID);
                  
                  // process result
                  UserDTO customer = userdao.queryCusFromUserOrder(OrderID);
                  OrderDTO order = orderdao.getListOrders().get(0);
                  List<DetailOrderDTO> orderDetailList = orderdao.getListOrderDetails();
                  
                  for (DetailOrderDTO detailOrderDTO : orderDetailList) {
                        dao.ViewCageMaterial(detailOrderDTO.getCageID(), detailOrderDTO.getQuantity());
                  }
                  List<CageMaterialDTO> cageMaterialList = dao.getListCageMaterial();

                  request.setAttribute("CUS_ORDER", customer);
                  request.setAttribute("CAGE_MATERIAL", cageMaterialList);
                  request.setAttribute("CAGE_ORDER", orderDetailList);
                  request.setAttribute("ORDER", order);
                  url = ORDER_DETAIL_PAGE;

            } catch (SQLException ex) {
                  String msg = ex.getMessage();
                  log("CalculateDetailMaterial SQL" + msg);
            } catch (NamingException ex) {
                  log("CalculateDetailMaterial _ NAMING " + ex.getMessage());
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
