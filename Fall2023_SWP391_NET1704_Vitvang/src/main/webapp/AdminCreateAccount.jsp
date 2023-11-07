<%-- 
    Document   : AdminCreateAccount
    Created on : Oct 31, 2023, 2:25:30 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <!----======== CSS ======== -->
          <link rel="stylesheet" href="css/CreateAccount.css">
          <link rel="stylesheet" href="css/Dashboard.css">
          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
          <title>Create Account</title>
     </head>

     <body>
          <style>
               p {
                    font-size: 5px;
                    color: red;
               }
          </style>
          <c:url var="logout_query" value="MainController">
               <c:param name="cookiekey" value="" />
               <c:param value="Log Out" name="btAction" />
          </c:url>
          <c:set var="CageID" value="${param.txtCageID}"></c:set>
          <c:set var="Design" value="${requestScope.DESIGN_PROCESS}"></c:set>
               <nav>

                    <div class="logo-name" style="
                         display: block;">
                         <div class="logo-image">
                              <a src="HomePage.html"><img src="img/OIP.jpg" alt=""></a>
<<<<<<< HEAD
                         </div>

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
                                   <!--                                   <li><a href="MainController?btAction=Production process">
                                                                                <i class="uil uil-chart-line"></i>
                                                                                <span class="link-name">Production process</span>
                                                                           </a></li>-->
                                   <!--                                   <li><a href="#">
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
=======
                              <span class="logo_name">${sessionScope.USER.getName()}</span>
                    </div>

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
                              <!--                                   <li><a href="MainController?btAction=Production process">
                                                                           <i class="uil uil-chart-line"></i>
                                                                           <span class="link-name">Production process</span>
                                                                      </a></li>-->
                              <!--                                   <li><a href="#">
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
>>>>>>> 6c7328056a33b9fcd7a9d8679e94c4b00580764c
                                             <i class="uil uil-signout"></i>
                                             <span class="link-name">Logout</span>
                                        </a></li>

                                   <!--                              <li class="mode">
                                              <a href="#">
                                                   <i class="uil uil-moon"></i>
                                                   <span class="link-name">Dark Mode</span>
                                              </a>-->

                                   <!--                                   <div class="mode-toggle">
                                                   <span class="switch"></span>
                                              </div>-->
                                   <!--                                   <li class="mode">
                                                                           <a href="#">
                                                                                <i class="uil uil-moon"></i>
                                                                                <span class="link-name">Dark Mode</span>
                                                                           </a>
                                   
                                                                           <div class="mode-toggle">
                                                                                <span class="switch"></span>
                                                                           </div>
                                                                      </li>-->
                              </ul>
                         </ul>
                    </div>

          </nav>
          <c:set var="message" value="${requestScope.MESSAGE_CREATE_FAIL}"></c:set>
          <c:set var="err" value="${requestScope.CREATE_ACCOUNT_ERR}"></c:set>
               <section class="dashboard">
                    <div class="form" style="color: black;">
                         <div class="info_form">
                              <h2>New Account</h2>
                         </div>
                         <form action="MainController">
                              <div class="info_form1">
                                   <div class="form-row">
                                        <label for="userID">UserID: </label>
                                        <input type="text" id="userID" name="txtUserID" value="" placeholder="UserID" required="">

                                        <label for="roleID">RoleID: </label>
                                        <input type="text" id="roleID" name="txtRoleID" value="" placeholder="RoleID" required="">

                                   </div>

                                   <div class="form-row">
                                   <c:if test="${not empty err.getUserIDExistErr()}">
                                        <label for="error" style="color: red; font-size: 13px; margin-left: 14%">${err.getUserIDExistErr()}</label>
                                   </c:if>
<<<<<<< HEAD
=======
                                   <c:if test="${not empty err.getUserIDFormatErr()}">
                                        <label for="error" style="color: red; font-size: 13px; margin-left: 14%">${err.getUserIDFormatErr()}</label>
                                   </c:if>
