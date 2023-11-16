package com.vitvang.productionmanagement.controller;

import com.vitvang.productionmanagement.dao.cage.CageDAO;
import com.vitvang.productionmanagement.dao.material.MaterialDAO;
import com.vitvang.productionmanagement.model.CageMaterialDTO;
import com.vitvang.productionmanagement.model.UserDTO;
import com.vitvang.productionmanagement.util.Constant;
import static com.vitvang.productionmanagement.util.tool.checkRole;
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
@WebServlet(name = "EditMaterialController", urlPatterns = {"/EditMaterialController"})
public class EditMaterialController extends HttpServlet {

      private static String CAGE_MATERIAL_PAGE = "EditMaterial.jsp";
      private static final String ERROR_PAGE = "ErrorPage.html";

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            String cageID = request.getParameter("txtCageID");
            String Materialselect = request.getParameter("slMateriaID");
            String url = ERROR_PAGE;
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
                  //1. new DAO
                  CageDAO cagedao = new CageDAO();
                  MaterialDAO materialdao = new MaterialDAO();
                  //2. Call method
                  cagedao.ViewCageMaterial2(cageID);
                  materialdao.MaterialNotBuild(cageID);
                  // get result set
                  List<CageMaterialDTO> listmaterial = cagedao.getListCageMaterial();
                  List<CageMaterialDTO> listmaterialnotbuild = materialdao.getListMaterialnotBuild();
                  CageMaterialDTO materAdd = materialdao.queryMaterialbyID(Materialselect);
                  int materialPirce = cagedao.TotalPriceMaterial();
                  //3. process result     
                  request.setAttribute("CAGE_MATERIAL", listmaterial);
                  request.setAttribute("MATERIAL_PRICE", materialPirce);
                  request.setAttribute("MATERIAL_NOT_USE", listmaterialnotbuild);
                  request.setAttribute("MATERIAL_WILL_ADD", materAdd);

                  url = CAGE_MATERIAL_PAGE;

            } catch (SQLException ex) {
                  String msg = ex.getMessage();
                  log("EditMaterialController SQL" + msg);
            } catch (NamingException ex) {
                  log("EditMaterialController _ NAMING " + ex.getMessage());
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
