<%-- 
    Document   : ProductDetail
    Created on : Oct 10, 2023, 1:45:06 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>

          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <!----======== CSS ======== -->
          <link rel="stylesheet" href="css/ProductDetail1.css">

          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
          <title>Production Detail</title>
     </head>
     <body>
          <!-- log out link -->
          <c:url var="logout_query" value="MainController">
               <c:param name="cookiekey" value="${sessionScope.USER.getName()}"/>
               <c:param value="Log Out" name="btAction"/>
          </c:url>
          <c:url var="productionList" value="MainController">
               <c:param value="SearchCage" name="btAction"/>
          </c:url>
          <c:set var="ListMaterial" value="${requestScope.CAGE_MATERIAL}"></c:set>
          <c:set var="Design" value="${requestScope.DESIGN_PROCESS}"></c:set>
          <c:set var="materialPrice" value="${requestScope.MATERIAL_PRICE}"></c:set>
          <c:set var="processPrice" value="${requestScope.PROCESS_PRICE}"></c:set>
          <c:set var="cage" value="${requestScope.CAGE_DTO}"></c:set>
               <nav>

                    <div class="logo-name"style="
                         display: block;">
                         <div class="logo-image">
                              <a href="HomePage.html"><img src="img/OIP.jpg" alt=""></a>
                              <span class="logo_name">${sessionScope.USER.getName()}</span>
                    </div>
                   <div class="menu-items">
                         <ul class="nav-links">
                              <!--                              <li ><a href="#">
                                                                      <i class="uil uil-estate"></i>
                                                                      <span class="link-name">Dahsboard</span>
                                                                 </a></li>-->
                              <li ><a href="MainController?btAction=Search">
                                        <i class="uil uil-bill"></i>
                                        <span class="link-name">Order</span>
                                   </a></li>
                              <li ><a href="MainController?btAction=Customers">
                                        <i class="uil uil-user"></i>
                                        <span class="link-name">Customers</span>
                                   </a></li>
                              <li ><a href="${productionList}">
                                        <i class="uil uil-clipboard-alt"></i>
                                        <span class="link-name">Production</span>
                                   </a></li>
                              <li ><a href="MainController?btAction=Production process">
                                        <i class="uil uil-chart-line"></i>
                                        <span class="link-name">Production process</span>
                                   </a></li>

                              <li ><a href="MainController?btAction=View All Material">
                                        <i class="uil uil-screw"></i>
                                        <span class="link-name">Material</span>
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
                                        
          <section class="dashboard">
               <!--Form CageID-->
               <div class="section">
                    <div class="info">
                         <img src="https://i.pinimg.com/736x/d3/69/81/d36981aa38aec939c776717d0660a0d6.jpg" alt="Cage Image">
                         <div class="info-details">
                              <div class="info-item">CageID: <span> ${cage.getCageID()}</span></div>
                              <div class="info-item">Name: <span>${cage.getName()}</span></div>
                              <div class="info-item">Price: <span>${cage.getPrice()}</span></div>
                              <div class="info-item">Origin: <span>${cage.getOrigin()}</span></div>
                              <div class="info-item">Description: <span>${cage.getDescription()}</span></div>
                              <div class="info-item">
                                   Material: <span> 
                                        <c:forEach var="dto" items="${ListMaterial}" varStatus="counter">
                                             <!--bo dau phay o cuoi-->
                                             <c:if test="${ListMaterial.size() != (counter.count )}">
                                             ${dto.getName()},                                                
                                             </c:if>
                                             <c:if test="${ListMaterial.size() == (counter.count)}">
                                             ${dto.getName()}                                                
                                             </c:if>
                                        </c:forEach>
                                   </span></br>
                                   <button class="toggle-button">
                                        <i class="fa fa-plus"></i>
                                   </button>
                              </div>
                              <div class="info-item">
                                   Step:</br>
                                   <button class="toggle-button1">
                                        <i class="fa fa-plus"></i>
                                   </button>
                              </div>
                         </div>
                    </div>
               </div>

               <div class="material_table" style="display: none;">
                    <div class="header-row">
                         <h1>Material</h1>
                         <form action="MainController">
                              <input type="hidden" name="txtCageID" value="${param.txtCageID}" />
                              <input type="hidden" name="txtCageName" value="${param.txtCageName}" />
                              <button type="submit" value="EditMaterial" name="btAction"><i
                                        class="fa fa-pencil-square"></i></button>
                         </form>
                    </div>
                    <!--Material table-->
                    <div class="table-container">
                         <table>
                              <thead>
                                   <tr>
                                        <th>No.</th>
                                        <th>Name</th>
                                        <th>Origin</th>
                                        <th>Price/Unit</th>
                                        <th>Unit</th>
                                   </tr>
                              </thead>
                              <tbody>
                                   <c:forEach var="dto" items="${ListMaterial}" varStatus="counter">
                                        <tr>
                                             <td>
                                                  ${counter.count}
                                             </td>

                                             <td>
                                                  ${dto.getName()} - ${dto.getQuantityNeed()}
                                             </td>

                                             <td>
                                                  ${dto.getOrigin()}
                                             </td>

                                             <td>
                                                  ${dto.getPrice()}
                                             </td>

                                             <td>
                                                  ${dto.getUnit()}
                                             </td>
                                        </tr>
                                   </c:forEach>
                              </tbody>
                         </table>
                    </div>
               </div>

               <div class="process_table" style="display: none;">
                    <div class="header-row">
                         <h1>Design Process</h1>
                         <form action="MainController">
                              <input type="hidden" name="txtCageID" value="${param.txtCageID}" />
                              <input type="hidden" name="txtCageName" value="${param.txtCageName}" />
                              <button type="submit" value="EditDesign" name="btAction"><i
                                        class="fa fa-pencil-square"></i></button>
                         </form>
                    </div>
                    <!--Design Process table-->
                    <div class="table-container1">
                         <table>
                              <thead>
                                   <tr>
                                        <th>No.</th>
                                        <th>Phrase</th>
                                        <th>Time Process</th>
                                        <th>Description</th>
                                        <th>Employee need</th>
                                   </tr>
                              </thead>

                              <tbody>
                                   <c:forEach var="dto" items="${Design}" varStatus="counter">
                                        <tr>
                                             <td>
                                                  ${counter.count}
                                             </td>

                                             <td>
                                                  ${dto.getPhrase()}
                                             </td>

                                             <td>
                                                  ${dto.getTimeProcess()}
                                             </td>

                                             <td>
                                                  ${dto.getDescription()}
                                             </td>

                                             <td>
                                                  ${dto.getNumberOfEmployee()}
                                             </td>
                                        </tr>
                                   </c:forEach>
                              </tbody>
                         </table>
                    </div>
               </div>
          </section>
          <script src="js/DarkMode.js"></script>
          <script src="js/ProductDetail.js"></script>
     </body>
</html>
