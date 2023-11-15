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

               <div class="neworder_table">
                    <!--Material table-->
                    <h1>New Production</h1>
                    <div class="table-container">
                         <c:set var="result" value="${requestScope.PROCESSNEWORDER_RESULT}"></c:set>
                         <c:set var="error" value="${requestScope.AUTO_ADD_ERR}"></c:set>
                         <c:if test="${not empty result}">
                              <table class="tablesorter-custom">
                                   <thead>
                                        <tr class="search1">
                                             <td></td>
                                             <td> <input type="search" data-column="1" placeholder="Customer Name"></td>
                                             <td> <input type="search" data-column="2" placeholder="OrderID"></td>
                                             <td></td>
                                             <td></td>
                                             <td></td>
                                        </tr>
                                        <tr>
                                             <th>No.</th>
                                             <th>Customer Name</th>
                                             <th>OrderID</th>
                                             <th>Cage Name</th>
                                             <th>Order Date</th>
                                             <th>Quantity</th>
                                             <th>Status</th>
                                             <th>Add Process</th>
                                        </tr>
                                   </thead>
                                   <c:set var="count" value="0" />
                                   <tbody>
                                        <c:forEach var="dto" items="${result}">
                                             <c:if test="${dto.getOrderDetailStatus().equals('new order')}">
                                                  <tr>
                                             <form action="MainController" method="GET">       
                                                  <td> 
                                                       <c:set var="count" value="${count + 1}" />
                                                       ${count}
                                                  </td>
                                                  <td>
                                                       <a href="MainController?btAction=Customers" style="text-decoration: none; color: black;">${dto.getUserID()}</a>
                                                  </td>
                                                  <td>
                                                       ${dto.getOrderID()}
                                                       <input type="hidden" name="txtOrderID" value="${dto.getOrderID()}" />
                                                  </td>
                                                  <td>
                                                       ${dto.getCageName()}
                                                       <input type="hidden" name="txtCageID" value="${dto.getCageID()}" />
                                                  </td>
                                                  <td>
                                                       ${dto.getStartDate()}
                                                       <input type="hidden" name="txtStartDate" value="${dto.getStartDate()}" />
                                                  </td>
                                                  <td>
                                                       ${dto.getQuantity()}
                                                       <input type="hidden" name="txtQuantity" value="${dto.getQuantity()}" />
                                                  </td>
                                                  <td>
                                                       ${dto.getOrderDetailStatus()}
                                                       <!--<input type="hidden" name="updateStatusNewOrder" value="${dto.getOrderDetailStatus()}" />-->
                                                  </td>
                                                  <td>
                                                       <a 
                                                            href="MainController?txtOrderID=${dto.getOrderID()}&txtCageID=${dto.getCageID()}&txtStartDate=${dto.getStartDate()}&txtQuantity=${dto.getQuantity()}&btAction=AddToProcess">
                                                            <i class="fa fa-cog"></i>
                                                       </a>
