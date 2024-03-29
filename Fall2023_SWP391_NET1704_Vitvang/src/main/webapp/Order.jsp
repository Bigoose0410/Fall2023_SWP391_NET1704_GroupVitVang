<%-- 
    Document   : order
    Created on : Sep 26, 2023, 10:08:32 AM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
          <style>
               .nav-links li{
                    padding: 20px 0;
               }
               .nav-links {
                    flex: 2 4 auto; /* chiếm khoảng trống còn lại */
                    display: flex;
                    flex-direction: column;
                    /*justify-content: space-between;*/
               }
               .menu-items li a .link-name{
                    font-size: 18px;
                    font-weight: 400;
                    color: black;
                    transition: var(--tran-05);
               }
               nav .logo-image img {
                    width: 40px;
                    object-fit: cover;
                    border-radius: 50%;
                    margin-left: 35%;
               }
               nav .logo-image {
                    display: flex;
                    flex-direction: column;
                    justify-content: center;
                    min-width: 45px;
               }
               nav .logo-name .logo_name {
                    font-size: 25px;
                    font-weight: 600;
                    /* color: var(--text-color); */
                    /* margin-right: 30px; */
                    background-color: transparent;
                    border: none;
                    transition: var(--tran-05);
                    justify-content: center;
                    padding-left: 20px;
               }
               .menu-items .logout-mode{
                    padding-bottom: 100px;
                    border-top: 1px solid var(--border-color);
               }
               nav{
                    background-color: var(--box1-color);
               }
          </style>
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
                              <a href="HomePage.html"><img src="img/staff.png" alt=""></a>
                              <span class="logo_name">${sessionScope.USER.getName()}</span>
                    </div>
                    <div class="menu-items">
                         <ul class="nav-links">
                              <li><a href="MainController?btAction=Search">
                                        <i class="uil uil-bill"></i>
                                        <span class="link-name">Order</span>
                                   </a></li>
                              <li><a href="MainController?btAction=Customers">
                                        <i class="uil uil-user"></i>
                                        <span class="link-name">Customers</span>
                                   </a></li>
                              <li><a href="${productionList}">
                                        <i class="uil uil-clipboard-alt"></i>
                                        <span class="link-name">Production</span>
                                   </a></li>
                              <li><a href="MainController?btAction=Production process">
                                        <i class="uil uil-chart-line"></i>
                                        <span class="link-name">Production process</span>
                                   </a></li>

                              <li><a href="MainController?btAction=View All Material">
                                        <i class="uil uil-screw"></i>
                                        <span class="link-name">Material</span>
                                   </a></li>

                         </ul>
                         <ul class="logout-mode">
                              <li><a href="${logout_query}">
                                        <i class="uil uil-signout"></i>
                                        <span class="link-name" >Logout</span>
                                   </a></li>
                         </ul>
                    </div>

          </nav>

          <section class="dashboard">
               <div class="top">
                    <i class="uil uil-bars sidebar-toggle"></i>
                    <div class="search-box">
                        <form action="MainController" method="POST"> 

                              <input type="text" value="${param.txtSearchValue}" name="txtSearchValue" placeholder="Search here..." class="searchh" >
                              <button value="Search" name="btAction"><i class="uil uil-search"></i></button>
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
               </div>          
               <div class="activity">
                    <div class="title">
                         <!--<div style="width: 30%" >--> 
                         <i class="uil uil-clock-three"> </i>
                         <span class="text">Recent Order</span> 

                         <form action="MainController" method="POST">
                              <button type="submit" id="btn" value="New Order" name="btAction" class="button-icon" style="
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
                         </form>
                    </div>
               </div>


               <c:set var="searchValue" value="${param.txtSearchValue}"></c:set>

               <c:set var="result" value="${requestScope.SEARCH_RESULT}"></c:set>
               <%--<c:if test="${empty searchValue}">--%>
               <c:if test="${not empty result}">

                    <table style="width:100%">
                         <thead>
                              <tr>

                                   <th class="data-title" style="text-align: start ;color:blue;font-size:23px">No</th>


                                   <th class="data-title" style="text-align: start ;color:blue;font-size:23px">
                                        OrderID</span> </th>

                                   <!--                                        <div class="data email">
                                                                          <span class="data-title">CustomerID</span>
                                                                     </div>-->

                                   <th class="data-title" style="text-align: start ;color:blue;font-size:23px">
                                        Order Date
                                   </th>
                                   <!--<th class="data-title" style="text-align: start ;color:blue;font-size:23px">EndDate</th>-->
                                   <th class="data-title" style="text-align: start ;color:blue;font-size:23px">Total
                                        Price
                                   </th>
                                   <th class="data-title" style="text-align: start ;color:blue;font-size:23px">City
                                   </th>
                                   <th class="data-title" style="text-align: start ;color:blue;font-size:23px">Status
                                   </th>
                                   <th class="data-title" style="text-align: start ;color:blue;font-size:23px">Details
                                   </th>


                              </tr>
                         </thead>
                         <tbody>

                              <c:forEach var="dto" items="${result}" varStatus="counter">

                              <form class="form-order" action="MainController" method="POST">
                                   <div class="activity-data">
                                        <tr>
                                             <td class="data-list" style="text-align: start;font-size:18px; ">
                                                  ${counter.count}</td>

                                             <td class="data-list" style="text-align: start;font-size:18px">
                                                  ${dto.getOrderID()}
                                                  <input type="hidden" name="txtOrderID"
                                                         value="${dto.getOrderID()}" />
                                             </td>


                                             <td class="data-list" style="text-align: start ;font-size:18px">
                                                  ${dto.getStartDate()}</td>



                                                <!--<td class="data-list" style="text-align: start ;font-size:18px">${dto.getEndDate()}</td>-->



                                             <td class="data-list" style="text-align: start ;font-size:18px">
                                                  <fmt:formatNumber value="${dto.getTotalPrice()}" type="number" pattern="#,##0" /> ₫
                                             </td>


                                             <td class="data-list" style="text-align: start ;font-size:18px">
                                                  ${dto.getAddress()}</td>



                                             <td class="data-list" style="text-align: start">
                                                  ${dto.getStatusProgress()}
                                             </td>

                                        <div class="data status">
                                             <c:url value="EditOrder.jsp" var="editLink">
                                                  <c:param name="txtOrderID" value="${dto.getOrderID()}" />
                                                  <c:param name="txtStartDate" value="${dto.getStartDate()}" />
                                                  <c:param name="txtEndDate" value="${dto.getEndDate()}" />
                                                  <c:param name="txtAddress" value="${dto.getAddress()}" />
                                                  <c:param name="txtStatusProgress"
                                                           value="${dto.getStatusProgress()}" />
                                                  <c:param name="lastSearchValue" value="${searchValue}" />
                                             </c:url>
                                        </div>
                                        <!--<input type="submit" value="Detail" name="btAction" />-->
                                        <td class="data-list" style="text-align: start ">

                                             <button value="Detail" name="btAction"
                                                     style="font-size:20px; outline: none;background-color: transparent; border:none;margin-left: 30px"
                                                     d q />
                                             <i class="uil uil-file-info-alt"></i>
                                             <p class="data-list"><a href="${editLink}"></p>
                                        </td>


                                        </tr>
                                   </div>
                              </form>

                         </c:forEach>

                         </tbody>
                    </table>
               </div>


               <div class="pagination_container">
                    <div class="pagination">
                         <div class="pagination__option" style="text-align: end">
                              <c:if test="${requestScope.indexCurrent > 1}">
                                   <a class="page" href="MainController?btAction=Search&txtSearchValue=${searchValue}&page=1">First</a>
                                   <a class="page" href="MainController?btAction=Search&txtSearchValue=${searchValue}&page=${requestScope.indexCurrent-1}">
                                        <i class="fa fa-angle-left"></i>
                                   </a>
                              </c:if>

                              <c:forEach begin="${requestScope.START}" end="${requestScope.END}" var="i">
                                   <c:set var="activeClass" value="${requestScope.indexCurrent==i ? 'active' : ''}" />
                                   <a class="page ${activeClass}" href="MainController?txtSearchValue=${searchValue}&btAction=Search&page=${i}">${i}</a>
                              </c:forEach>

                              <c:if test="${requestScope.indexCurrent<requestScope.endPage}">
                                   <a class="page" href="MainController?btAction=Search&txtSearchValue=${searchValue}&page=${requestScope.indexCurrent+1}">
                                        <i class="fa fa-angle-right"></i>
                                   </a>
                                   <a class="page" href="MainController?btAction=Search&&txtSearchValue=${searchValue}&page=${requestScope.endPage}">End</a>
                              </c:if>
                         </div>
                    </div>
               </div>
          </c:if>

          <c:if test="${ empty result}">
               <font color="red">
               <h2>
                    No match record!!!
               </h2>
               </font>
          </c:if>
     </section>
     <script src="js/darkMode.js"></script>      
     <script src="js/OrderAdd.js"></script>      

</body>
</html> 
