/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Process.ProcessDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import static java.lang.System.out;
import java.util.Date;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

/**
 *
 * @author Lê Minh Nhật
 */
@WebServlet(name = "ProductionProcessController", urlPatterns = {"/ProductionProcessController"})
public class ProductionProcessController extends HttpServlet {

      private final String ERRORPAGE = "newLogin.jsp";
      private final String PRODUCTPROESSPAGE = "MainController?btAction=Production process";

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException, ParseException, SQLException {
            response.setContentType("text/html;charset=UTF-8");

            /* TODO output your page here. You may use following sample code. */
            String url = ERRORPAGE;
            String orderId = request.getParameter("txtOrderID");
            String cageId = request.getParameter("txtCageID");
            String getQuantity = request.getParameter("txtQuantity");
            int quantity = Integer.parseInt(getQuantity);
//                  out.println("c: " + cageId + orderId + getQuantity);
            String getStartDate = request.getParameter("txtStartDate");
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                  Date date1 = (Date) dateFormat.parse(getStartDate);
//            Date date1 = Date.valueOf(getStartDate);
            java.util.Date utilDate = date1;
            java.sql.Date startDate = new java.sql.Date(date1.getTime());
            try {
                  ProcessDAO dao = new ProcessDAO();
                  boolean result = dao.AutoAddProcess(orderId, cageId, startDate, quantity);
                  //                  List<ProcessDTO> process = dao.getListOrdersProcess();
//                  request.setAttribute("PROCESS_RESULT", process);
                  if (result) {
                        url = PRODUCTPROESSPAGE;
                  }
            } catch (SQLException | NamingException ex) {
                  String msg = ex.getMessage();
                  log("ProductionProcessController_LOG" + msg);
            } finally {
                  RequestDispatcher rd = request.getRequestDispatcher(url);
                  rd.forward(request, response);
            }
      }
// chạy debug thử, t debug file nha, hay pj luon file trc di
//      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//              throws ServletException, IOException, SQLException, NamingException, ParseException {
//            response.setContentType("text/html;charset=UTF-8");
////            out.println("hmmm");
//            String url = ERRORPAGE;
//            String orderId = request.getParameter("txtOrderID");
//            String cageId = request.getParameter("txtCageID");
//            String getQuantity = request.getParameter("txtQuantity");
//            int quantity = Integer.parseInt(getQuantity); 
//            String getStartDate = request.getParameter("txtStartDate");
//            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//            Date date1 = (Date) dateFormat.parse(getStartDate);
//            java.util.Date utilDate = date1;
//            java.sql.Date startDate = new java.sql.Date(date1.getTime());
//            ProcessDAO dao = new ProcessDAO();
//            boolean result = dao.AutoAddProcess(orderId, cageId, startDate, quantity);
//            //                  List<ProcessDTO> process = dao.getListOrdersProcess();
////                  request.setAttribute("PROCESS_RESULT", process);
//            if (result) {
//                  url = PRODUCTPROESSPAGE;
//            }
//            request.getRequestDispatcher(url).forward(request, response);
//      }     
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
            } catch (ParseException | SQLException ex) {
                  Logger.getLogger(ProductionProcessController.class.getName()).log(Level.SEVERE, null, ex);
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
            } catch (ParseException | SQLException ex) {
                  Logger.getLogger(ProductionProcessController.class.getName()).log(Level.SEVERE, null, ex);
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
