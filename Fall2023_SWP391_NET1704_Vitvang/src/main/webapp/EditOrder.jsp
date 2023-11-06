<%-- 
    Document   : EditOrder
    Created on : Sep 25, 2023, 8:19:19 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
     <head>
          <meta charset="UTF-8">
          <meta http-equiv="X-UA-Compatible" content="IE=edge">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">

          <!----======== CSS ======== -->
          <link rel="stylesheet" href="css/EditOrder.css"/>
          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>Edit Order</title>
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

               <div class="logo-name">
                    <div class="logo-image">
                         <a src="HomePage.html"><img src="img/OIP.jpg" alt=""></a>
                          <span class="logo_name">${sessionScope.USER.getName()}</span>
                    </div>

                   
               </div>

<<<<<<< HEAD
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
                                        <i class="uil uil-clipboard-alt"></i>
                                        <span class="link-name">Production</span>
                                   </a></li>
                              <li ><a href="MainController?btAction=Production process">
                                        <i class="uil uil-chart-line"></i>
                                        <span class="link-name">Production process</span>
                                   </a></li>
<!--                              <li > <a href="#">
                                        <i class="uil uil-clipboard-alt"></i>
                                        <span class="link-name">Reports</span>
                                   </a></li>-->
                              <li ><a href="MainController?btAction=View All Material">
                                        <i class="uil uil-screw"></i>
                                        <span class="link-name">Material</span>
                                   </a></li>
<!--                              <li > <a href="#">
                                        <i class="uil uil-archive-alt"></i>
                                        <span class="link-name">Inventory</span>
                                   </a></li>-->
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
=======
               <div class="menu-items">
                    <ul class="nav-links">
                         <li><a href="MainController?btAction=Search">
                                   <i class="uil uil-bill"></i>>
                                   <span class="link-name">Order</span>
                              </a></li>
                         <li><a href="MainController?btAction=Customers">
                                   <i class="uil uil-grin"></i>
                                   <span class="link-name">Customers</span>
                              </a></li>
                         <li><a href="${productionList}">
                                   <i class="uil uil-grin"></i>
                                   <span class="link-name">Production</span>
                              </a></li>
                         <li><a href="MainController?btAction=Production process">
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
>>>>>>> 5e3c144c3fe79b26c984af5334d6a208df613300

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
               <main>
                    <c:set var="error" value="${requestScope.UPDATE_ORDER_ERROR}"></c:set>
                         <h1>Order Template</h1>
                         <div id="content">
                              <form name="order" id="order" action="MainController" method="post">

                                   <div>
                                        <label for="orderid">OrderID</label>
                                   ${param.txtOrderID}
                                   <input type="hidden" name="txtOrderID" 
                                          value="${param.txtOrderID}"/>
                              </div>

                              <div>
                                   <label for="startdate">StartDate</label>
                                   <input type="date" name="txtStartDate" 
                                          value="${param.txtStartDate}" size="20"/> 
                              </div>

                              <div>
                                   <label for="enddate">EndDate</label>
                                   <input type="date" name="txtEndDate" 
                                          value="${param.txtEndDate}" size="20"/>

                                   <c:if test="${not empty error.getStartDateAfterEndDateErr()}">
                                        <font color = "red">
                                        ${error.getStartDateAfterEndDateErr()}
                                        </font>
                                   </c:if>
                              </div>

                              <div>
                                   <label for="address">Address</label>
                                   <input type="text" name="txtAddress" 
                                          value="${param.txtAddress}" size="40"/>
                                   <c:if test="${not empty error.getAddressNullErr()}">
                                        <font color = "red">
                                        ${error.getAddressNullErr()}
                                        </font>
                                   </c:if>

                              </div>

                              <div>
                                   <fieldset>
                                        <legend id="statusprocess">Status Process</legend>
                                        <select name="txtStatusProgress" id="statusprocess">
                                             <option value="${param.txtStatusProgress}" selected >${param.txtStatusProgress}</option>
                                             <option value="Payment">Payment</option>
                                             <option value="Processing">Processing</option>
                                             <option value="Done">Done</option>
                                        </select>
                                   </fieldset>
                              </div>
                              <div>
                                   <c:if test="${not empty error.getAccountCanNotUpdateErr()}">
                                        <font color = "red">
                                        ${error.getAccountCanNotUpdateErr()}
                                        </font>
                                   </c:if>
                              </div>
                              <input type="hidden" name="lastSearchValue" 
                                     value="${param.lastSearchValue}"/>
                              <input class="update-button" type="submit" name="btAction" value="Update"/>
                              <div>
                                   <c:url var="delelteLink" value="MainController">
                                        <c:param name="btAction" value="Delete" />
                                        <c:param name="pk" value="${param.txtOrderID}"/>
                                        <c:param name="lastSearchValue" value="${param.lastSearchValue}" />
                                   </c:url>
                                   <a href="${delelteLink}">Delete</a>
                              </div>
                         </form>
                    </div>
               </main>
          </section>
          <script src="js/EditOrder.js"></script>
     </body>
</html>
