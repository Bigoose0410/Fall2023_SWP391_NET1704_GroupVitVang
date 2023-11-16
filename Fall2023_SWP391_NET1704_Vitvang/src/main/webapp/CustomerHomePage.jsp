<%-- 
    Document   : CustomerHomePage
    Created on : Nov 5, 2023, 5:07:03 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- Coding By CodingNepal - codingnepalweb.com -->
<html lang="en">
     <head>
          <meta charset="UTF-8">
          <meta http-equiv="X-UA-Compatible" content="IE=edge">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">

          <!----======== CSS ======== -->
          <link rel="stylesheet" href="css/HomePage.css">
          <link rel="stylesheet" href="css/Dashboard.css">

          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <title>Customer Home Page</title>
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
     </head>
     <body>
          <c:url var="logout_query" value="MainController">
               <c:param name="cookiekey" value="" />
               <c:param value="Log Out" name="btAction" />
          </c:url>
          <nav>

               <div class="logo-name" style="
                    display: block;">
                    <div class="logo-image">
                         <a src="HomePage.html"><img src="img/customer.png" alt=""></a>
                         <span class="logo_name">${sessionScope.USER.getName()}</span>
                    </div>

                    <div class="menu-items">
                         <ul class="nav-links">
                              <li><a href="CustomerHomePage.jsp">
                                        <i class="uil uil-estate"></i>
                                        <span class="link-name">Home</span>
                                   </a></li>

                              <li><a href="MainController?btAction=CustomerAccount">
                                        <i class="uil uil-bill"></i>
                                        <span class="link-name">Account</span>
                                   </a></li>
                              <li><a href="MainController?btAction=CustomerOrder">
                                        <i class="uil uil-grin"></i>
                                        <span class="link-name">Order</span>
                                   </a></li>
                              <ul class="logout-mode">
                                   <li><a href="${logout_query}">
                                             <i class="uil uil-signout"></i>
                                             <span class="link-name">Logout</span>
                                        </a></li>
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