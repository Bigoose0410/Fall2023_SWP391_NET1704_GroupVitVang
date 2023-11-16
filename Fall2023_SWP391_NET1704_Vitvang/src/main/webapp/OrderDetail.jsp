<%-- 
    Document   : OrderDetail
    Created on : Oct 5, 2023, 5:59:00 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <!----======== CSS ======== -->
          <link rel="stylesheet" href="css/OrderrDetail.css">

          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
          <title>Order Detail</title>
     </head>
     <body>
          <!-- log out link -->
          <c:url var="logout_query" value="MainController">
               <c:param name="cookiekey" value="${sessionScope.USER.getName()}"/>
               <c:param value="Log Out" name="btAction"/>
          </c:url>
          <c:url var="productionList" value="MainController">
               <c:param value="SearchCage" name="btAction"/>
          </c:url>
          <c:set var="OrderInfo" value="${requestScope.ORDER}"></c:set>
          <c:set var="ListMatarial" value="${requestScope.CAGE_MATERIAL}"></c:set>
          <c:set var="CageList" value="${requestScope.CAGE_ORDER}"></c:set>
          <c:set var="customer" value="${requestScope.CUS_ORDER}"></c:set>

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
          </nav>

          <!--          <div class="search-box">
                         <i class="uil uil-search"></i>
                         <form action="MainController">
                              <input type="text" value="${param.txtSearchValue}" name="txtSearchValue" required="" placeholder="Search here...">
                              <button class="add-btn" value="Search" name="btAction">Search</button>
                         </form>
                    </div>-->

          <section class="dashboard" style="   "}

                   ">
               <!-- <c:if test="${not empty customer}">
<table class="tablesorter-custom1">
                    <!--Form OrderID
                    <h1>Customer Infomation</h1>
                    <thead>
                         <tr>
                              <th>CusID</th>
                              <th>Name</th>
                              <th>Phone Number</th>
                              <th>Gender</th>
                              <th>Address</th>
                              <th>Birth Date</th>
                              <th>Email</th>
                         </tr>
                    </thead>
                    <tbody>
                         <tr>
                              <td>
                    ${customer.getUserID()}
               </td>
               <td>
                    ${customer.getName()}
               </td>
               <td>
                    ${customer.getPhoneNumber()}
               </td>
               <td>
                    ${customer.getSex()}
               </td>
               <td>
                    ${customer.getAdress()}
               </td>
               <td>
                    ${customer.getBirthDate()}
               </td>
               <td>
                    ${customer.getEmail()}
               </td>
          </tr>
     </tbody>
</table> -->
                    <h1 style="font-size: 30px">Detail</h1>
                    <br>

                    <div style="border-style: outset; padding:10px;width:700px;background-color: white" > 
                         <h1>Order Information </h1>
                         <p> Order : ${OrderInfo.getOrderID()} </p>
                         <br>
                         <hr>
                         <p> <span style="color:blue;font-family: sans-serif">CustomerID: </span>  ${customer.getUserID()}</p>
                         <p> <span style="color:blue"> Name : </span>  ${customer.getName()} </p> <br>
                         <p>   <span style="color:blue"> Phone : </span>  ${customer.getPhoneNumber()} |<span style="color:blue">    Email:</span> ${customer.getEmail()}  <p><br>
                         <p> Billing Address : ${OrderInfo.getAddress()}</p>
                    </div>
               </c:if>


               <!--    <c:if test="${not empty OrderInfo}"> 
                        <table class="tablesorter-custom1">
                    <!--Form OrderID
                    <h1>Order Infomation</h1>
                    <thead>
                         <tr>
                              <th>OrderID</th>
                              <th>StartDate</th>
                              <th>EndDate</th>
                              <th>TotalPrice</th>
                              <th>Address</th>
                              <th>StatusProgress</th>
                         </tr>
                    </thead>
                    <tbody>
                         <tr>
                              <td>
                    ${OrderInfo.getOrderID()}
               </td>
               <td>
                    ${OrderInfo.getStartDate()}
                                   </td>
                                   <td>
                    ${OrderInfo.getEndDate()}
               </td>
               <td>
                    ${OrderInfo.getTotalPrice()}
               </td>
               <td>
                    ${OrderInfo.getAddress()}
               </td>
               <td>
                    ${OrderInfo.getStatusProgress()}
               </td>
          </tr>
     </tbody>
