<%-- 
    Document   : CustomerOrder
    Created on : Nov 5, 2023, 6:41:42 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <!----======== CSS ======== -->
          <link rel="stylesheet" href="css/CustomerOrder.css">
          <link rel="stylesheet" href="css/Dashboard.css">

          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
          <title>Customer</title>
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
          <c:url var="productionList" value="MainController">
               <c:param value="SearchCage" name="btAction" />
          </c:url>
          <c:set var="CageID" value="${param.txtCageID}"></c:set>
          <c:set var="Design" value="${requestScope.DESIGN_PROCESS}"></c:set>
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
          <c:set var="result" value="${requestScope.CUSTOMER_ORDER}" />
          <section class="dashboard">
               <div class="header">
                    <h1>Danh Mục Sản Phẩm</h1>
                    <div class="search">
                         <input type="text" placeholder="Search...">
                         <button type="button">Search</button>
                    </div>
               </div>
               <c:if test="${not empty result}">
                    <div class="container">
                         <c:forEach var="dto" items="${result}" >
                              <form action="MainController">
                                   <div class="mySwiper">
                                        <div class="swiper-slide" id="savanna">
                                             <div class="main">
                                                  <div class="left-side">
                                                       <div class="main-wrapper">
                                                            <h3 class="main-header" style="font-weight: bold">${dto.getCageID()}/       ${dto.getOrderID()}</h3>
                                                            <input type="hidden" name="txtCageID" value="${dto.getCageID()}" />
                                                            <input type="hidden" name="txtOrderID" value="${dto.getOrderID()}" />
                                                            <h1 class="main-title">${dto.getName()}</h1>
                                                            <h2 class="main-subtitle">Status: ${dto.getOrderDetailStatus()}</h2>
                                                            <h3>Quantity: ${dto.getQuantityOrder()}</h3>
                                                       </div>
                                                       <div class="main-content">
                                                            <div class="main-content__title">
                                                                 Come from: ${dto.getOrigin()}
                                                            </div>
                                                            <div class="main-content__subtitle">
                                                                 Description: ${dto.getDescription()}
                                                            </div>
                                                            <!--<a href="Process.html"> <button class="more-menu"><strong>Process</strong></button></a>-->
                                                            <button type="submit" class="more-menu" name="btAction" value="CustomerTracking"><strong>Process</strong></button>
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

                                        <!--                    <div class="swiper-slide" id="savanna">
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
                                                                                     <a href="Process.html"> <button class="more-menu"><strong>Process</strong></button></a>
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
                                                                                <a href="Process.html"> <button class="more-menu"><strong>Process</strong></button></a>
                                                                           </div>
                                                                      </div>
                                                                      <div class="center">
                                                                           <div class="right-side__img">
                                                                                <img class="bottle-bg"
                                                                                     src="https://i.pinimg.com/564x/21/d3/dd/21d3ddfd618b42fe42ea96c69ff34892.jpg" />
                                                                           </div>
                                                                      </div>
                                                                 </div>
                                                            </div>-->

                                   </div>
                              </form>
                         </c:forEach>
                    </div>
               </c:if>
               <c:if test="${empty result}" >
                    <h1 style="color: red; font-style: italic"> You don't have any order !!!</h1>
               </c:if>
          </section>

     </body>

</html>