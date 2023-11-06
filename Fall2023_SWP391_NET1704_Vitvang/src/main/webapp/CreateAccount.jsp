<%-- 
    Document   : CreateAccount
    Created on : Oct 30, 2023, 2:13:29 PM
    Author     : Nguyen Ba Tung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <!----======== CSS ======== -->
          <link rel="stylesheet" href="css/CreateAccount.css">

          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
          <title>CreateAccount</title>
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
                    <li><a href="MainController?btAction=Search">
                              <i class="uil uil-bill"></i>
                              <span class="link-name">Order</span>
                         </a></li>
                    <li><a href="#">
                              <i class="uil uil-grin"></i>
                              <span class="link-name">Customers</span>
                         </a></li>
                    <li><a href="${productionList}">
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
                         </a></li>
               </ul>

               <ul class="logout-mode">
                    <li><a href="${logout_query}">
                              <i class="uil uil-signout"></i>
                              <span class="link-name">Logout</span>
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
          <div class="form">
               <div class="info_form">
                    <h2>New Account</h2>
               </div>

               <div class="info_form1">
                    <div class="form-row">
                         <label for="userID">UserID: </label>
                         <input type="text" id="userID" name="userID">

                         <label for="roleID">RoleID: </label>
                         <input type="text" id="roleID" name="roleID">
                    </div>

                    <div class="form-row">
                         <label for="name">Name: </label>
                         <input type="text" id="name" name="name">

                         <label for="email">Email:</label>
                         <input type="email" id="email" name="email">
                    </div>

                    <div class="form-row">
                         <label for="username">Username: </label>
                         <input type="text" id="username" name="username">

                         <label for="password">Password: </label>
                         <input type="password" id="password" name="password">
                    </div>

                    <div class="form-row">
                         <label for="address">Address:</label>
                         <input type="text" id="address" name="address">

                         <label for="phone">Phone: </label>
                         <input type="tel" id="phone" name="phone">
                    </div>

                    <div class="form-row">
                         <label for="birthday">Birthday: </label>
                         <input type="date" id="birthday" name="birthday">
                    </div>

                    <div class="form-row">
                         <label for="gender">Gender: </label>

                         <label for="male">Male</label>
                         <input type="radio" id="male" name="gender" value="male">

                         <label for="female">Female</label>
                         <input type="radio" id="female" name="gender" value="female">
                    </div>

                    <div class="form-row1">
                         <button type="button" id="CreateButton">Create</button>
                    </div>
               </div>
          </div>

     </section>

</body>

</html>