<%-- 
    Document   : AdminHomePage
    Created on : Oct 30, 2023, 2:02:45 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- Coding By CodingNepal - codingnepalweb.com -->
<html lang="en">
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
          <title>Admin Home Page</title>
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
                         <a src="HomePage.html"><img src="img/admin.png" alt=""></a>
                         <span class="logo_name">${sessionScope.USER.getName()}</span>
                    </div>
               <!--</div>-->

                    <div class="menu-items">
                         <ul class="nav-links">
                              <li><a href="MainController?btAction=Dashboard">
                                        <i class="uil uil-estate"></i>
                                        <span class="link-name">Dashboard</span>
                                   </a></li>

                              <li><a href="AdminHomePage.jsp">
                                        <i class="uil uil-bill"></i>
                                        <span class="link-name">Home</span>
                                   </a></li>
                              <li><a href="MainController?btAction=Manage Account">
                                        <i class="uil uil-grin"></i>
                                        <span class="link-name">Manage Account</span>
                                   </a></li>
                              <ul class="logout-mode">
                                   <li><a href="${logout_query}">
                                             <i class="uil uil-signout"></i>
                                             <span class="link-name">Logout</span>
                                        </a></li>
                              </ul>
                         </ul>
                    </ul>
               </div>

          </nav>

          <section class="dashboard">



          </section>


          <!--          <script src="js/HomePage.js"></script>
                    <script src="js/DarkMode.js"></script>-->
     </body>
</html>
