<%-- 
    Document   : Product
    Created on : Oct 10, 2023, 10:26:35 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">

          <!----======== CSS ======== -->
          <!--<link rel="stylesheet" href="/css/Admin.css">-->

          <!----===== Iconscout CSS =====--> 
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <!----======== CSS ======== -->
          <!--<link rel="stylesheet" href="css/HomePage.css">-->
          <link rel="stylesheet" href="css/Product.css">

          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

          <title>Admin Dashboard Panel</title>
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
               <div class="header">
                    <h1>Danh Mục Sản Phẩm</h1>
                    <div class="search">
                         <input type="text" placeholder="Search...">
                         <button type="button">Search</button>
                    </div>
               </div>

               <div class="container">

                    <div class="mySwiper">
                         <div class="swiper-slide" id="savanna">
                              <div class="main">
                                   <div class="left-side">
                                        <div class="main-wrapper">
                                             <h3 class="main-header">Closca Bottle</h3>
                                             <h1 class="main-title">Savanna</h1>
                                             <h2 class="main-subtitle">€ 39.90</h2>
                                        </div>
                                        <div class="main-content">
                                             <div class="main-content__title">The Earth’s area affected by desertification is approx
                                                  11 times India’s size.
                                             </div>
                                             <div class="main-content__subtitle">The Savannas act as a carbon sink, absorbing CO2
                                                  from the atmosphere and helping to maintain the balance of global temperatures.
                                             </div>
                                             <a href="ProductDetail1.html"> <button class="more-menu"><strong>+ Detail</strong></button></a>
                                        </div>
                                   </div>
                                   <div class="center">
                                        <div class="right-side__img">
                                             <img class="bottle-bg"
                                                  src="https://i.pinimg.com/736x/d3/69/81/d36981aa38aec939c776717d0660a0d6.jpg" />
                                        </div>
                                   </div>
                              </div>
                         </div>

                         <div class="swiper-slide" id="savanna">
                              <div class="main">
                                   <div class="left-side">
                                        <div class="main-wrapper">
                                             <h3 class="main-header">Closca Bottle</h3>
                                             <h1 class="main-title">Savanna</h1>
                                             <h2 class="main-subtitle">€ 39.90</h2>
                                        </div>
                                        <div class="main-content">
                                             <div class="main-content__title">The Earth’s area affected by desertification is approx
                                                  11 times India’s size.
                                             </div>
                                             <div class="main-content__subtitle">The Savannas act as a carbon sink, absorbing CO2
                                                  from the atmosphere and helping to maintain the balance of global temperatures.
                                             </div>
                                             <div>
                                                  <a href="ProductDetail2.html"> <button class="more-menu"><strong>+ Detail</strong></button></a>
                                             </div>
                                        </div>

                                   </div>
                                   <div class="center">
                                        <div class="right-side__img">
                                             <img class="bottle-bg"
                                                  src="https://i.pinimg.com/236x/dc/ab/eb/dcabeb04860e941fc2609278e95109c3.jpg" />
                                        </div>
                                   </div>
                              </div>
                         </div>

                         <div class="swiper-slide" id="savanna">
                              <div class="main">
                                   <div class="left-side">
                                        <div class="main-wrapper">
                                             <h3 class="main-header">Closca Bottle</h3>
                                             <h1 class="main-title">Savanna</h1>
                                             <h2 class="main-subtitle">€ 39.90</h2>
                                        </div>
                                        <div class="main-content">
                                             <div class="main-content__title">The Earth’s area affected by desertification is approx
                                                  11 times India’s size.
                                             </div>
                                             <div class="main-content__subtitle">The Savannas act as a carbon sink, absorbing CO2
                                                  from the atmosphere and helping to maintain the balance of global temperatures.
                                             </div>
                                             <a href="ProductDetail3.html"> <button class="more-menu"><strong>+ Detail</strong></button></a>
                                        </div>
                                   </div>
                                   <div class="center">
                                        <div class="right-side__img">
                                             <img class="bottle-bg"
                                                  src="https://i.pinimg.com/564x/21/d3/dd/21d3ddfd618b42fe42ea96c69ff34892.jpg" />
                                        </div>
                                   </div>
                              </div>
                         </div>

                    </div>
               </div>
          </section>

     </section>
     <script src="../js/admin.js"></script>

</body>
</html>   