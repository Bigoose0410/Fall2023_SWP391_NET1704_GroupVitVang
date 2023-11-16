<%-- 
    Document   : test
    Created on : Nov 10, 2023, 8:41:08 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

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
          <title>Manage Account</title>
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
          <c:url var="logout_query" value="MainController">
               <c:param name="cookiekey" value="" />
               <c:param value="Log Out" name="btAction" />
          </c:url>
          <nav>

               <div class="logo-name" style="
                    display: block;">
                    <div class="logo-image">
                         <a src="#"><img src="img/OIP.jpg" alt=""></a>
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
          <section class="dashboard">
               <h1><strong>Account</strong></h1>
               <form action="MainController">
                    <div class="header">
                         <div class="search">
                              <input type="text" name="txtSearchAccount" value="" placeholder="Search By Name...">
                              <button type="submit" name="btAction" value="SearchAccount">Search</button>
                         </div>

                         <div class="button">
                              <a href="AdminCreateAccount.jsp">+ Create</a>
                         </div>
                    </div>
               </form>
               <c:set var="searchAccount" value="${param.txtSearchAccount}"></c:set>
               <c:set var="result" value="${requestScope.ACCOUNT_RESULT}" />
               <c:set var="searchResult" value="${requestScope.SEARCH_ACCOUNT_RESULT}" />
               <c:set var="count" value="0"></c:set>
                    <div class="table-container">
                         <table>
                              <thead>
                                   <tr>
                                        <th>No.</th>
                                        <th>User ID</th>
                                        <th>Name</th>
                                        <th>Phone</th>
                                        <th>Role</th>
                                        <th>Information</th>
                                   </tr>
                              </thead>

                              <tbody>
                              <c:if test="${empty searchAccount}">
                                   <c:if test="${not empty result}">
                                        <c:forEach var="dto" items="${result}">
                                             <c:if test="${dto.isUserStatus()}">
                                             <form action="MainController" method="POST">
                                                  <tr>
                                                       <td>
                                                            <c:set var="count" value="${count + 1}" />
                                                            ${count}
                                                       </td>

                                                       <td>${dto.getUserID()}</td>

                                                       <td>${dto.getName()}</td>

                                                       <td>${dto.getPhoneNumber()}</td>

                                                       <td>${dto.getRoleName()}</td>

                                                  <input type="hidden" name="txtUserID" value="${dto.getUserID()}" />

                                                  <td class="view_button">
                                                       <button type="submit" value="ViewAccountDetail" name="btAction"><i
                                                                 class="fa fa-eye"></i></button>
                                                  </td>
                                                  </tr>
                                             </form>
                                        </c:if>
                                   </c:forEach>
                              </c:if>
                              <c:if test="${empty result}">
                                   <h3 style="color: red">Account list is empty !!!</h3>
                              </c:if>
                         </c:if>
                         <c:if test="${not empty searchAccount}">
                              <c:if test="${not empty searchResult}">
                                   <c:forEach var="dto1" items="${searchResult}">
                                        <form action="MainController" method="POST">
                                             <tr>
                                                  <td>
                                                       <c:set var="count" value="${count + 1}" />
                                                       ${count}
                                                  </td>

                                                  <td>${dto1.getUserID()}</td>

                                                  <td>${dto1.getName()}</td>

                                                  <td>${dto1.getPhoneNumber()}</td>

                                                  <td>${dto1.getRoleName()}</td>

                                             <input type="hidden" name="txtUserID" value="${dto1.getUserID()}" />

                                             <td class="view_button">
                                                  <button type="submit" value="ViewAccountDetail" name="btAction"><i
                                                            class="fa fa-eye"></i></button>
                                             </td>
                                             </tr>
                                        </form>

                                   </c:forEach>                  
                              </c:if>
                              <c:if test="${empty searchResult}">
                                   <h3 style="color: red">Your search account is not available !!!</h3>
                              </c:if>
                         </c:if>
                         </tbody>
                    </table>
               </div>

          </section>

     </body>

</html>