</table>
               </c:if>-->
               <br><!-- comment -->
               <h2 style="">      <span style="margin-right: 500px"> Order: <span style="color:red">#${OrderInfo.getOrderID()}</span></span>  <span  > Total : <span style="color:red"><fmt:formatNumber currencySymbol="₫" value="${OrderInfo.getTotalPrice()}" type="number" pattern="#,##0"  /> ₫</span>
 </span> </h2>
               <br>
               <p> Product: </p>
               <hr>
               <c:if test="${not empty CageList}">

                    <table class="tablesorter-custom1" style="width:70%; background-color:white;border-style: initial">
                         <!--Form CageID-->

                         <thead>
                              <tr>
                                   <!--                                   <th class="data-title" style="text-align: start ;color:black;font-size:20px">CageID</th>-->
                                   <th  class="data-title" style="text-align: start ;color:black;font-size:20px;padding:10px">Name</th>
                                   <th  class="data-title" style="text-align: start ;color:black;font-size:20px">Description</th>
                                   <th  class="data-title" style="text-align: start ;color:black;font-size:20px">Price</th>
                                   <th  class="data-title" style="text-align: start ;color:black;font-size:20px">Process</th>

                                   <th  class="data-title" style="text-align: start ;color:black;font-size:20px">   Material </th>
                              </tr>

                         </thead>

                         <tbody>

                              <c:forEach items="${CageList}" var="cage" varStatus="status">

                                   <tr>
                                        <!--                                        <td style="color:purple">
                                        ${cage.getCageID()}
                                   </td>-->
                                        <td style="font-family: sans-serif">
                                             ${cage.getName()}
                                        </td>
                                        <td>
                                             ${cage.getDescription()}
                                        </td>
                                        <td>
                                              <fmt:formatNumber value="${cage.getPrice()}" type="number" pattern="#,##0" /> ₫
                                        </td>
                                        <td>
                                            <a style="text-decoration: none" href="MainController?txtOrderID=${cage.getDetailOrder()}&txtCageID=${cage.getCageID()}&btAction=ViewProcessDetail">${cage.getStatus()}</a>

                                        </td>
                                        <td> <button id="toggleBtn-${status.index}" style="border:none; outline:none;margin-left:30px;font-size: 20px;color:#0056b3;background-color: white" > <i class="uil uil-eye"></i> <button> </td>
                                                       </tr>
                                                       <tr class="hidden" id="expand-${   status.index}">

                                                            <td colspan="7">
                                                                 <table class="tablesorter-custom1" style="width:100%;  " >
                                                                      <br>
                                                                      <thead >
                                                                      <hr>
                                                                      <!--Form Materia
                                                                      <!--                                        <tr class="search">
                                                                                                                   <td> <input type="search" data-column="0" placeholder="No."></td>
                                                                                                                   <td> <input type="search" data-column="1" placeholder="CageID"></td>
                                                                                                                   <td> <input type="search" data-column="2" placeholder="MaterialID"></td>
                                                                                                                   <td> <input type="search" data-column="3" placeholder="Name"></td>
                                                                                                                   <td> <input type="search" data-column="4" placeholder="Origin"></td>
                                                                                                                   <td> <input type="search" data-column="5" placeholder="Need/Cage"></td>
                                                                                                                   <td> <input type="search" data-column="6" placeholder="Price/Unit"></td>
                                                                                                                   <td> <input type="search" data-column="7" placeholder="Unit"></td>
                                                                                                                   <td> <input type="search" data-column="8" placeholder="Quantity Order"></td>
                                                                                                                   <td> <input type="search" data-column="9" placeholder="Total Quantity"></td>
