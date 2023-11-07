<%-- 
    Document   : AdminHomePage
    Created on : Oct 30, 2023, 2:02:45 PM
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
          <link rel="stylesheet" href="css/HomePage.css">

          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


          <title>Home Page</title>
     </head>
     <body> 
          <c:url var="logout_query" value="MainController">
               <c:param name="cookiekey" value="${sessionScope.USER.getName()}"/>
               <c:param value="Log Out" name="btAction"/>
          </c:url>

          <nav>

               <div class="logo-name" style="display: block;">

                    <div class="logo-image">
                         <a href="HomePage.html"><img src="img/OIP.jpg" alt=""></a>
                         <span class="logo_name">${sessionScope.USER.getName()}</span>
                    </div>
               <!--</div>-->

               <div class="menu-items">
                    <ul class="nav-links">
                         <li><a href="#">
                                   <i class="uil uil-estate"></i>
                                   <span class="link-name">Dahsboard</span>
                              </a></li>

                         <!--                              <li><a href="MainController?btAction=Order">
                                                                 <i class="uil uil-bill"></i>
                                                                 <span class="link-name">Order</span>
                                                            </a></li>-->
                         <li><a href="MainController?btAction=Manage Account">
                                   <i class="uil uil-grin"></i>
                                   <span class="link-name">Manage Account</span>
                              </a></li>
                         <!--                              <li><a href="MainController?btAction=Production process">
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
                    </ul>
               </div>

          </nav>

          <section class="dashboard">



          </section>


          <script src="js/HomePage.js"></script>
          <script src="js/DarkMode.js"></script>
     </body>
</html>