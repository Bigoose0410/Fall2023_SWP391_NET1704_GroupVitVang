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
          <meta name="viewport" content=" initial-scale=1.0">
          <!--======== CSS ======== -->

          <!----===== Iconscout CSS =====--> 
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <!----======== CSS ======== -->
          <link rel="stylesheet" href="css/HomePage.css">
          <!--<link rel="stylesheet" href="css/Admin.css">-->

          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <link href="../java/bootstrap-5.3.2-dist/css/bootstrap-grid.min.css" rel="stylesheet" type="text/css"/>
          
          <title>Order</title>
     </head>   
     <body>
          <c:url var="logout_query" value="MainController">
               <c:param name="cookiekey" value="${sessionScope.USER.getName()}"/>
               <c:param value="Log Out" name="btAction"/>
          </c:url>
          <c:url var="productionList" value="MainController">
               <c:param value="SearchCage" name="btAction"/>
          </c:url>
          <c:set var="totalOrder" value="${requestScope.TOTAL_ORDER}"></c:set>
          <c:set var="NumInProcess" value="${requestScope.PROCESS_ORDER}"></c:set>
          <c:set var="NumNewOrder" value="${requestScope.NEW_ORDER}"></c:set>

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
               <div class="top">
                    <i class="uil uil-bars sidebar-toggle"></i>
                    <div class="search-box">
                         <i class="uil uil-search"></i>
                         <form action="MainController">

                              <input type="text" value="${param.txtSearchValue}" name="txtSearchValue" required="" placeholder="Search here..." class="searchh" >



                              <button class="add-btn" value="Search" name="btAction"></button>
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
                              <!--<div style="width: 30%" >--> 
                              <i class="uil uil-clock-three"> </i>
                              <span class="text">Recent Order</span> 

                              <a href="OrderAdd.jsp">     <button type="submit" id="btn" onclick="document.loccation = 'OrderAdd.jsp'" name="btAction" class="button-icon" style="
                                                                  background-color: #e6e5e500;
                                                                  color: blue;
                                                                  font-size: 16px;
                                                                  padding: 8px;
                                                                  border: none;
                                                                  cursor: pointer;
                                                                  outline: none;
                                                                  font-size:30px;
                                                                  margin-top:-100px;
                                                                  margin-left: 1000px;

                                                                  ">
                                        <i class="uil uil-plus"></i>
                                   </button>   
                              </a>
                         </div>
                         <div> 
                         </div>


                         <c:set var="searchValue" value="${param.txtSearchValue}"></c:set>

                         <c:set var="result" value="${requestScope.SEARCH_RESULT}"></c:set>
                         <c:if test="${empty searchValue}">
                              <c:if test="${not empty result}">
                                   <table style="width:100%">
                                        <thead>
                                             <tr>

                                                  <th class="data-title" style="text-align: start ;color:blue;font-size:23px">No</th>


                                                  <th class="data-title" style="text-align: start ;color:blue;font-size:23px">OrderID</span> </th>

                                                  <!--                                        <div class="data email">
                                                                                               <span class="data-title">CustomerID</span>
                                                                                          </div>-->

                                                  <th    class="data-title" style="text-align: start ;color:blue;font-size:23px">StartDate </th>
                                                  <th class="data-title" style="text-align: start ;color:blue;font-size:23px">EndDate</th>
                                                  <th   class="data-title" style="text-align: start ;color:blue;font-size:23px">Total Price</th>
                                                  <th class="data-title" style="text-align: start ;color:blue;font-size:23px">City</th>
                                                  <th class="data-title" style="text-align: start ;color:blue;font-size:23px">Status </th>
                                                  <th class="data-title" style="text-align: start ;color:blue;font-size:23px"></th>


                                             </tr>
                                        </thead>
                                        <tbody>

                                             <c:forEach var="dto" items="${result}" varStatus="counter">

                                             <form class="form-order" action="MainController" method="get">
                                                  <div class="activity-data">
                                                       <tr>
                                                            <td class="data-list" style="text-align: start;font-size:18px">${counter.count}</td>

                                                            <td class="data-list" style="text-align: start;font-size:18px">${dto.getOrderID()}
                                                                 <input type="hidden" name="txtOrderID" 
                                                                        value="${dto.getOrderID()}"/></td>


                                                            <td class="data-list" style="text-align: start ;font-size:18px">${dto.getStartDate()}</td>



                                                            <td class="data-list" style="text-align: start ;font-size:18px">${dto.getEndDate()}</td>



                                                            <td class="data-list" style="text-align: start ;font-size:18px">${dto.getTotalPrice()}</td>



                                                            <td class="data-list" style="text-align: start ;font-size:18px">${dto.getAddress()}</td>



                                                            <td class="data-list" style="text-align: start">${dto.getStatusProgress()}</td>

                                                       <div class="data status">
                                                            <c:url value="EditOrder.jsp" var="editLink">
                                                                 <c:param name="txtOrderID" value="${dto.getOrderID()}"/>
                                                                 <c:param name="txtStartDate" value="${dto.getStartDate()}" />
                                                                 <c:param name="txtEndDate" value="${dto.getEndDate()}" />
                                                                 <c:param name="txtAddress" value="${dto.getAddress()}" />
                                                                 <c:param name="txtStatusProgress" value="${dto.getStatusProgress()}"/>
                                                                 <c:param name="lastSearchValue" value="${searchValue}"/>
                                                            </c:url>
                                                       </div>
                                                       <!--<input type="submit" value="Detail" name="btAction" />-->
                                                       <td class="data-list" style="text-align: start">
                                                            <input type="submit" value="Detail" name="btAction" />
                                                            <span class="data-list"><a href="${editLink}">Edit</a></span>
                                                       </td>

                                                  </div>
                                                  </tr>
                                                  </from>                                     

                                             </c:forEach>

                                             </tbody>
                                   </table>

                              </c:if>

                         </c:if>

                         <c:if test="${not empty searchValue}">
                              <c:if test="${not empty result}">
                                   <table style="width:100%">
                                        <thead>
                                             <tr>
                                        <div class="activity-data">

                                             <th class="data-title" style="text-align: start ;color:blue;font-size:23px">No</th>


                                             <th class="data-title" style="text-align: start ;color:blue;font-size:23px">OrderID</th>


                                             <th class="data-title" style="text-align: start ;color:blue;font-size:23px">StartDate</th>


                                             <th class="data-title" style="text-align: start ;color:blue;font-size:23px">EndDate</th>


                                             <th class="data-title" style="text-align: start ;color:blue;font-size:23px">Total Price</th>


                                             <th class="data-title" style="text-align: start ;color:blue;font-size:23px">Address</th>


                                             <th class="data-title" style="text-align: start ;color:blue;font-size:23px">Status</th>


                                             <th class="data-title" style="text-align: start ;color:blue;font-size:23px"></th>

                                             </<div>
                                                  </tr>
                                                  </thead>
                                                  <tbody>

                                                       <c:forEach var="dto" items="${result}" varStatus="counter">
                                                            <%--<c:if test="${dto.getStatusProgress().equals('new order')}">--%>
                                                       <div class="activity-data">
                                                            <form class="form-order" action="MainController" method="get">
                                                                 <tr>


                                                                      <td class="data-list" style="text-align: start;font-size:18px">${counter.count}</td>



                                                                      <td class="data-list" style="text-align: start;font-size:18px">${dto.getOrderID()}
                                                                           <input type="hidden" name="txtOrderID" 
                                                                                  value="${dto.getOrderID()}"/></td>



                                                                      <td class="data-list" style="text-align: start ;font-size:18px">${dto.getStartDate()}</td>



                                                                      <td class="data-list" style="text-align: start ;font-size:18px">${dto.getEndDate()}</td>



                                                                      <td class="data-list" style="text-align: start ;font-size:18px">${dto.getTotalPrice()}</td>



                                                                      <td class="data-list" style="text-align: start ;font-size:18px">${dto.getAddress()}</td>



                                                                      <td class="data-list" style="text-align: start">${dto.getStatusProgress()}</td>


                                                                 <div class="data status">
                                                                      <c:url value="EditOrder.jsp" var="editLink">
                                                                           <c:param name="txtOrderID" value="${dto.getOrderID()}"/>
                                                                           <c:param name="txtStartDate" value="${dto.getStartDate()}" />
                                                                           <c:param name="txtEndDate" value="${dto.getEndDate()}" />
                                                                           <c:param name="txtAddress" value="${dto.getAddress()}" />
                                                                           <c:param name="txtStatusProgress" value="${dto.getStatusProgress()}"/>
                                                                           <c:param name="lastSearchValue" value="${searchValue}"/>
                                                                      </c:url>
                                                                 </div>
                                                                 <!--<input type="submit" value="Detail" name="btAction" />-->
                                                                 <td class="data-list" style="text-align: start">
                                                                      <input type="submit" value="Detail" name="btAction" />
                                                                      <span class="data-list"><a href="${editLink}">Edit</a></span>
                                                                 </td>


                                                                 </tr>
                                                            </form>
                                                       </div>

                                                  </c:forEach>
                                                  </tbody>
                                                  </table>
                                             </c:if>
                                        </c:if>
                                        <c:if test="${ empty result}">
                                             <font color="red">
                                             <h2>
                                                  No match record!!!
                                             </h2>
                                             </font>
                                        </c:if>
                                        </section>
                                        <!--<script src="js/darkMode.js"></script>-->      
                                        <script src="js/OrderAdd.js"></script>      

                                        </body>
                                        </html>   