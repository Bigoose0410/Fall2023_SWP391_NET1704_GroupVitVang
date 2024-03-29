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
          <link rel="stylesheet" href="css/AdminManageAccount.css">
          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
          <title>Create Account</title>
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
               p {
                    font-size: 5px;
                    color: red;
               }
          </style>
     </head>

     <body>
          
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
                             <a src="HomePage.html"><img src="img/admin.png" alt=""></a>
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
                              <ul class="logout-mode">
                                   <li><a href="${logout_query}">
                                             <i class="uil uil-signout"></i>
                                             <span class="link-name">Logout</span>
                                        </a></li>
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
                        <form action="MainController" method="POST">
                              <div class="info_form1">
                                   <div class="form-row">


                                        <label for="status">Role</label>
                                        <div class="form-row">
                                             <div class="input-container">

                                                  <select class="input-field" name="txtRoleID" id="roleID" style="margin-right: 700px;
                                                          ">
                                                       <!--<option value="1">Admin</option>-->
                                                       <option value="2">Staff</option>
                                                       <option value="3">Manager</option>
                                                       <option value="4">Customer</option>
                                                  </select>
                                                  <span class="input-highlight"></span>
                                             </div>
                                        </div>


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
                                   <input type="text" id="username" name="txtUsername" value="${param.txtUsername}" placeholder="Username" required="">

                              </div>
                              <div class="form-row">
                                   <c:if test="${not empty err.getUsernameFormatErr()}">

                                        <label for="email"  style="color: red; font-size: 13px; margin-left: 31%">${err.getUsernameFormatErr()}</label>
                                   </c:if>
                                   <c:if test="${not empty err.getUsernameExistErr()}">
                                        <label for="error" style="color: red; font-size: 13px; margin-left: 14%">${err.getUsernameExistErr()}</label>
                                   </c:if>
                              </div>

                              <div class="form-row">
                                   <label for="password">Password: </label>
                                   <input type="password" id="password" name="txtPassword" value="" placeholder="Password" required="">

                              </div>
                              <div class="form-row">
                                   <c:if test="${not empty err.getPasswordFormatErr()}">

                                        <label for="error" style="color: red; font-size: 13px; margin-left: 31%">${err.getPasswordFormatErr()}</label>
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