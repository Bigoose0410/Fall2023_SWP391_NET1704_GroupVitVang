<%-- 
    Document   : StaffCustomerOrder
    Created on : Nov 6, 2023, 11:51:21 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <!----======== CSS ======== -->
          <link rel="stylesheet" href="css/StaffCustomerOrder.css">

          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
          <title>Process</title>
     </head>


     <body>
          <c:url var="logout_query" value="MainController">
               <c:param name="cookiekey" value="" />
               <c:param value="Log Out" name="btAction" />
          </c:url>
          <c:url var="productionList" value="MainController">
               <c:param value="SearchCage" name="btAction"/>
          </c:url>
          <nav>
               <div class="logo-name" style="
                    display: block;">
                    <div class="logo-image">
                         <a src="HomePage.html"><img src="img/OIP.jpg" alt=""></a>
                         <span class="logo_name">${sessionScope.USER.getName()}</span>
                    </div>

                    <div class="menu-items">
                         <ul class="nav-links">
                              <li ><a href="MainController?btAction=Search">
                                        <i class="uil uil-bill"></i>
                                        <span class="link-name">Order</span>
                                   </a></li>
                              <li ><a href="MainController?btAction=Customers">
                                        <i class="uil uil-user"></i>
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

                              <li ><a href="MainController?btAction=View All Material">
                                        <i class="uil uil-screw"></i>
                                        <span class="link-name">Material</span>
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
               <div class="menu-items">
                    <ul class="nav-links">
<!--                         <li><a href="#">
                                   <i class="uil uil-estate"></i>
                                   <span class="link-name">Dahsboard</span>
                              </a></li>-->
                         <li><a href="MainController?btAction=Search">
                                   <i class="uil uil-bill"></i>
                                   <span class="link-name">Order</span>
                              </a></li>
                         <li ><a href="MainController?btAction=Customers">
                                   <i class="uil uil-grin"></i>
                                   <span class="link-name">Customers</span>
                              </a></li>
                         <li><a href="${productionList}">
                                 <i class="uil uil-clipboard-alt"></i>
                                   <span class="link-name">Production</span>
                              </a></li>
                          <li ><a href="MainController?btAction=Production process">
                                   <i class="uil uil-chart-line"></i>
                                   <span class="link-name">Production process</span>
                              </a></li>                       
                         <li ><a href="MainController?btAction=View All Material">
                                   <i class="uil uil-screw"></i>
                                   <span class="link-name">Material</span>
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
          <c:set var="result_cus" value="${requestScope.CUSTOMER_HAVE_ORDER_LIST}" />
          <c:set var="result_order" value="${requestScope.CUSTOMER_ORDER_PROCESS}" />
          <section class="dashboard">
               <c:forEach var="dto" items="${result_cus}" >
                    <div class="information">
                         <div class="icon">
                              <img
                                   src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeTOvWjin0Yv2-jvWIZ95pa3KpJcH4b6Htaw&usqp=CAU">
                         </div>
                         <div class="info">
                              <h2>Information</h2>
                              <form>
                                   <table>
                                        <tr>
                                             <td><label for="CustomerID">CustomerID:</label></td>
                                             <td><i>${dto.getUserID()}</i></td>
                                        <input type="hidden" name="txtUserID" value="${dto.getUserID()}" />

                                        <td><label for="Customer">Customer:</label></td>
                                        <td><i>${dto.getName()}</i></td>
                                        </tr>

                                        <tr>
                                             <td><label for="Email">Email:</label></td>
                                             <td><i>${dto.getEmail()}</i></td>

                                             <td><label for="Phone">Phone Number:</label></td>
                                             <td><i>${dto.getPhoneNumber()}</i></td>
                                        </tr>

                                        <tr>
                                             <td><label for="Sex">Gender:</label></td>
                                             <td><i>${dto.getSex()}</i></td>

                                             <td><label for="Address">Address:</label></td>
                                             <td><i>${dto.getAdress()}</i></td>
                                        </tr>

                                        <tr>
                                             <td><label for="BirthDate">Birth Date:</label></td>
                                             <td><i>${dto.getBirthDate()}</i></td>
                                        </tr>
                                   </table>
                              </form>
                         </div>
                    </div>
               </c:forEach>

               <div class="processing_table">
                    <br/>
                    <h1>Your Order</h1>
                    <br/>
                    <!--Design Processing table-->
                    <div class="table-container1">
                         <table>
                              <thead>
                                   <tr>
                                        <th>No.</th>
                                        <th>Order ID</th>
                                        <th>Cage Name</th>
                                        <th>Status</th>
                                        <th>View Order</th>
                                   </tr>
                              </thead>

                              <tbody>
                                   <c:forEach var="dto1" items="${result_order}" varStatus="counter">
                                        <tr>
                                   <form action="MainController" method="POST">
                                        <td>${counter.count}</td>

                                        <td>${dto1.getOrderID()}</td>
                                        <input type="hidden" name="txtOrderID" value="${dto1.getOrderID()}" />

                                        <td>${dto1.getCageName()}</td>
                                        <input type="hidden" name="txtCageID" value="${dto1.getCageID()}" />

                                        <td>${dto1.getOrderDetailStatus()}</td>
                                        <input type="hidden" name="txtOrdrerDetailStatus" value="${dto1.getOrderDetailStatus()}" />

                                        <td class="view_button">
                                             <button type="submit" value="ViewProcessDetail" name="btAction"><i
                                                       class="fa fa-eye"></i></button>
                                        </td>
                                   </form>
                                   </tr>
                              </c:forEach>
                              </tbody>
                         </table>
                    </div>
               </div>
          </section>

          <script src="Process.js"></script>
     </body>

</html>