<!--                                                       <button class="fa fa-cog"  type="submit" value="AddToProcess" name="btAction">
                                                       </button>-->
                                                  </td>
                                                  <c:if test="${not empty error.getDesignListLength() and count == 1}">
                                                       <a href="MainController?txtCageID=${dto.getCageID()}&txtCageName=${dto.getCageName()}&btAction=EditDesign">
                                                            <font color="red">
                                                            ${error.getDesignListLength()}
                                                            </font>
                                                       </a>
                                                  </c:if>
                                             </form>
                                             </tr>
                                        </c:if>
                                   </c:forEach>
                                   </tbody>
                         </c:if>
                         <br>
                         <c:if test="${empty result}">
                              <font color="green">
                              <h2>
                                   Your Order is not in processing!!!
                              </h2>
                              </font>
                         </c:if>

                    </div>
               </div>

               <div class="processing_table">
                    <h1>In Production</h1>
                    <!--Design Processing table-->
                    <div class="table-container1">

                         <c:set var="result" value="${requestScope.PROCESSNEWORDER_RESULT}"></c:set>
                         <%--<c:if test="${empty searchValue}">--%>
                         <c:if test="${not empty result}">
                              <table class="tablesorter-custom">
                                   <thead>
                                        <tr class="search1">
                                             <td></td>
                                             <td> <input type="search" data-column="1" placeholder="Customer Name"></td>
                                             <td> <input type="search" data-column="2" placeholder="OrderID"></td>
                                             <td></td>
                                             <td></td>
                                             <td></td>
                                        </tr>
                                        <tr>
                                             <th>No.</th>
                                             <th>Customer Name</th>
                                             <th>OrderID</th>
                                             <th>Cage Name</th>
                                             <th>StartDate</th>
                                             <th>Quantity</th>
                                             <th>Status</th>
                                             <th>View Detail</th>
                                        </tr>
                                   </thead>
                                   <c:set var="count1" value="0" />
                                   <c:forEach var="dto" items="${result}">
                                        <c:if test="${dto.getOrderDetailStatus().equals('Processing')}">
                                             <tbody>
                                             <form action="MainController">         
                                                  <tr>
                                                       <td>
                                                            <c:set var="count1" value="${count1 + 1}" />
                                                            ${count1}
                                                       </td>
                                                       <td>
                                                            <a href="MainController?btAction=Customers" style="text-decoration: none; color: black;">${dto.getUserID()}</a>
                                                       </td>
                                                       <td>
                                                            ${dto.getOrderID()}
                                                            <input type="hidden" name="txtOrderID" value="${dto.getOrderID()}" />
                                                       </td>
                                                       <td>
                                                            ${dto.getCageName()}
                                                            <input type="hidden" name="txtCageID" value="${dto.getCageID()}" />
                                                       </td>
                                                       <td>
                                                            ${dto.getStartDate()}
                                                            <input type="hidden" name="txtStartDate" value="${dto.getStartDate()}" />
                                                       </td>
                                                       <td>
                                                            ${dto.getQuantity()}
                                                            <input type="hidden" name="txtQuantity" value="${dto.getQuantity()}" />
                                                       </td>
                                                       <td>
                                                            ${dto.getOrderDetailStatus()}
                                                            <input type="hidden" name="updateStatusNewOrder" value="${dto.getOrderDetailStatus()}" />
                                                       </td>
                                                       <td><button class="fa fa-cog"  type="submit" value="ViewProcessDetail" name="btAction"></button></td>
                                                       <!--<td><input type="submit" value="Process" name="btAction" /></td>-->
                                                  </tr>
                                             </form>
                                             </tbody>
                                        </c:if>
                                   </c:forEach>
                              </table>
                         </c:if>
                         <c:if test="${empty result}">
                              <font color="green">
                              <h2>
                                   Your Order is not in processing!!!
                              </h2>
                              </font>
                         </c:if>

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

                    </div>
               </div>
               <br/>
               <div class="processing_table">
                    <h1>Done</h1>
                    <!--Design Processing table-->
                    <div class="table-container1">

                         <c:set var="result" value="${requestScope.PROCESSNEWORDER_RESULT}"></c:set>
                         <%--<c:if test="${empty searchValue}">--%>
                         <c:if test="${not empty result}">
                              <table class="tablesorter-custom">
                                   <thead>
                                        <tr class="search1">
                                             <td></td>
                                             <td> <input type="search" data-column="1" placeholder="Customer Name"></td>
                                             <td> <input type="search" data-column="2" placeholder="OrderID"></td>
                                             <td></td>
                                             <td></td>
                                             <td></td>
                                        </tr>
                                        <tr>
                                             <th>No.</th>
                                             <th>Customer Name</th>
                                             <th>OrderID</th>
                                             <th>Cage Name</th>
                                             <th>StartDate</th>
                                             <th>Quantity</th>
                                             <th>Status</th>
                                             <th>View Detail</th>
                                        </tr>
                                   </thead>
                                   <c:set var="count1" value="0" />
                                   <c:forEach var="dto" items="${result}">
                                        <c:if test="${dto.getOrderDetailStatus().equals('Done')}">
                                             <tbody>
                                             <form action="MainController">         
                                                  <tr>
                                                       <td>
                                                            <c:set var="count1" value="${count1 + 1}" />
                                                            ${count1}
                                                       </td>
                                                       <td>
                                                            <a href="MainController?btAction=Customers" style="text-decoration: none; color: black;">${dto.getUserID()}</a>
                                                       </td>
                                                       <td>
                                                            ${dto.getOrderID()}
                                                            <input type="hidden" name="txtOrderID" value="${dto.getOrderID()}" />
                                                       </td>
                                                       <td>
                                                            ${dto.getCageName()}
                                                            <input type="hidden" name="txtCageID" value="${dto.getCageID()}" />
                                                       </td>
                                                       <td>
                                                            ${dto.getStartDate()}
                                                            <input type="hidden" name="txtStartDate" value="${dto.getStartDate()}" />
                                                       </td>
                                                       <td>
                                                            ${dto.getQuantity()}
                                                            <input type="hidden" name="txtQuantity" value="${dto.getQuantity()}" />
                                                       </td>
                                                       <td>
                                                            ${dto.getOrderDetailStatus()}
                                                            <input type="hidden" name="updateStatusNewOrder" value="${dto.getOrderDetailStatus()}" />
                                                       </td>
                                                       <td><button class="fa fa-cog"  type="submit" value="ViewProcessDetail" name="btAction"></button></td>
                                                       <!--<td><input type="submit" value="Process" name="btAction" /></td>-->
                                                  </tr>
                                             </form>
                                             </tbody>
                                        </c:if>
                                   </c:forEach>
                              </table>
                         </c:if>
                         <c:if test="${empty result}">
                              <font color="green">
                              <h2>
                                   Your Order is not in processing!!!
                              </h2>
                              </font>
                         </c:if>

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

                    </div>
               </div>
          </section>

          <script src="js/ProductProcess.js"></script>
     </body>
</html>
                                   
