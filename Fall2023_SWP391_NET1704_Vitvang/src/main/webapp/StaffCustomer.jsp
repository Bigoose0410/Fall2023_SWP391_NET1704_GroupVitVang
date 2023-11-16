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
          <link rel="stylesheet" href="css/Accounts.css">
          <link rel="stylesheet" href="css/Dashboard.css">
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
               <form action="MainController" method="POST">
                    <div class="header">
                         <div class="search">
                              <input type="text" name="txtSearchAccount" value="" placeholder="Customer...">
                              <button type="submit" name="btAction" value="SearchAccount">Search</button>
                         </div>
                         <div class="button">
                              <a href="AdminCreateAccount.jsp">+ Create</a>
                         </div>
                    </div>
               </form>

               <!--Group box account-->
               <c:set var="searchAccount" value="${param.txtSearchAccount}"></c:set>
               <c:set var="result" value="${requestScope.CUSTOMER_HAVE_ORDER_LIST}" />
               <c:set var="searchResult" value="${requestScope.SEARCH_ACCOUNT_RESULT}" />
               <%--<c:set var="status" value="${requestScope.USER_STATUS}" />--%>
               <div class="box">

                    <c:if test="${empty searchAccount}">
                         <c:if test="${not empty result}">

                              <c:forEach var="dto" items="${result}">
                                   <c:if test="${dto.isUserStatus()}">

                                        <div class="group-box">
                                             <form action="MainController" method="POST">
                                                  <span><a href="Information.html">${dto.getUserID()}</a></span>

                                                  <div class="group-content">
                                                       <p>Name: <i>${dto.getName()}</i></p>
                                                       <p>Phone: <i>${dto.getPhoneNumber()}</i></p>
                                                  </div>

                                                  <input type="hidden" name="txtUserID" value="${dto.getUserID()}" />
                                                  <button type="submit" value="StaffViewCustomerDetail" name="btAction" >Detail</button>

                                             </form>
                                        </div>
                                   </c:if>
                              </c:forEach>
                         </c:if>
                         <c:if test="${empty result}">
                              <h3 style="color: red">Account list is empty !!!</h3>
                         </c:if>
                    </c:if>
                    <c:if test="${not empty searchAccount}">
                         <c:if test="${not empty searchResult}">
                              <form action="MainController" method="POST">
                                   <c:forEach var="dto1" items="${searchResult}">
                                        <div class="group-box">
                                             <span><a href="Information.html">${dto1.getUserID()}</a></span>

                                             <div class="group-content">
                                                  <p>Name: <i>${dto1.getName()}</i></p>
                                                  <p>Phone: <i>${dto1.getPhoneNumber()}</i></p>
                                                  <p>Role: <i>${dto1.getRoleName()}</i></p>
                                             </div>

                                             <input type="hidden" name="txtUserID" value="${dto1.getUserID()}" />
                                             <button type="submit" value="ViewAccountDetail" name="btAction" >Detail</button>

                                        </div>

                                   </c:forEach>
                              </form>
                         </c:if>
                         <c:if test="${empty searchResult}">
                              <h3 style="color: red">Your search account is not available !!!</h3>
                         </c:if>
                    </c:if>
               </div>
          </section>
          <script src="js/DarkMode.js"></script>
     </body>
</html>
