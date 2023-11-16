<%-- 
    Document   : test
    Created on : Nov 16, 2023, 11:50:18 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <!----======== CSS ======== -->
          <!--          <link rel="stylesheet" href="css/CustomerOrder.css">
                    <link rel="stylesheet" href="css/Dashboard.css">-->
<!--          <link rel="stylesheet" href="css/CustomerOrder.css">-->
<link rel="stylesheet" href="css/CustomerOrder.css">

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
                    <h1>Your Order</h1>
               </div>
               <c:if test="${not empty result}">
                    <div class="container">
                         <div class="processing_table">
                              <!--Design Processing table-->
                              <div class="table-container1">
                                   <table>
                                        <thead>
                                             <tr>
                                                  <th>No.</th>
                                                  <th>Order ID</th>
                                                  <th>Start Date</th>
                                                  <th>Total Price</th>
                                                  <th>Order Status</th>
                                                  <th>Detail</th>
                                             </tr>
                                        </thead>

                                        <tbody>
                                        <form action="MainController">
                                             <c:forEach var="dto" items="${result}" varStatus="counter">
                                                  <tr>
                                                       <td>${counter.count}</td>

                                                       <td>${dto.getOrderID()}</td>

                                                       <td>${dto.getStartDate()}</td>

                                                       <td> <fmt:formatNumber currencySymbol="₫" value="${dto.getTotalPrice()}" type="number" pattern="#,##0"  /> ₫</td>

                                                       <td>${dto.getOrderStatus()}</td>

                                                  <input type="hidden" name="txtOrderID" value="${dto.getOrderID()}" />

                                                  <td class="view_button">
                                                       <button type="submit" value="View Order Detail" name="btAction"><i class="fa fa-list-alt"></i></button>

                                                  </td>

                                                  </tr>
                                             </c:forEach>
                                        </form>
                                        </tbody>
                                   </table>
                              </div>
                         </div>
                    </div>
               </c:if>
               <c:if test="${empty result}">
                    <h1 style="color: red; font-style: italic"> You don't have any order !!!</h1>
               </c:if>
          </section>

     </body>

</html>