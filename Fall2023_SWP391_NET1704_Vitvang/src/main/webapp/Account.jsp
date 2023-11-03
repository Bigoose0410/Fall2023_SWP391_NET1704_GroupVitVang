<%-- 
    Document   : Account
    Created on : Oct 30, 2023, 2:09:19 PM
    Author     : Nguyen Ba Tung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <!----======== CSS ======== -->
          <link rel="stylesheet" href="css/Account.css">

          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
          <title>Account</title>
     </head>

     <body>
     <c:url var="logout_query" value="MainController">
          <c:param name="cookiekey" value="" />
          <c:param value="Log Out" name="btAction" />
     </c:url>
     <c:url var="productionList" value="MainController">
          <c:param value="SearchCage" name="btAction" />
     </c:url>
     <c:set var="CageID" value="${param.txtCageID}"></c:set>
     <c:set var="Design" value="${requestScope.DESIGN_PROCESS}"></c:set>
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
          <h1><strong>Account</strong></h1>
          <div class="header">
               <div class="search">
                    <input type="text" placeholder="Customer...">
                    <button type="button">Search</button>
               </div>
               <div class="button">
                    <a href="CreateAccount.html">+ Create</a>
               </div>
          </div>

          <!--Group box account-->
          <div class="box">
               <div class="group-box">
                    <span><a href="Information.html">Batu</a></span>
                    <div class="group-content">
                         <p>Name: <i></i></p>
                         <p>Phone: <i></i></p>
                         <p>Role: <i></i></p>
                    </div>
               </div>

               <div class="group-box">
                    <span><a href="Information.html">Tam</a></span>
                    <div class="group-content">
                         <p>Name: <i></i></p>
                         <p>Phone: <i></i></p>
                         <p>Role: <i></i></p>
                    </div>
               </div>

               <div class="group-box">
                    <span><a href="Information.html">Huy</a></span>
                    <div class="group-content">
                         <p>Name: <i></i></p>
                         <p>Phone: <i></i></p>
                         <p>Role: <i></i></p>
                    </div>
               </div>

               <div class="group-box">
                    <span><a href="Information.html">Thanh</a></span>
                    <div class="group-content">
                         <p>Name: <i></i></p>
                         <p>Phone: <i></i></p>
                         <p>Role: <i></i></p>
                    </div>
               </div>

               <div class="group-box">
                    <span><a href="Information.html">Phuoc</a></span>
                    <div class="group-content">
                         <p>Name: <i></i></p>
                         <p>Phone: <i></i></p>
                         <p>Role: <i></i></p>
                    </div>
               </div>

               <div class="group-box">
                    <span><a href="Information.html">Nhat</a></span>
                    <div class="group-content">
                         <p>Name: <i></i></p>
                         <p>Phone: <i></i></p>
                         <p>Role: <i></i></p>
                    </div>
               </div>

               <div class="group-box">
                    <span><a href="Information.html">Tri</a></span>
                    <div class="group-content">
                         <p>Name: <i></i></p>
                         <p>Phone: <i></i></p>
                         <p>Role: <i></i></p>
                    </div>
               </div>

               <div class="group-box">
                    <span><a href="Information.html">Khoa</a></span>
                    <div class="group-content">
                         <p>Name: <i></i></p>
                         <p>Phone: <i></i></p>
                         <p>Role: <i></i></p>
                    </div>
               </div>

               <div class="group-box">
                    <span><a href="Information.html">Toan</a></span>
                    <div class="group-content">
                         <p>Name: <i></i></p>
                         <p>Phone: <i></i></p>
                         <p>Role: <i></i></p>
                    </div>
               </div>
          </div>

     </section>

</body>

</html>
