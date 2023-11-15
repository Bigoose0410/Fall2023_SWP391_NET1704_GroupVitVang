package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.dao.designforprocess.DesignForProcessDAO;
import com.vitvang.productionmanagement.dao.historyupdateprocess.HistoryUpdateProcessDAO;
import com.vitvang.productionmanagement.dao.order.OrderDAO;
import com.vitvang.productionmanagement.dao.process.ProcessDAO;
import com.vitvang.productionmanagement.model.DesignForProcessDTO;
import com.vitvang.productionmanagement.model.ProcessDTO;
import com.vitvang.productionmanagement.model.UserDTO;
import com.vitvang.productionmanagement.util.Constant;
import static com.vitvang.productionmanagement.util.tool.calculateProcessDate;
import static com.vitvang.productionmanagement.util.tool.checkRole;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UpdateStatusProcessController", urlPatterns = {"/UpdateStatusProcessController"})
public class UpdateStatusProcessController extends HttpServlet {

      private static final String ERROR_PAGE = "ErrorPage.html";

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException, SQLException {
            response.setContentType("text/html;charset=UTF-8");
            String Status = request.getParameter("txtStatus");
            String ProcessID = request.getParameter("txtProcessID");
            String OrderID = request.getParameter("txtOrderID");
            String CageID = request.getParameter("txtCageID");
            String LastStep = request.getParameter("LastStep");
            String addComplete = request.getParameter("txtCompletedAdd");
            String quanneedproduct = request.getParameter("txtTotalQuantity");
            String txtquantityCompleted = request.getParameter("txtquantityCompleted");
            int addcompleted = Integer.parseInt(addComplete);
            int totalquanNeed = Integer.parseInt(quanneedproduct);
            int quantityCompleted = Integer.parseInt(txtquantityCompleted);
            long millis = System.currentTimeMillis();
            java.sql.Date now = new java.sql.Date(millis);

            String url = ERROR_PAGE;
            boolean result = false;
            boolean full = false;
            boolean laststep = false;
            boolean updatefrom = false;
            Date startDate = null;
            Date endDate = null;
            String content = "";
            try {
                  HttpSession session = request.getSession();// phai luon co san session
                  UserDTO currUser = (UserDTO) session.getAttribute("USER");
                  if (currUser == null) {
                        return;
                  }
                  int roleID = currUser.getRoleID();
                  //0. check role 
                  if (!checkRole(roleID, Constant.isManager)) {
                        return;
                  }
                  if (LastStep != null) {
                        laststep = true;
                  }
                  ProcessDAO processdao = new ProcessDAO();
                  OrderDAO orderdao = new OrderDAO();
                  HistoryUpdateProcessDAO historydao = new HistoryUpdateProcessDAO();
                  if (addcompleted >= totalquanNeed - quantityCompleted) {
                        full = processdao.updateQuantityCompleted(totalquanNeed, ProcessID, OrderID, CageID);
                        if (full) {
                              result = processdao.updateStatusProcessToDone("Done", ProcessID, OrderID, CageID, laststep);
                              if (laststep) {
                                    orderdao.queryOrderDetail(OrderID);
                                    boolean orderdone = false;
                                    orderdone = orderdao.countOrderDetailnotDone(OrderID);
                                    if (orderdone) {
                                          result = orderdao.updateOrderStatus(OrderID, now, "Done");
                                    }
                              } else {
                                    //get list design of process
                                    DesignForProcessDAO designdao = new DesignForProcessDAO();
                                    designdao.ViewDesignForProcess(CageID);
                                    List<DesignForProcessDTO> designList = designdao.getDesignProcessList();
                                    // get all process of processing of this order with cage
                                    processdao.ViewProcessingOrder(OrderID, CageID, CageID);

                                    for (ProcessDTO process : processdao.getListOrdersProcess()) {
                                          // kiem tra xem can update tu buoc nao
                                          if (process.getProcessID().equals(ProcessID)) {
                                                // update tu buoc nay
                                                updatefrom = true;
                                                // cap nhat endate cua buoc dau tien la thoi diem hien tai
                                                processdao.updateTimeProcess(process.getProcessID(), OrderID, CageID, process.getStartDate(), now, process.getNumberOfEmployee());
                                                // ngày kết thúc của bước trc sẽ thành ngày bắt đầu của bước sau
                                                startDate = now;

                                          }
                                          if (updatefrom == true && !process.getProcessID().equals(ProcessID)) {
//                                                for (DesignForProcessDTO design : designList) {
                                                DesignForProcessDTO design = designdao.getCurentDesign(CageID, process.getPhrase());
                                                if (design != null) {
//                                                            tính ngày dựa trên thiết kế trong design
                                                      endDate = calculateProcessDate(startDate, process.getQuantity(),
                                                              design.getTimeProcess(), design.getNumberOfEmployee(),
                                                              design.getNumCompletionCage(), process.getNumberOfEmployee());
                                                      processdao.updateTimeProcess(process.getProcessID(), OrderID, CageID, startDate, endDate, process.getNumberOfEmployee());
                                                      // ngày kết thúc của bước trc sẽ thành ngày bắt đầu của bước sau
                                                      startDate = endDate;
//                                                            nếu đã update bước đó xong thì qua bước tiếp, không để chạy hết vòng lặp
//                                                      break;
                                                }
                                          }

//                                          }
                                    }
                              }
                        }
                  } else {
                        result = processdao.updateQuantityCompleted(addcompleted + quantityCompleted, ProcessID, OrderID, CageID);
                  }
                  content = "Update Quantity Complete in step: " + addComplete;
                  result = historydao.insertHistory(ProcessID, OrderID, CageID, now, content, "Quantity Complete");
                  if (result) {
                        url = "MainController?btAction=ViewProcessDetail";
                  }
            } catch (SQLException ex) {
                  String msg = ex.getMessage();
                  log("UpdateStatusProcessController SQL" + msg);
            } catch (NamingException ex) {
                  String msg = ex.getMessage();
                  log("UpdateStatusProcessController NAMING" + msg);
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
            } catch (SQLException ex) {
                  Logger.getLogger(UpdateStatusProcessController.class.getName()).log(Level.SEVERE, null, ex);
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
            } catch (SQLException ex) {
                  Logger.getLogger(UpdateStatusProcessController.class.getName()).log(Level.SEVERE, null, ex);
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
