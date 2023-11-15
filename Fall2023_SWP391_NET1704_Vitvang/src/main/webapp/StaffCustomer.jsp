<%-- 
    Document   : AdminCustomerAccount
    Created on : Oct 30, 2023, 2:09:56 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <!----======== CSS ======== -->
          <link rel="stylesheet" href="css/AdminManageAccount.css">
          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
          <title>Customer Accounts</title>
     </head>
     <body>
          <c:url var="logout_query" value="MainController">
               <c:param name="cookiekey" value="" />
               <c:param value="Log Out" name="btAction" />
          </c:url>
          <c:url var="productionList" value="MainController">
               <c:param value="SearchCage" name="btAction"/>
          </c:url>
          <nav>
               <div class="logo-name" style="
                    display: block;">
                    <div class="logo-image">
                         <a src="HomePage.html"><img src="img/OIP.jpg" alt=""></a>
                         <span class="logo_name">${sessionScope.USER.getName()}</span>
                    </div>

                    <div class="menu-items">
                         <ul class="nav-links">
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
               <h1><strong>Account</strong></h1>
               <form action="MainController">
                    <div class="header">
                         <div class="search">
                              <input type="text" name="txtSearchCustomer" value="" placeholder="Customer...">
                              <button type="submit" name="btAction" value="Customers">Search</button>
                         </div>
                    </div>
               </form>

               <!--Group box account-->
               <c:set var="searchCustomer" value="${param.txtSearchCustomer}"></c:set>
               <c:set var="result" value="${requestScope.CUSTOMER_HAVE_ORDER_LIST}" />
               <c:set var="searchResult" value="${requestScope.SEARCH_ACCOUNT_RESULT}" />
               <%--<c:set var="status" value="${requestScope.USER_STATUS}" />--%>


               <div class="table-container">
                    <table>
                         <thead>
                              <tr>
                                   <th>No.</th>
                                   <th>Customer ID</th>
                                   <th>Name</th>
                                   <th>Phone</th>
                                   <th>Information</th>
                              </tr>
                         </thead>

                         <tbody>
                              <c:if test="${empty searchCustomer}">
                                   <c:if test="${not empty result}">
                                        <c:forEach var="dto" items="${result}">
                                             <c:if test="${dto.isUserStatus()}">
                                             <form action="MainController">
                                                  <tr>
                                                       <td>
                                                            <c:set var="count" value="${count + 1}" />
                                                            ${count}
                                                       </td>

                                                       <td>${dto.getUserID()}</td>

                                                       <td>${dto.getName()}</td>

                                                       <td>${dto.getPhoneNumber()}</td>

                                                  <input type="hidden" name="txtUserID" value="${dto.getUserID()}" />

                                                  <td class="view_button">
                                                       <button type="submit" value="StaffViewCustomerDetail" name="btAction"><i
                                                                 class="fa fa-eye"></i></button>
                                                  </td>
                                                  </tr>
                                             </form>
                                        </c:if>
                                   </c:forEach>
                              </c:if>
                              <c:if test="${empty result}">
                                   <h3 style="color: red">Account list is empty !!!</h3>
                              </c:if>
                         </c:if>
                         <c:if test="${not empty searchCustomer}">
                              <c:if test="${not empty result}">
                                   <c:forEach var="dto" items="${result}">
                                        <form action="MainController">
                                             <tr>
                                                  <td>
                                                       <c:set var="count" value="${count + 1}" />
                                                       ${count}
                                                  </td>

                                                  <td>${dto.getUserID()}</td>

                                                  <td>${dto.getName()}</td>

                                                  <td>${dto.getPhoneNumber()}</td>

                                             <input type="hidden" name="txtUserID" value="${dto.getUserID()}" />

                                             <td class="view_button">
                                                  <button type="submit" value="StaffViewCustomerDetail" name="btAction"><i
                                                            class="fa fa-eye"></i></button>
                                             </td>
                                             </tr>
                                        </form>

                                   </c:forEach>                  
                              </c:if>
                              <c:if test="${empty result}">
                                   <h3 style="color: red">Your search account is not available !!!</h3>
                              </c:if>
                         </c:if>
                         </tbody>
                    </table>
               </div>
          </section>
          <script src="js/DarkMode.js"></script>
     </body>
</html>
