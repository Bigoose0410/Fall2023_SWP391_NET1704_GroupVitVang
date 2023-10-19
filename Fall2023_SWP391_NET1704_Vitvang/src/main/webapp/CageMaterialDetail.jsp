<%-- 
    Document   : CageMaterialDetail
    Created on : Oct 5, 2023, 3:02:40 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" href="css/Material.css">

          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

          <title>BCPM</title>
     </head>
     <body>
          
          <!-- log out link -->
          <c:url var="logout_query" value="MainController">
               <c:param name="cookiekey" value="${sessionScope.USER.getName()}"/>
               <c:param value="Log Out" name="btAction"/>
          </c:url>
          <c:set var="ListMatarial" value="${requestScope.CAGE_MATERIAL}"></c:set>
          <c:set var="CageList" value="${requestScope.CAGE_ORDER}"></c:set>
          <c:set var="InAddOrder" value="${param.inAddOrder}"></c:set>
          
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
                              <li ><a href="MainController?btAction=Order">
                                        <i class="uil uil-bill"></i>
                                        <span class="link-name">Order</span>
                                   </a></li>
                              <li ><a href="MainController?btAction=Customers">
                                        <i class="uil uil-bill"></i>
                                        <span class="link-name">Customers</span>
                                   </a></li>
                              <li ><a href="${productionList}">
                                        <i class="uil uil-grin"></i>
                                        <span class="link-name">Production</span>
                                   </a></li>
                              <li ><a href="MainController?btAction=Production process">
                                        <i class="uil uil-chart-line"></i>
                                        <span class="link-name">Production process</span>
                                   </a></li>
                              <li > <a href="#">
                                        <i class="uil uil-clipboard-alt"></i>
                                        <span class="link-name">Reports</span>
                                   </a></li>
                              <li ><a href="#">
                                        <i class="uil uil-screw"></i>
                                        <span class="link-name">Material</span>
                                   </a></li>
                              <li > <a href="#">
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
               <section class="dashboard">
               <c:if test="${not empty CageList}">
                    <c:forEach items="${CageList}" var="cage">
                         <!--Form CageID-->
                         <h1> Cage</h1>
                         <table  class="tablesorter-custom">
                              <thead>
                                   <tr>
                                        <th>CageID</th>
                                        <th>Name</th>
                                        <th>Price</th>
                                        <th>Origin</th>
                                        <th>Description</th>
                                   </tr>
                              </thead>
                              <tbody>
                                   <tr>
                                        <td>
                                             ${cage.getCageID()}
                                        </td>
                                        <td>
                                             ${cage.getName()}
                                        </td>
                                        <td>
                                             ${cage.getPrice()}
                                        </td>
                                        <td>
                                             ${cage.getOrigin()}
                                        </td>
                                        <td>
                                             ${cage.getDescription()}
                                        </td>
                                   </tr>
                                   <tr>
                              <table class="tablesorter-custom">
                                   <!--Form Material-->
                                   <h1>Material</h1>
                                   <thead>
                                        <tr class="search">
                                             <td> <input type="search" data-column="0" placeholder="No."></td>
                                             <td> <input type="search" data-column="1" placeholder="CageID"></td>
                                             <td> <input type="search" data-column="2" placeholder="MaterialID"></td>
                                             <td> <input type="search" data-column="3" placeholder="Name"></td>
                                             <td> <input type="search" data-column="4" placeholder="Origin"></td>
                                             <td> <input type="search" data-column="5" placeholder="Need/Cage"></td>
                                             <td> <input type="search" data-column="6" placeholder="Price/Unit"></td>
                                             <td> <input type="search" data-column="7" placeholder="Quantity Order"></td>
                                             <td> <input type="search" data-column="8" placeholder="Total Quantity"></td>
                                             <td> <input type="search" data-column="9" placeholder="Total Price"></td>
                                        </tr>
                                        <tr>
                                             <th>No.</th>
                                             <th>Cage ID</th>
                                             <th>Material ID</th>
                                             <th>Name</th>
                                             <th>Origin</th>
                                             <th>Need/Cage</th>
                                             <th>Price/Unit</th>
                                             <th>Unit</th>
                                             <th>Quantity Order</th>
                                             <th>Total Quantity</th>
                                             <th>Total Price</th>
                                        </tr>
                                   </thead>
                                   <tbody>
                                        <c:forEach var="dto" items="${ListMatarial}" varStatus="counter">
                                             <tr>
                                                  <td>
                                                       ${counter.count}
                                                  </td>
                                                  <td>
                                                       ${dto.getCageID()}
                                                  </td>
                                                  <td>
                                                       ${dto.getMaterialID()}
                                                  </td>
                                                  <td>
                                                       ${dto.getName()}
                                                  </td>
                                                  <td>
                                                       ${dto.getOrigin()}
                                                  </td>
                                                  <td>
                                                       ${dto.getQuantityNeed()}
                                                  </td>
                                                  <td>
                                                       ${dto.getPrice()}
                                                  </td>
                                                  <td>
                                                       ${dto.getUnit()}
                                                  </td>
                                                  <td>
                                                       ${param.txtQuantity}
                                                  </td>
                                                  <td>
                                                       <c:set var="totalQuantity" 
                                                              value="${dto.getQuantityNeed() * dto.getQuantity() }"></c:set>
                                                       ${totalQuantity}
                                                  </td>
                                                  <td>
                                                       <c:set var="totalPrice" 
                                                              value="${dto.getPrice() * totalQuantity }"></c:set>
                                                       ${totalPrice}
                                                  </td>
                                             </tr>
                                        </c:forEach>
                                   </tbody>
                              </table>
                              </tr>
                              </tbody>
                         </table>
                    </c:forEach>
               </c:if> 
          </section>
               <div class="button-continue">
               <c:if test="${not empty InAddOrder}">
                    <form action="MainController">
                         <input type="hidden" name="txtOrderID" value="${param.txtOrderID}" />
                         <input type="hidden" name="txtCustomerID" value="${param.txtCustomerID}" />
                         <input type="hidden" name="txtEndDate" value="${param.txtEndDate}" />
                         <input type="hidden" name="txtAddress" value="${param.txtAddress}" />
                         <input type="hidden" name="txtCageID" value="${param.txtCageID}" />
                         <input type="hidden" name="txtQuantity" value="${param.txtQuantity}" />
                         <button type="submit" name="btAction" value="New Order">Continue Creat Order</button>
                    </form>
               </c:if>
          </div>
          <script src="js/Material.js"></script>
     </body>
</html>
