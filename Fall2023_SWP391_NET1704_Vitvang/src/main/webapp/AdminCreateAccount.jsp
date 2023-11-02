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

          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
          <title>Create Account</title>
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
                         <li><a href="AdminHomePage.jsp">
                                   <i class="uil uil-bill"></i>
                                   <span class="link-name">Home</span>
                              </a></li>
                         <li><a href="MainController?btAction=Manage Account">
                                   <i class="uil uil-grin"></i>
                                   <span class="link-name">Manage Account</span>
                              </a></li>
                         <!--                         <li><a href="#">
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
          <c:set var="message" value="${requestScope.MESSAGE_CREATE_FAIL}"></c:set>
          <c:set var="err" value="${requestScope.CREATE_ACCOUNT_ERR}"></c:set>
               <section class="dashboard">
                    <div class="form">
                         <div class="info_form">
                              <h2>New Account</h2>
                         </div>
                         <form action="MainController">
                              <div class="info_form1">
                                   <div class="form-row">
                                        <label for="userID">UserID: </label>
                                        <input type="text" id="userID" name="txtUserID" value="" placeholder="UserID" required="">
                                   <c:if test="${not empty err.getCustomerIDexistErr()}"></c:if>

                                        <label for="roleID">RoleID: </label>
                                        <input type="text" id="roleID" name="txtRoleID" value="" placeholder="RoleID" required="">
                                   </div>

                                   <div class="form-row">
                                        <label for="name">Name: </label>
                                        <input type="text" id="name" name="txtName" value="" placeholder="Name" required="">
                                   <c:if test="${not empty err.getNameLengthErr()}">
                                        <h5>${err.getNameLengthErr()}</h5>
                                   </c:if>

                                   <label for="email">Email:</label>
                                   <input type="email" id="email" name="txtEmail" value="" placeholder="Email" required="">
                                   <c:if test="${not empty err.getGmailTypeErr()}">
                                        <h5>${err.getGmailTypeErr()}</h5>
                                   </c:if>
                              </div>

                              <div class="form-row">
                                   <label for="phone">Phone Number: </label>
                                   <input type="tel" id="phone" name="txtPhoneNumber" value="" placeholder="Phone Number" required="">
                                   <c:if test="${not empty err.getPhoneNumberTypeErr()}"></c:if>

                                        <label for="address">Address:</label>
                                        <input type="text" id="address" name="txtAdress" value="" placeholder="Address" required="">
                                   <c:if test="${not empty err.getAddressLenghtErr()}">
                                        <h5>${err.getAddressLenghtErr()}</h5>
                                   </c:if>
                              </div>

                              <div class="form-row">
                                   <label for="birthday">Birth Date: </label>
                                   <input type="date" id="birthday" name="txtBirthDate" value="" placeholder="Birth Date" required="">
                                   <c:if test="${not empty err.getBirthDateVaildErr()}">
                                        <h5>${err.getBirthDateVaildErr()}</h5>
                                   </c:if>
                              </div>

                              <div class="form-row">
                                   <label for="username">Username: </label>
                                   <input type="text" id="username" name="txtUsername" value="" placeholder="Username" required="">
                                   <c:if test="${not empty err.getUsernameLengthErr()}">
                                        <h5>${err.getUsernameLengthErr()}</h5>
                                   </c:if>
                              </div>

                              <div class="form-row">
                                   <label for="password">Password: </label>
                                   <input type="password" id="password" name="txtPassword" value="" placeholder="Password" required="">
                                   <c:if test="${not empty err.getPasswordLengthErr()}">
                                        <h5>${err.getPasswordLengthErr()}</h5>
                                   </c:if>
                              </div>

                              <div class="form-row">
                                   <label for="password">Confirm Password: </label>
                                   <input type="password" id="password" name="txtConfirmPassword" value="" placeholder="Confirm Password" required="">
                                   <c:if test="${not empty err.getConfirmNotMatch()}">
                                        <h5>${err.getConfirmNotMatch()}</h5>
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

     </body>

</html>