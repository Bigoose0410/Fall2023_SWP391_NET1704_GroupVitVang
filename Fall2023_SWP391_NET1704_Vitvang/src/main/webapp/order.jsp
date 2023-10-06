<%-- 
    Document   : order
    Created on : Sep 26, 2023, 10:08:32 AM
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
          <link rel="stylesheet" href="css\admin.css">

          <!----===== Iconscout CSS =====--> 
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <!----======== CSS ======== -->
          <link rel="stylesheet" href="css/homePage.css">

          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

          <title>Admin Dashboard Panel</title>
     </head>
     <body>
          <c:url var="logout_query" value="MainController">
               <c:param name="cookiekey" value="${sessionScope.USER.getName()}"/>
               <c:param value="Log Out" name="btAction"/>
          </c:url>
          <c:set var="totalOrder" value="${requestScope.TOTAL_ORDER}"></c:set>
          <c:set var="NumInProcess" value="${requestScope.PROCESS_ORDER}"></c:set>
          <c:set var="NumNewOrder" value="${requestScope.NEW_ORDER}"></c:set>

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
                                   <i class="uil uil-bill"></i>>
                                   <span class="link-name">Order</span>
                              </a></li>
                         <li><a href="#">
                                   <i class="uil uil-grin"></i>
                                   <span class="link-name">Customers</span>
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
                              <input type="text" value="${param.txtSearchValue}" name="txtSearchValue" required="" placeholder="Search here...">
                              <button class="add-btn" value="Search" name="btAction">Search</button>
                         </form>
                    </div>
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
                                   <span class="number">${totalOrder}</span>
                              </div>
                              <div class="box box2">
                                   <i class="uil uil-analysis"></i>
                                   <span class="text">In progressing</span>
                                   <span class="number">${NumInProcess}</span>
                              </div>
                              <div class="box box3">
                                   <i class="uil uil-truck-loading"></i>
                                   <span class="text">New Order</span>
                                   <span class="number">${NumNewOrder}</span>
                              </div>
                         </div>
                    </div>

                    <div class="activity">
                         <div class="title">
                              <i class="uil uil-clock-three"></i>
                              <span class="text">Recent Order</span>
                         </div>

                         <c:set var="searchValue" value="${param.txtSearchValue}"></c:set>

                         <c:set var="result" value="${requestScope.SEARCH_RESULT}"></c:set>
                         <c:if test="${empty searchValue}">
                              <c:if test="${not empty result}">
                                   <div class="activity-data">
                                        <div class="data names">
                                             <span class="data-title">No</span>
                                        </div>
                                        <div class="data names">
                                             <span class="data-title">OrderID</span>
                                        </div>
                                        <!--                                        <div class="data email">
                                                                                     <span class="data-title">CustomerID</span>
                                                                                </div>-->
                                        <div class="data joined">
                                             <span class="data-title">StartDate</span>
                                        </div>
                                        <div class="data joined">
                                             <span class="data-title">EndDate</span>
                                        </div>
                                        <div class="data type">
                                             <span class="data-title">Total Price</span>
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

                                                  <div class="data joined">
                                                       <span class="data-list">${dto.getStartDate()}</span>
                                                  </div>

                                                  <div class="data joined">
                                                       <span class="data-list">${dto.getEndDate()}</span>
                                                  </div>

                                                  <div class="data type">
                                                       <span class="data-list">${dto.getTotalPrice()}</span>
                                                  </div>

                                                  <div class="data email">
                                                       <span class="data-list">${dto.getAddress()}</span>
                                                  </div>

                                                  <div class="data status">
                                                       <span class="data-list">${dto.getStatusProgress()}</span>
                                                  </div>
                                             </div>
                                        </form>

                                   </c:forEach>
                              </c:if>
                         </c:if>

                         <c:if test="${not empty searchValue}">
                              <c:if test="${not empty result}">
                                   <div class="activity-data">
                                        <div class="data names">
                                             <span class="data-title">No</span>
                                        </div>
                                        <div class="data names">
                                             <span class="data-title">OrderID</span>
                                        </div>
                                        <div class="data joined">
                                             <span class="data-title">StartDate</span>
                                        </div>
                                        <div class="data joined">
                                             <span class="data-title">EndDate</span>
                                        </div>
                                        <div class="data type">
                                             <span class="data-title">Total Price</span>
                                        </div>
                                        <div class="data email">
                                             <span class="data-title">Address</span>
                                        </div>
                                        <div class="data status">
                                             <span class="data-title">Status</span>
                                        </div>
                                        <div class="data status">
                                             <span class="data-title">Edit</span>
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

                                                  <div class="data joined">
                                                       <span class="data-list">${dto.getStartDate()}</span>
                                                  </div>

                                                  <div class="data joined">
                                                       <span class="data-list">${dto.getEndDate()}</span>
                                                  </div>

                                                  <div class="data type">
                                                       <span class="data-list">${dto.getTotalPrice()}</span>
                                                  </div>

                                                  <div class="data email">
                                                       <span class="data-list">${dto.getAddress()}</span>
                                                  </div>

                                                  <div class="data status">
                                                       <span class="data-list">${dto.getStatusProgress()}</span>
                                                  </div>
                                                  <div class="data status">
                                                       <c:url value="EditOrder.jsp" var="editLink">
                                                            <c:param name="txtOrderID" value="${dto.getOrderID()}"/>
                                                            <c:param name="txtStartDate" value="${dto.getStartDate()}" />
                                                            <c:param name="txtEndDate" value="${dto.getEndDate()}" />
                                                            <c:param name="txtAddress" value="${dto.getAddress()}" />
                                                            <c:param name="txtStatusProgress" value="${dto.getStatusProgress()}"/>
                                                            <c:param name="lastSearchValue" value="${searchValue}"/>
                                                       </c:url>
                                                       <span class="data-list"><a href="${editLink}">Edit</a></span>
                                                  </div>
                                                  <input type="submit" value="Detail" name="btAction" />
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
                         </c:if>
                         <form action="MainController">
                              <input type="submit" name="btAction" value="New Order" />
                         </form>
                    </div>

          </section>
          <script src="admin.js"></script>

     </body>
</html>