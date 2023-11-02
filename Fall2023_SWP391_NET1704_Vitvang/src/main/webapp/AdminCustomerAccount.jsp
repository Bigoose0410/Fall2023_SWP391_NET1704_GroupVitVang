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

          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

          <title>Customer Accounts</title>
     </head>
     <body>
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
<!--                         <li><a href="MainController?btAction=Order">
                                   <i class="uil uil-bill"></i>
                                   <span class="link-name">Order</span>
                              </a></li>-->
                         <li><a href="#">
                                   <i class="uil uil-grin"></i>
                                   <span class="link-name">Manage Account</span>
                              </a></li>
<!--                         <li><a href="}">
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
                              </a></li>-->
                    </ul>

                    <ul class="logout-mode">
                         <li><a href="${logout_query}">
                                   <i class="uil uil-signout"></i>
                                   <span class="link-name">Logout</span>
                              </a></li>

<!--                         <li class="mode">
                              <a href="#">
                                   <i class="uil uil-moon"></i>
                                   <span class="link-name">Dark Mode</span>
                              </a>

                              <div class="mode-toggle">
                                   <span class="switch"></span>
                              </div>-->
                         </li>
                    </ul>
               </div>
          </nav>
          <section class="dashboard">
               <h1><strong>Account</strong></h1>
               <div class="header">
                    <div class="search">
                         <input type="text" placeholder="Customer...">
                         <button type="button">Search</button>
                    </div>
                    <div class="button">
                         <a href="AdminCreateAccount.jsp">+ Create</a>
                    </div>
               </div>

               <!--Group box account-->
               <c:set var="result" value="${requestScope.ACCOUNT_RESULT}" />
               <div class="box">
                    <c:forEach var="dto" items="${result}">

                         <div class="group-box">
                              <span><a href="Information.html">${dto.getUserID()}</a></span>

                              <div class="group-content">
                                   <p>Name: <i>${dto.getName()}</i></p>
                                   <p>Phone: <i>${dto.getPhoneNumber()}</i></p>
                                   <p>Role: <i>${dto.getRoleName()}</i></p>
                              </div>
                              <form action="MainController">
                                   <input type="hidden" name="txtUserID" value="${dto.getUserID()}" />
                                   <button type="submit" value="ViewAccountDetail" name="btAction" >Detail</button>
                              </form>
                         </div>
                    </c:forEach>
               </div>
          </section>
     </body>
</html>
