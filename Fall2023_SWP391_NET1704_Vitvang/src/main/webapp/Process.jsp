<%-- 
    Document   : processs
    Created on : Oct 7, 2023, 11:32:39 AM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

     <head>
          <meta charset="UTF-8">
          <meta http-equiv="X-UA-Compatible" content="IE=edge">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">

          <!----======== CSS ======== -->
          <link rel="stylesheet" href="css/ProductPocess.css">
          <!--<link rel="stylesheet" href="css/Productprocess.css.css">-->

          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
          <!--<script src="index.js"></script>-->

          <title>Production Process</title>
     </head>

     <body>
          <c:url var="logout_query" value="MainController">
               <c:param name="cookiekey" value="${sessionScope.USER.getName()}"/>
               <c:param value="Log Out" name="btAction"/>
          </c:url>
          <c:url var="productionList" value="MainController">
               <c:param value="SearchCage" name="btAction"/>
          </c:url>
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
               <div class="header">
                    <div class="search">
                         <input type="text" placeholder="Customer...">
                         <button type="button">Search</button>
                    </div>
               </div>
               <div class="neworder_table">
                    <!--Material table-->
                    <h1>New Order</h1>
                    <div class="table-container">
                         <table>
                              <thead>
                                   <tr>
                                        <th>No.</th>
                                        <th>CustomerID</th>
                                        <th>OrderID</th>
                                        <th>CageID</th>
                                        <th>StartDate</th>
                                        <th>Quantity</th>
                                        <th>Status</th>
                                        <th>Add Process</th>
                                   </tr>
                              </thead>

                              <tbody>
                              <form id="addForm" action="MainController">
                                   <c:forEach var="dto" items="${ListMaterial}" varStatus="counter">
                                        <tr>
                                             <td>${counter.count}</td>

                                             <td>${dto.getUserID()}</td>

                                             <td>${dto.getOrderID()}</td>

                                             <td>${dto.getCageID()}</td>

                                             <td>${dto.getStartDate()}</td>

                                             <td>${dto.getQuantity()}</td>

                                             <td>${dto.getOrderDetailStatus()}</td>

                                             <td class="add_button">
                                                  <button type="button" class="add-btn" onclick="confirmAdd()"><i class="fa fa-cog"></i></button>
                                             </td>
                                        </tr>
                                   </c:forEach>
                              </form>
                              </tbody>
                         </table>
                    </div>
               </div>

               <div class="processing_table">
                    <h1>Process</h1>
                    <!--Design Processing table-->
                    <div class="table-container1">
                         <table>
                              <thead>
                                   <tr>
                                        <th>No.</th>
                                        <th>CustomerID</th>
                                        <th>OrderID</th>
                                        <th>CageID</th>
                                        <th>StartDate</th>
                                        <th>Quantity</th>
                                        <th>Status</th>
                                        <th>View Detail</th>
                                   </tr>
                              </thead>

                              <tbody>
                                   <c:forEach var="dto" items="${Design}" varStatus="counter">
                                        <tr>
                                             <td>${counter.count}</td>

                                             <td>${dto.getUserID()}</td>

                                             <td>${dto.getOrderID()}</td>

                                             <td>${dto.getCageID()}</td>

                                             <td>${dto.getStartDate()}</td>

                                             <td>${dto.getQuantity()}</td>

                                             <td>${dto.getOrderDetailStatus()}</td>

                                             <td class="view_button">
                                                  <a href="ProcessDetail1.html"><button type="submit" value="" name="btAction"><i class="fa fa-eye"></i></button></a>
                                             </td>
                                        </tr>
                                   </c:forEach>
                              </tbody>
                         </table>
                    </div>
               </div>
          </section>

          <script src="js/ProductProcess.js"></script>
     </body>
</html>