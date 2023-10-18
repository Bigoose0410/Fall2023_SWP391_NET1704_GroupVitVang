<%-- 
    Document   : EditDeisgn
    Created on : Oct 10, 2023, 3:51:01 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <!----======== CSS ======== -->
          <link rel="stylesheet" href="css/ProductDetail.css">

          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
          <title>Edit Design</title>
     </head>
     <body>
          <c:url var="logout_query" value="MainController">
               <c:param name="cookiekey" value="${sessionScope.USER.getName()}"/>
               <c:param value="Log Out" name="btAction"/>
          </c:url>
          <c:url var="productionList" value="MainController">
               <c:param value="SearchCage" name="btAction"/>
          </c:url>
          <c:set var="CageID" value="${param.txtCageID}"></c:set>
          <c:set var="Design" value="${requestScope.DESIGN_PROCESS}"></c:set>
               <nav>

                    <div class="logo-name">
                         <div class="logo-image">
                              <img src="images/logo.png" alt="">
                         </div>

                         <span class="logo_name">${sessionScope.USER.getName()}</span>
               </div>

               <div class="menu-items">
                    <ul class="nav-links">
                         <li><a href="#">
                                   <i class="uil uil-estate"></i>
                                   <span class="link-name">Dahsboard</span>
                              </a></li>
                         <li><a href="MainController?btAction=Order">
                                   <i class="uil uil-bill"></i>
                                   <span class="link-name">Order</span>
                              </a></li>
                         <li><a href="#">
                                   <i class="uil uil-grin"></i>
                                   <span class="link-name">Customers</span>
                              </a></li>
                         <li><a href="${productionList}">
                                   <i class="uil uil-grin"></i>
                                   <span class="link-name">Production</span>
                              </a></li>
                         <li><a href="#">
                                   <i class="uil uil-chart-line"></i>
                                   <span class="link-name">Production process</span>
                              </a></li>
                         <li><a href="#">
                                   <i class="uil uil-clipboard-alt"></i>
                                   <span class="link-name">Reports</span>
                              </a></li>
                         <li><a href="#">
                                   <i class="uil uil-screw"></i>
                                   <span class="link-name">Material</span>
                              </a></li>
                         <li><a href="#">
                                   <i class="uil uil-archive-alt"></i>
                                   <span class="link-name">Inventory</span>
                              </a></li>
                    </ul>

                    <ul class="logout-mode">
                         <li><a href="${logout_query}">
                                   <i class="uil uil-signout"></i>
                                   <span class="link-name" >Logout</span>
                              </a></li>

                         <li class="mode">
                              <a href="#">
                                   <i class="uil uil-moon"></i>
                                   <span class="link-name">Dark Mode</span>
                              </a>

                              <div class="mode-toggle">
                                   <span class="switch"></span>
                              </div>
                         </li>
                    </ul>
               </div>
          </nav>
          <section class="dashboard2">
               <div id="processing-form">

                    <h1>Design Process</h1>
                    <form action="MainController">
                         <input type="hidden" name="txtCageID" value="${param.txtCageID}" />
                         <button type="submit" value="EditDesign" name="btAction">Modify</button>
                    </form>
                    <div id="process-form">
                         <table class="tablesorter-custom2">
                              <thead>
                                   <tr>
                                        <th>No.</th>
                                        <th>Phrase</th>
                                        <th>CageID</th>
                                        <th>Time Process</th>
                                        <th>Description</th>
                                        <th>Employee Need</th>
                                        <th>Modify</th>
                                   </tr>
                              </thead>
                              <tbody>
                                   <c:set var="countPhare" value=""></c:set>
                                   <c:forEach var="dto" items="${Design}" varStatus="counter">
                                   <form action="MainController">
                                        <tr>
                                             <td>
                                                  ${counter.count}
                                                  <c:set var="countPhare" value="${counter.count}"></c:set>
                                                  </td>
                                                  <td>
                                                  ${dto.getPhrase()}
                                                  <input type="hidden" name="txtPhrase" value="${dto.getPhrase()}" />
                                             </td>
                                             <td>
                                                  ${dto.getCageID()}
                                                  <input type="hidden" name="txtCageID" value="${dto.getCageID()}" />
                                             </td>
                                             <td>
                                                  <input type="text" name="txtTimeProcess" value="${dto.getTimeProcess()}" />
                                             </td>
                                             <td>
                                                  <input type="text" name="txtDescription" value="${dto.getDescription()}" />
                                             </td>
                                             <td>
                                                  <input type="text" name="txtNumberOfEmployee" value="${dto.getNumberOfEmployee()}" />
                                             </td>
                                             <td>
                                                  <button type="submit" value="updateDesign" name="btAction">
                                                       Update
                                                  </button>
<!--                                                  <button type="submit" value="DeleteDesign" name="btAction">
                                                       Delete
                                                  </button>-->
                                                  
                                             </td>
                                        </tr>
                                   </form>
                              </c:forEach>
                              </tbody>
                         </table>

                         <table>
                              <thead>
                                   <tr>
                                        <th>Phrase</th>
                                        <th>Time Process</th>
                                        <th>Description</th>
                                        <th>NumberOfEmployee</th>
                                        <th>CompletionCage</th>
                                        <th>Action</th>
                                   </tr>
                              </thead>
                              <tbody>
                              <form action="MainController">
                                   <tr>
                                        <td>
                                             <input type="text" name="txtPhrase" value="${param.txtPhrase}" placeholder="P001" />
                                        </td>
                                        <td>
                                             <input type="number" name="txtTimeProcess" min="1" max="20" value="${param.txtTimeProcess}" placeholder="time" />
                                        </td>
                                        <td>
                                             <input type="text" name="txtDescription" value="${param.txtDescription}" placeholder=""/>
                                        </td>
                                        <td>
                                             <input type="number" name="txtNumberOfEmployee" min="1" max="10" value="${param.txtNumberOfEmployee}" />
                                        </td>
                                        <td>
                                             <input type="number" name="txtCompletionCage" min="1" max="10" value="${param.txtCompletionCage}" />
                                        </td>
                                        <td>
                                             <input type="hidden" name="txtCageID" value="${CageID}" />
                                             <button type="submit" value="AddDesignProcess" name="btAction">New Step</button>
                                        </td>
                                   </tr>
                              </form>
                              </tbody>
                         </table>
                    </div>
               </div>
          </section>
          <script src="js/Material.js"></script>

     </body>
</html>
