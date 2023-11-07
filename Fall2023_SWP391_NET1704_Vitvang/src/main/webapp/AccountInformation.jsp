<%-- 
    Document   : AccountInformation
    Created on : Oct 31, 2023, 9:54:57 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <!----======== CSS ======== -->
          <link rel="stylesheet" href="css/AccountInformation.css">

          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
          <title>Account's Information</title>
     </head>

     <body>
          <c:url var="logout_query" value="MainController">
               <c:param name="cookiekey" value="" />
               <c:param value="Log Out" name="btAction" />
          </c:url>
          <c:url var="productionList" value="MainController">
               <c:param value="SearchCage" name="btAction" />
          </c:url>

          <style>
               p {
                    font-size: 15px;
                    color: red;
               }
          </style>
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
                         <!--                         <li><a href="">
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

                         <!--                         <li class="mode">
                                                       <a href="#">
                                                            <i class="uil uil-moon"></i>
                                                            <span class="link-name">Dark Mode</span>
                                                       </a>
                         
                                                       <div class="mode-toggle">
                                                            <span class="switch"></span>
                                                       </div>
                                                  </li>-->
                    </ul>
               </div>
          </nav>
          <c:set var="result" value="${requestScope.ACCOUNT_DETAIL}"></c:set>
          <c:set var="err" value="${requestScope.UPDATE_ACCOUNT_ERR}"></c:set>
          <c:set var="message" value="${requestScope.MESSAGE_CREATE_FAIL}"></c:set>
               <section class="dashboard">
                    <div class="form">
                         <div class="info_form">
                              <div class="info">
                                   <h2>Information</h2>
                                   <p>Manage profile information for account security</p>
                              </div>

                         </div>
                    <c:forEach var="dto" items="${result}">
                         <div class="info_form1">
                             <form action="MainController" method="POST">
                                   <div class="form-row2">
                                        <label for="userID">User ID: <i>${dto.getUserID()}</i></label>
                                        <input type="hidden" id="userID" name="txtUserID" value="${dto.getUserID()}">

                                        <label for="roleID">Role ID: <i>${dto.getRoleName()}</i></label>
                                   </div>

                                   <div class="form-row2">
                                        <label for="name">Name: <i>${dto.getName()}</i></label>                  

                                        <label for="gender">Gender: <i>${dto.getSex()}</i></label>    
                                   </div>


                                   <div class="form-row">
                                        <label for="username">Username: </label>
                                        <br>
                                        <br>
                                        <input type="text" id="username" name="txtUsername" value="${dto.getUsername()}" required="">
                                        <br>
                                        <br>
                                        <c:if test="${not empty err.getUsernameFormatErr()}">
                                             <p >${err.getUsernameFormatErr()}</p>
                                        </c:if>
                                        <br>
                                        <label for="password" >Password: </label>
                                        <br>
                                        <br>
                                        <input type="password"  id="password" name="txtPassword" value="${dto.getPassword()}" required="">
                                        <br>
                                        <br>
                                        <c:if test="${not empty err.getPasswordFormatErr()}">
                                             <p>${err.getPasswordFormatErr()}</p>
                                        </c:if>
                                   </div>

                                   <div class="form-row">
                                        <label for="email">Email: </label>
                                        <br>
                                        <br>
                                        <input type="email" id="email" name="txtEmail" value="${dto.getEmail()}" required="">
                                        <br>
                                        <br>
                                        <c:if test="${not empty err.getEmailFormatErr()}">
                                             <p>${err.getEmailFormatErr()}</p>
                                        </c:if>

                                        <label for="address">Address: </label>
                                        <br>
                                        <br>
                                        <input type="text" id="address" name="txtAddress" value="${dto.getAdress()}" required="">
                                        <br>
                                        <br>
                                        <c:if test="${not empty err.getAddressFormatErr()}">
                                             <p>${err.getAddressFormatErr()}</p>
                                        </c:if>
                                   </div>

                                   <div class="form-row">
                                        <label for="phone">Phone: </label>
                                        <br>
                                        <br>
                                        <input type="text" id="phone" name="txtPhoneNumber" value="${dto.getPhoneNumber()}" required="">
                                        <br>
                                        <br>
                                        <c:if test="${not empty err.getPhoneNumberFormatErr()}">
                                             <p>${err.getPhoneNumberFormatErr()}</p>
                                        </c:if>
                                   </div>

                                   <div class="form-row">
                                        <label for="birthday">Birthday: <i>${dto.getBirthDate()}</i></label>
                                   </div>
                                   <div class="form-row1">
                                        <button type="submit" id="updateButton" value="UpdateAccount" name="btAction">Update</button>
                                        <button type="submit" id="deleteButton" value="DeleteAccount" name="btAction">Delete</button>
                                   </div>
                              </form>
                         </div>
                    </c:forEach>
                    <c:if test="${not empty message}">
                         <h1>${message}</h1>
                    </c:if>
               </div>

          </section>

     </body>

</html>