>>>>>>> 6c7328056a33b9fcd7a9d8679e94c4b00580764c
                                   <c:if test="${not empty err.getRoleIDFormatErr()}">
                                        <label for="error" style="color: red; font-size: 13px; margin-left: 14%">${err.getRoleIDFormatErr()}</label>
                                   </c:if>
                              </div>
                              <div class="form-row">
                                   <label for="name">Name: </label>
                                   <input type="text" id="name" name="txtName" value="${param.txtName}" placeholder="Name" required="">

                                   <label for="email">Email:</label>
                                   <input type="email" id="email" name="txtEmail" value="${param.txtEmail}" placeholder="Email" required="">

                              </div>
                              <div class="form-row">
                                   <c:if test="${not empty err.getNameFormatErr()}">

                                        <label for="error" style="color: red; font-size: 13px; margin-left: 14%">${err.getNameFormatErr()}</label>
                                   </c:if>
                                   <c:if test="${not empty err.getEmailFormatErr()}">

                                        <label for="email"  style="color: red; font-size: 13px; margin-left: 14%">${err.getEmailFormatErr()}</label>
                                   </c:if>
                              </div>

                              <div class="form-row">
                                   <label for="phone">Phone Number: </label>
                                   <input type="tel" id="phone" name="txtPhoneNumber" value="${param.txtPhoneNumber}" placeholder="Phone Number" required="">


                                   <label for="address">Address:</label>
                                   <input type="text" id="address" name="txtAdress" value="${param.txtAdress}" placeholder="Address" required="">

                              </div>
                              <div class="form-row">
                                   <c:if test="${not empty err.getPhoneNumberFormatErr()}">

                                        <label for="error" style="color: red; font-size: 13px; margin-left: 14%">${err.getPhoneNumberFormatErr()}</label>
                                   </c:if>
                                   <c:if test="${not empty err.getAddressFormatErr()}">

                                        <label for="email"  style="color: red; font-size: 13px; margin-left: 14%">${err.getAddressFormatErr()}</label>
                                   </c:if>
                              </div>

                              <div class="form-row">
                                   <label for="birthday">Birth Date: </label>
                                   <input type="date" id="birthday" name="txtBirthDate" value="${param.txtBirthDate}" placeholder="Birth Date" required="">
                              </div>
                              <div class="form-row">
                                   <c:if test="${not empty err.getBirthDateValidErr()}">

                                        <label for="error" style="color: red; font-size: 13px; margin-left: 14%">${err.getBirthDateValidErr()}</label>
                                   </c:if>
                              </div>

                              <div class="form-row">
                                   <label for="username">Username: </label>
                                   <input type="text" id="username" name="txtUsername" value="" placeholder="Username" required="">

                              </div>

                              <div class="form-row">
                                   <label for="password">Password: </label>
                                   <input type="password" id="password" name="txtPassword" value="" placeholder="Password" required="">

                              </div>
                              <div class="form-row">
                                   <c:if test="${not empty err.getPasswordFormatErr()}">

                                        <label for="error" style="color: red; font-size: 13px; margin-left: 31%">${err.getPasswordFormatErr()}</label>
                                   </c:if>
                                   <c:if test="${not empty err.getUsernameFormatErr()}">

                                        <label for="email"  style="color: red; font-size: 13px; margin-left: 31%">${err.getUsernameFormatErr()}</label>
                                   </c:if>
                                   <c:if test="${not empty err.getUsernameExistErr()}">
                                        <label for="error" style="color: red; font-size: 13px; margin-left: 14%">${err.getUsernameExistErr()}</label>
                                   </c:if>
                              </div>

                              <div class="form-row">
                                   <label for="password">Confirm Password: </label>
                                   <input type="password" id="password" name="txtConfirmPassword" value="" placeholder="Confirm Password" required="">

                              </div>

                              <div class="form-row">
                                   <c:if test="${not empty err.getConfirmPasswordNotMatchErr()}">

                                        <label for="error" style="color: red; font-size: 13px; margin-left: 31%">${err.getConfirmPasswordNotMatchErr()}</label>
                                   </c:if>
                              </div>



                              <div class="form-row">
                                   <label for="gender">Gender: </label>

                                   <label for="male">Male</label>
                                   <input type="radio" id="male" name="txtSex" value="M" checked="">

                                   <label for="female">Female</label>
                                   <input type="radio" id="female" name="txtSex" value="F">
                              </div>

                              <div class="form-row1">
                                   <button type="submit" id="CreateButton" value="CreateAccount" name="btAction">Create</button>
                              </div>
                         </div>
                         <c:if test="${not empty message}">
                              <h3>${message}</h3>
                         </c:if>
                    </form>
               </div>

          </section>
          <script src="js/DarkMode.js"></script>
     </body>

</html>