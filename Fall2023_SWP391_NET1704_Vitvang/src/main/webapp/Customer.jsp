<%-- 
    Document   : searchCustomer
    Created on : Oct 3, 1523, 10:52:53 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" href="css/ProductPocess.css">
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
          <link rel="stylesheet" href="css/Cus.css">
          <title>Customer</title>
     </head>
     <body>
          <c:url var="logout_query" value="MainController">
               <c:param name="cookiekey" value="${sessionScope.USER.getName()}"/>
               <c:param value="Log Out" name="btAction"/>
          </c:url>
          <c:url var="productionList" value="MainController">
               <c:param value="SearchCage" name="btAction"/>
          </c:url>
          <c:set var="searchValue" value="${param.txtSearchvalue}" />
          <c:set var="ShowForm" value="${requestScope.SHOW_CUS_CREATE_FORM}" />
          <c:set var="CustomerList" value="${requestScope.SEARCH_CUS_RESULT}"/>s

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
          </nav>
                                        
          <div class="activity">
              
<!--                    <i class="uil uil-bars sidebar-toggle"></i>
                    <div class="search-box">
                         <i class="uil uil-search"></i>
                         <form action="MainController">

                              <input type="text" value="${param.txtSearchValue}" name="txtSearchValue" required="" placeholder="Search here..." class="searchh" >



                              <button class="add-btn" value="Search" name="btAction"></button>
                         </form>
                    </div>
           -->

               
               <div class="title">
                    <span style="margin-left:700px;font-size:30px">Customer Information</span></p>
                    <p style="margin-left:1400px; font-family: inherit"> <!-- SO Luong Khách Hàng -->customer </p>
                    <div id="processing-form" class="customer-table">

                         <section class="dashboard1" class="customer-table">

                              <!--Processing-->


                              <form>
                                   <%--<c:if test="${empty searchValue}">--%>
                                   <c:if test="${not empty CustomerList}">
                                        <table style="width:100%">
                                             <thead style="background:gainsboro">
                                                  <!--                                        <tr class="search1">
                                                                                               <td></td>
                                                                                               <td> <input type="search" data-column="1" placeholder="CustomerID"></td>
                                                                                               <td> <input type="search" data-column="2" placeholder="Name"></td>
                                                                                               <td></td>
                                                                                               <td></td>
                                                                                               <td></td>
                                                                                          </tr>-->
                                                  <tr>
                                                       <th class="data-title" style="text-align: center ;color:red;font-size:18px;padding:24px">|No </th>
                                                       <th class="data-title" style="text-align: center ;color:red;font-size:18px">|Avatar</th>
                                                       <th class="data-title" style="text-align: center ;color:red;font-size:18px">|CustomerID</th>
                                                       <th class="data-title" style="text-align: center ;color:red;font-size:18px">|Name</th>
                                                       <th class="data-title" style="text-align: center ;color:red;font-size:18px">|Sex</th>
                                                          <th class="data-title" style="text-align: center ;color:red;font-size:18px">|Address</th>
                                                       <th class="data-title" style="text-align: center ;color:red;font-size:18px">|PhoneNumber</th>
                                                       
                                                    