<td> <input type="search" data-column="10" placeholder="Total Price"></td>
                                                                                                              </tr>-->
                                                                      <tr style="padding:100px">
                                                                           <th class="data-title" style="text-align: start ;color:green;font-size:16px">No</th>

                                                                           <!--                                                                           <th  class="data-title"style="text-align: start ;color:green;font-size:16px">Material ID</th>-->
                                                                           <th  class="data-title"style="text-align: start ;color:green;font-size:16px">Name</th>
                                                                           <th  class="data-title"style="text-align: start ;color:green;font-size:16px">Origin</th>
                                                                           <th  class="data-title"style="text-align: start ;color:green;font-size:16px">Need </th>
                                                                           <!--<th  class="data-title"style="text-align: start ;color:green;font-size:16px">Price </th>-->
                                                                           <th  class="data-title"style="text-align: start ;color:green;font-size:16px">Unit</th>
                                                                           <!--<th  class="data-title"style="text-align: start ;color:green;font-size:16px">Quantity Order</th>-->
                                                                           <!--<th  class="data-title"style="text-align: start ;color:green;font-size:16px">Total Quantity</th>-->
                                                                           <!--<th  style="text-align: start ;color:black;font-size:16px">Total Price</th>-->
                                                                      </tr>
                                                                      </thead>
                                                                      <tbody>
                                                                           <c:forEach var="dto" items="${ListMatarial}" varStatus="counter">
                                                                                <c:if test="${cage.getCageID() eq dto.getCageID() }">
                                                                                     <tr>
                                                                                          <td class="data-list" style="text-align: start ;font-size:15px;color: red;padding:10px">
                                                                                               ${counter.count}
                                                                                          </td>
                                                                                          <!--                                                                                          <td class="data-list" style="text-align: start ;font-size:15px;">
                                                                                          ${dto.getMaterialID()}
                                                                                     </td>-->
                                                                                          <td class="data-list" style="text-align: start ;font-size:15px">
                                                                                               ${dto.getName()}
                                                                                          </td>
                                                                                          <td class="data-list" style="text-align: start ;font-size:15px">
                                                                                               ${dto.getOrigin()}
                                                                                          </td>
                                                                                          <td class="data-list" style="text-align: start ;font-size:18px">
                                                                                               <!--${dto.getQuantityNeed()}-->
                                                                                                <c:set var="totalQuantity"
                                                                                                      value="${dto.getQuantityNeed() * dto.getQuantity() }"></c:set>
                                                                                               ${totalQuantity}
                                                                                          </td>
                                                                                          <%--
                                                                                          <td class="data-list" style="text-align: start ;font-size:15px">
                                                                                               ${dto.getPrice()}
                                                                                          </td>
                                                                                         --%>
                                                                                          <td class="data-list" style="text-align: start ;font-size:15px">
                                                                                               ${dto.getUnit()}
                                                                                          </td>
                                                                                          <%--
                                                                                          <td class="data-list" style="text-align: start ;font-size:15px">
                                                                                               ${dto.getQuantity()}
                                                                                          </td>
                                                                                          --%>
<!--                                                                                          <td class="data-list" style="text-align: start ;font-size:15px">
                                                                                               <%--<c:set var="totalQuantity"--%>
                                                                                                      <%--value="${dto.getQuantityNeed() * dto.getQuantity() }"></c:set>--%>
                                                                                               ${totalQuantity}
                                                                                          </td>-->
                                                                                          <%--
                                                                                          <td class="data-list" style="text-align: start ;font-size:18px"ss>
                                                                                               <c:set var="totalPrice" 
                                                                                                      value="${dto.getPrice() * totalQuantity }"></c:set>
                                                                                               ${totalprice}
                                                                                          </td>
                                                                                          --%>
                                                                                     </tr>

                                                                                </c:if>
                                                                           </c:forEach>
                                                                      </tbody>
                                                                 </table> 
                                                                 <hr>

                                                            </td>


                                                       </tr> 

                                                       </tr>


                                                  </c:forEach>

                                                  </tbody>
                                                  </table>
                                                  <hr>
                                             </c:if> 
                                             <br>
                                             <div style=" width:60%; height: 100px ; background-color: white     ">
                                                  <p>  <span style="margin-right:50px">Order Day:<span style="color: #ff6600">${OrderInfo.getStartDate()}</span> </span> 
                                                       <span style="margin-right:50px">Billing Address:  ${customer.getAdress()} </span>

                                                       <span >Delivery Address: ${OrderInfo.getAddress()} </span></p>
                                             </div>
                                             </section>
                                             <script src="js/OrderMaterial.js"></script>
                                             </body>
                                             </html>
