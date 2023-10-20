<%-- 
    Document   : searchCustomer
    Created on : Oct 3, 2023, 10:52:53 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" href="css/ProductPocess.css">
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
          <link rel="stylesheet" href="css/SearchCustomer.css">
          <title>Customer</title>
     </head>
     <body>
          <c:url var="logout_query" value="MainController">
               <c:param name="cookiekey" value="${sessionScope.USER.getName()}"/>
               <c:param value="Log Out" name="btAction"/>
          </c:url>
          <c:set var="searchValue" value="${param.txtSearchvalue}" />
          <c:set var="ShowForm" value="${requestScope.SHOW_CUS_CREATE_FORM}" />
          <c:set var="CustomerList" value="${requestScope.SEARCH_CUS_RESULT}"/>s

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

          <section class="dashboard1">
               <div id="processing-form">
                    <!--Processing-->
                    <h1>Customer Information</h1>

                    <form>
                         <%--<c:if test="${empty searchValue}">--%>
                         <c:if test="${not empty CustomerList}">
                              <table class="tablesorter-custom">
                                   <thead>
                                        <tr class="search1">
                                             <td></td>
                                             <td> <input type="search" data-column="1" placeholder="CustomerID"></td>
                                             <td> <input type="search" data-column="2" placeholder="Name"></td>
                                             <td></td>
                                             <td></td>
                                             <td></td>
                                        </tr>
                                        <tr>
                                             <th>No.</th>
                                             <th>CustomerID</th>
                                             <th>Name</th>
                                             <th>PhoneNumber</th>
                                             <th>Sex</th>
                                             <th>Address</th>
                                             <th>Date of Birth</th>
                                             <th>Email</th>
                                             <th>OrderID</th>
                                             <th>CageID</th>
                                             <th>Quantity</th>
                                             <th>OrderDetailStatus</th>
                                             <th>View Order Detail</th>
                                        </tr>
                                   </thead>
                                   <c:set var="count1" value="0" />
                                   <c:forEach items="${CustomerList}" var="dto" varStatus="counter">
                                        <c:if test="${dto.getRoleID()==4}">
                                             <form action="MainController">
                                                  <tr>
                                                       <td>
                                                            ${counter.count}
                                                       </td>
                                                       <td>
                                                            ${dto.getUserID()}
                                                            <input type="hidden" name="txtCustomerName" value="${dto.getUserID()}" />
                                                       </td>
                                                       <td>
                                                            ${dto.getName()}
                                                       </td>
                                                       <td>
                                                            ${dto.getPhoneNumber()}
                                                       </td>
                                                       <td>
                                                            ${dto.getSex()}
                                                       </td>
                                                       <td>
                                                            ${dto.getAdress()}
                                                       </td>
                                                       <td>
                                                            ${dto.getBirthDate()}
                                                       </td>
                                                       <td>
                                                            ${dto.getEmail()}
                                                       </td>
                                                       <td>
                                                            ${dto.getOrderID()}
                                                            <input type="hidden" name="txtOrderID" value="${dto.getOrderID()}" />
                                                       </td>
                                                       <td>
                                                            ${dto.getCageID()}
                                                            <input type="hidden" name="txtCageID" value="${dto.getCageID()}" />
                                                       </td>
                                                       <td>
                                                            ${dto.getQuantity()}
                                                       </td>
                                                       <td>
                                                            ${dto.getOrderDetailStatus()}
                                                            <input type="hidden" name="txtOrderDetailStatus" value="${dto.getOrderDetailStatus()}" />
                                                       </td>
                                                       <td>
                                                            <button class="fa fa-cog"  type="submit" value="ViewProcessDetail" name="btAction"></button>
                                                       </td>
                                                       <%--
                                                       <td>
                                                            <c:url value="orderAdd.jsp" var="AdddLink">
                                                                 <c:param name="txtCustomerID" value="${dto.getUserID()}"/>
                                                            </c:url>
                                                            <span class="data-list"><a href="${AdddLink}">Generate Order</a></span>
                                                       </td>
                                                       --%>
                                                  </tr>
                                             </form>

                                        </c:if>
                                   </c:forEach>
                              </table>
                         </c:if>
                         <c:if test="${empty CustomerList}">
                              <font color="green">
                              <h2>
                                   There is no Customers!!!
                              </h2>
                              </font>
                         </c:if>
                    </form>
               </div>
          </section>
     </div>
     <script src="js/ProductProcess.js"></script>
</body>
</html>