<!--                                                       <th class="data-title" style="text-align: center ;color:red;font-size:18px">|Date of Birth</th>-->
                                                       <th class="data-title" style="text-align: center ;color:red;font-size:18px">|Email</th>
                                                       <!--                                   <th class="data-title" style="text-align: center ;color:red;font-size:18px">|OrderID</th>-->
                                                       <!--                                   <th class="data-title" style="text-align: center ;color:red;font-size:18px">|CageID</th>-->
                                                       <!--                                   <th class="data-title" style="text-align: center ;color:red;font-size:18px">|Quantity</th>-->
                                                       <!--                                                                                          <th>OrderDetailStatus</th>-->
                                                       <th class="data-title" style="text-align: center ;color:red;font-size:18px">|View Order</th>

                                                  </tr>

                                             </thead><!--    <hr> -->
                                             <c:set var="count1" value="0" />
                                             <c:forEach items="${CustomerList}" var="dto" varStatus="counter">
                                                  <c:if test="${dto.getRoleID()==4}">
                                                       <!--                                    <div class="activity-data">-->
                                                       <form action="MainController">
                                                            <tr>
                                                                 <td class="data-list" style="font-size:18px;padding:15px;text-align: center;">
                                                                      ${counter.count}
                                                                 </td>
                                                                 <td class="data-list" style="font-size:18px;padding:15px;text-align: center;">
                                                                      <img src="img/download.png" alt="alt"/>
                                                                 </td>
                                                                 <td class="data-list" style="font-size:18px;text-align: center">
                                                                      ${dto.getUserID()}
                                                                      <input type="hidden" name="txtCustomerName" value="${dto.getUserID()}" />
                                                                 </td>
                                                                 <td class="data-list" style="font-size:18px;text-align: center">
                                                                      ${dto.getName()}
                                                                 </td>
                                                                   <td class="data-list" style="font-size:18px;text-align: center">
                                                                      ${dto.getSex()}
                                                                 </td>
                                                                  <td class="data-list" style="font-size:18px;text-align: center">
                                                                      ${dto.getAdress()}
                                                                 </td>
                                                                 <td class="data-list" style="font-size:18px;text-align: center">
                                                                      ${dto.getPhoneNumber()}
                                                                 </td>
                                                               
                                                                
<!--                                                                 <td class="data-list" style="font-size:18px;text-align: center">
                                                                      ${dto.getBirthDate()}
                                                                 </td>-->
                                                                 <td class="data-list" style="font-size:18px;text-align: center">
                                                                      ${dto.getEmail()}
                                                                 </td>
                                                                 <!--                                             <td class="data-list" style="font-size:18px;text-align: center">
                                                                 ${dto.getOrderID()}
                                                                 <input type="hidden" name="txtOrderID" value="${dto.getOrderID()}" />
                                                            </td>-->
                                                                 <!--                                             <td class="data-list" style="font-size:18px;text-align: center">
                                                                 ${dto.getCageID()}
                                                                 <input type="hidden" name="txtCageID" value="${dto.getCageID()}" />
                                                            </td>-->
                                                                 <!--                                             <td class="data-list" style="font-size:18px;text-align: center">
                                                                 ${dto.getQuantity()}
                                                            </td>-->
                                                                 <!--                                                       <td>
                                                                 ${dto.getOrderDetailStatus()}
                                                                 <input type="hidden" name="txtOrderDetailStatus" value="${dto.getOrderDetailStatus()}" />
                                                            </td>-->
                                                                 <td class="data-list" style="font-size:18px">
                                                                      <button   type="submit" value="ViewProcessDetail" name="btAction" style="font-size:18px; margin-left: 60px ; border: none; background: white;color:blue"><i class="uil uil-receipt-alt"></i></button>
                                                                 </td>
                                                                 <%--
                                                                 <td>
                                                                      <c:url value="orderAdd.jsp" var="AdddLink">
                                                                           <c:param name="txtCustomerID" value="${dto.getUserID()}"/>
                                                                      </c:url>
                                                                      <span class="data-list"><a href="${AdddLink}">Generate Order</a></span>
                                                                 </td>
                                                                 --%>
                                                            </tr>
                                                       </form>
                                                       </div>
                                                  </c:if>
                                             </c:forEach>
                                        </table>
                                   </c:if>
                                   <hr>
                                   <c:if test="${empty CustomerList}">
                                        <font color="green">
                                        <h2>
                                             There is no Customers!!!
                                        </h2>
                                        </font>
                                   </c:if>
                              </form>
                    </div>
                    </section>
               </div>
          </div>
          <script src="js/ProductProcess.js"></script>
     </body>
</html>