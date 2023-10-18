<%-- 
    Document   : Product
    Created on : Oct 10, 2023, 10:26:35 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">

          <!----======== CSS ======== -->
          <link rel="stylesheet" href="../css/admin.css">

          <!----===== Iconscout CSS =====--> 
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <!----======== CSS ======== -->
          <link rel="stylesheet" href="css/HomePage.css">

          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

          <title>Admin Dashboard Panel</title>
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

          <section class="dashboard">
               <div class="top">
                    <i class="uil uil-bars sidebar-toggle"></i>
                    <div class="search-box">
                         <i class="uil uil-search"></i>
                         <form action="MainController">
                              <input type="text" value="${param.txtSearchValue}" name="txtSearchValue"  placeholder="Search Cage here...">
                              <button class="add-btn" value="SearchCage" name="btAction">Search</button>
                         </form>
                    </div>
               </div>

               <div class="dash-content">
                    <div class="overview">
                         <div class="title">
                              <i class="uil uil-tachometer-fast-alt"></i>
                              <span class="text">Dashboard</span>
                         </div>
                    </div>

                    <div class="activity">
                         <div class="title">
                              <i class="uil uil-clock-three"></i>
                              <span class="text">Recent Order</span>
                         </div>

                         <c:set var="searchValue" value="${param.txtSearchValue}"></c:set>

                         <c:set var="result" value="${requestScope.SEARCH_CAGE_RESULT}"></c:set>
                         <c:if test="${not empty result}">
                              <div class="activity-data">
                                   <div class="data names">
                                        <span class="data-title">No</span>
                                   </div>
                                   <div class="data names">
                                        <span class="data-title">Cage ID</span>
                                   </div>
                                   <div class="data joined">
                                        <span class="data-title">Name</span>
                                   </div>
                                   <div class="data joined">
                                        <span class="data-title">Price</span>
                                   </div>
                                   <div class="data type">
                                        <span class="data-title">Origin</span>
                                   </div>
                                   <div class="data status">
                                        <span class="data-title">Description</span>
                                   </div>
                                   <div class="data status">
                                        <span class="data-title">View</span>
                                   </div>
                              </div>
                              <c:forEach var="dto" items="${result}" varStatus="counter">

                                   <form class="form-order" action="MainController" method="POST">
                                        <div class="activity-data">
                                             <div class="data names">
                                                  <span class="data-list">${counter.count}</span>
                                             </div>

                                             <div class="data names">
                                                  <span class="data-list">${dto.getCageID()}
                                                       <input type="hidden" name="txtCageID" 
                                                              value="${dto.getCageID()}"/></span>
                                             </div>

                                             <div class="data joined">
                                                  <span class="data-list">${dto.getName()}</span>
                                                  <input type="hidden" name="txtCageName" 
                                                              value="${dto.getName()}"/>
                                             </div>

                                             <div class="data joined">
                                                  <span class="data-list">${dto.getPrice()}</span>
                                                  <input type="hidden" name="txtPrice" 
                                                              value="${dto.getPrice()}"/>
                                             </div>

                                             <div class="data type">
                                                  <span class="data-list">${dto.getOrigin()}</span>
                                                  <input type="hidden" name="txtOrigin" 
                                                              value="${dto.getOrigin()}"/>
                                             </div>

                                             <div class="data email">
                                                  <span class="data-list">${dto.getDescription()}</span>
                                                  <input type="hidden" name="txtDescription" 
                                                              value="${dto.getDescription()}"/>
                                             </div>
                                             <div class="data status">
                                                  <button class="btn btn-md btn-primary" name = "btAction" type="submit" value = "DetailProduct">
                                                       Detail
                                                  </button>
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

          </section>
          <script src="../js/admin.js"></script>

     </body>
</html>   