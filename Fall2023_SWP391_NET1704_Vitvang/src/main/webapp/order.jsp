<%-- 
    Document   : order
    Created on : Sep 26, 2023, 10:08:32 AM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Coding By CodingNepal - codingnepalweb.com -->
<html lang="en">
     <head>
          <meta charset="UTF-8">
          <meta http-equiv="X-UA-Compatible" content="IE=edge">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">

          <!----======== CSS ======== -->
          <link rel="stylesheet" href="css\admin.css">

          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

          <title>Admin Dashboard Panel</title>
     </head>
     <body>
          <nav>
               <div class="logo-name">
                    <div class="logo-image">
                         <img src="images/logo.png" alt="">
                    </div>

                    <span class="logo_name">Manager</span>
               </div>

               <div class="menu-items">
                    <ul class="nav-links">
                         <li><a href="admin.html">
                                   <i class="uil uil-estate"></i>
                                   <span class="link-name">Dahsboard</span>
                              </a></li>
                         <li><a href="order.jsp"">
                                   <i class="uil uil-bill"></i>
                                   <form action="MainController">            
                                        <input class="link-name" type="submit" value="Order" name="btAction" />
                                        <!--<span class="link-name">Order</span>-->
                                   </form>
                              </a></li>
                         <li><a href="#">

                                   <span class="link-name"></span>
                              </a></li>
                         <li><a href="#">

                                   <span class="link-name"></span>
                              </a></li>
                         <li><a href="#">

                                   <span class="link-name"></span>
                              </a></li>
                         <li><a href="#">

                                   <span class="link-name"></span>
                              </a></li>
                    </ul>

                    <ul class="logout-mode">
                         <li><a href="index.html">
                                   <i class="uil uil-signout"></i>
                                   <span class="link-name" >Logout</span>
                              </a></li>

                         <!--                <li class="mode">
                                             <a href="#">
                                                 <i class="uil uil-moon"></i>
                                             <span class="link-name">Dark Mode</span>
                                         </a>
                         
                                         <div class="mode-toggle">
                                           <span class="switch"></span>
                                         </div>
                                     </li>-->
                    </ul>
               </div>
          </nav>

          <section class="dashboard">
               <div class="top">
                    <i class="uil uil-bars sidebar-toggle"></i>
                    <div class="search-box">
                         <i class="uil uil-search"></i>
                         <form action="MainController">
                              <input type="text" name="txtSearchValue" placeholder="Search here...">
                              <button class="add-btn" value="Search" name="btAction">Search</button>
                         </form>
                    </div>



                    <!--<img src="images/profile.jpg" alt="">-->
               </div>

               <div class="dash-content">
                    <div class="overview">
                         <div class="title">
                              <i class="uil uil-tachometer-fast-alt"></i>
                              <span class="text">Dashboard</span>
                         </div>

                         <div class="boxes">
                              <div class="box box1">
                                   <i class="uil uil-invoice"></i>
                                   <span class="text">Total Orders</span>
                                   <span class="number">4000</span>
                              </div>
                              <div class="box box2">
                                   <i class="uil uil-analysis"></i>
                                   <span class="text">In progressing</span>
                                   <span class="number">3000</span>
                              </div>
                              <div class="box box3">
                                   <i class="uil uil-truck-loading"></i>
                                   <span class="text">Shipping</span>
                                   <span class="number">300</span>
                              </div>
                         </div>
                    </div>

                    <!--                    <div class="activity">
                                             <div class="title">
                                                  <i class="uil uil-clock-three"></i>
                                                  <span class="text">Recent Order</span>
                                             </div>
                    
                                             <div class="activity-data">
                                                  <div class="data names">
                                                       <span class="data-title">OrderID</span>
                                                       <span class="data-list" >O001</span>
                                                       <span class="data-list">O002</span>
                                                       <span class="data-list">o003</span>
                                                       <span class="data-list">0004</span>
                                                       <span class="data-list">0005</span>
                                                       <span class="data-list">0006</span>
                                                       <span class="data-list">0007</span>
                                                  </div>
                                                  <div class="data email">
                                                       <span class="data-title">CustomerID</span>
                                                       <span class="data-list">aba</span>
                                                       <span class="data-list">aba</span>
                                                       <span class="data-list">aba</span>
                                                       <span class="data-list">aba</span>
                                                       <span class="data-list">aba</span>
                                                       <span class="data-list">aba</span>
                                                       <span class="data-list">aba</span>
                                                  </div>
                                                  <div class="data joined">
                                                       <span class="data-title">StartDate</span>
                                                       <span class="data-list">2023-02-12</span>
                                                       <span class="data-list">2023-02-12</span>
                                                       <span class="data-list">2023-02-13</span>
                                                       <span class="data-list">2023-02-13</span>
                                                       <span class="data-list">2023-02-14</span>
                                                       <span class="data-list">2023-02-14</span>
                                                       <span class="data-list">2023-02-15</span>
                                                  </div>
                                                  <div class="data joined">
                                                       <span class="data-title">EndDate</span>
                                                       <span class="data-list">2023-02-12</span>
                                                       <span class="data-list">2023-02-12</span>
                                                       <span class="data-list">2023-02-13</span>
                                                       <span class="data-list">2023-02-13</span>
                                                       <span class="data-list">2023-02-14</span>
                                                       <span class="data-list">2023-02-14</span>
                                                       <span class="data-list">2023-02-15</span>
                                                  </div>
                                                  <div class="data type">
                                                       <span class="data-title">CageID</span>
                                                       <span class="data-list">1</span>
                                                       <span class="data-list">2</span>
                                                       <span class="data-list">3</span>
                                                       <span class="data-list">5</span>
                                                       <span class="data-list">3</span>
                                                       <span class="data-list">3</span>
                                                       <span class="data-list">1,</span>
                                                  </div>
                                                  <div class="data status">
                                                       <span class="data-title">Status</span>
                                                       <span class="data-list">Moving</span>
                                                       <span class="data-list">Moving</span>
                                                       <span class="data-list">Moving</span>
                                                       <span class="data-list">Moving</span>
                                                       <span class="data-list">Moving</span>
                                                       <span class="data-list">Moving</span>
                                                       <span class="data-list">Moving</span>
                                                  </div>
                                             </div>
                                        </div>-->

                    <div class="activity">
                         <div class="title">
                              <i class="uil uil-clock-three"></i>
                              <span class="text">Recent Order</span>
                         </div>
                         <c:set var="searchValue" value="${param.txtSearchValue}"></c:set>

                         <%--<c:if test="${not empty searchValue}">--%>
                         <c:set var="result" value="${requestScope.SEARCH_RESULT}"></c:set>
                         <c:if test="${not empty result}">
                              <div class="activity-data">
                                   <div class="data names">
                                        <span class="data-title">No</span>
                                   </div>
                                   <div class="data names">
                                        <span class="data-title">OrderID</span>
                                   </div>
                                   <div class="data email">
                                        <span class="data-title">CustomerID</span>
                                   </div>
                                   <div class="data joined">
                                        <span class="data-title">StartDate</span>
                                   </div>
                                   <div class="data joined">
                                        <span class="data-title">EndDate</span>
                                   </div>
                                   <div class="data type">
                                        <span class="data-title">CageID</span>
                                   </div>
                                   <div class="data status">
                                        <span class="data-title">Status</span>
                                   </div>
                              </div>
                              <c:forEach var="dto" items="${result}" varStatus="counter">

                                   <form class="form-order" action="MainController" method="POST">
                                        <div class="activity-data">
                                             <div class="data names">
                                                  <span class="data-list">${counter.count}</span>
                                             </div>

                                             <div class="data names">
                                                  <span class="data-list">${dto.getOrderID()}
                                                       <input type="hidden" name="txtOrderID" 
                                                              value="${dto.getOrderID()}"/></span>
                                             </div>

                                             <div class="data email">
                                                  <span class="data-list">${dto.getCustomerID()}</span>
                                             </div>

                                             <div class="data joined">
                                                  <span class="data-list">${dto.getStartDate()}</span>
                                             </div>

                                             <div class="data joined">
                                                  <span class="data-list">${dto.getEndDate()}</span>
                                             </div>

                                             <div class="data type">
                                                  <span class="data-list">${dto.getTotalPrice()}</span>
                                             </div>

                                             <div class="data status">
                                                  <span class="data-list">${dto.getStatusProgress()}</span>
                                             </div>
                                        </div>
                                   </form>

                              </c:forEach>
                         </c:if>

                         <c:if test="${ empty result}">
                              <font color="green">
                              <h2>
                                   No match record!!!
                              </h2>
                              </font>
                         </c:if>
                    </div>
                    <%--</c:if>--%>
          </section>
          <script src="admin.js"></script>
     </body>
</html>