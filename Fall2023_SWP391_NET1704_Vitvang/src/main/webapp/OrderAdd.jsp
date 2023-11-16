
<%-- 
    Document   : orderAdd
    Created on : Sep 29, 2023, 10:11:22 AM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html>
<html lang="en">
     <head>
          <meta charset="UTF-8">
          <meta http-equiv="X-UA-Compatible" content="IE=edge">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">

          <!----======== CSS ======== -->
          <link rel="stylesheet" href="css/AddOrder.css">

          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

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
               .menu-items .logout-mode {
                    padding-bottom: 100px;
                    border-top: 1px solid var(--border-color);
               }

          </style>
          <title>Order Add</title>
     </head>
     <body>
          <c:url var="logout_query" value="MainController">
               <c:param name="cookiekey" value="${sessionScope.USER.getName()}"/>
               <c:param value="Log Out" name="btAction"/>
          </c:url>
          <c:url var="productionList" value="MainController">
               <c:param value="SearchCage" name="btAction"/>
          </c:url>
          <!-- get error input -->
          <c:set var="errors" value="${requestScope.ADD_ORDER_ERROR}"/>
          <!-- get list product -->
          <c:set var="CageList" value="${sessionScope.CAGE_LIST}"></c:set>
          <c:set var="CusList" value="${sessionScope.CUSTOMER_LIST}"></c:set>
          <c:set var="orderID" value="${requestScope.ORDERID}"></c:set>
               <nav>
                    <div class="logo-name"style="
                         display: block;">
                         <div class="logo-image">
                              <a href="HomePage.html"><img src="img/staff.png" alt=""></a>
                              <span class="logo_name">${sessionScope.USER.getName()}</span>
                    </div>
               </div>

               <div class="menu-items">
                    <ul class="nav-links">
                         <li><a href="MainController?btAction=Search">
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
                    </ul>
               </div>
          </nav>
          <section class="dashboard">
               <h1>PURCHASE</h1>
               <div class="form">

                    <form action="MainController" method="POST" novalidate="novalidate">
                         <fieldset id="info">
                              <legend>Order Info</legend>

                              <label for="customerinput">Customer Name</label>
                              <!--                               <input type="text" id="customerinput" name="customerid" required="required" 
                                                            placeholder="CustomerID" />-->
                              <!--                              <input type="text" id="customerinput" placeholder="CustomerID" name="txtCustomerID"
                                                                   value="${param.txtCustomerID}" />-->
                              <select id="customerinput" class="input-field" name="txtCustomerID">
                                   <c:forEach items="${CusList}" var="cus">
                                        <c:if test="${param.txtCustomerID eq cus.getUserID()}">
                                             <option selected="selected" value="${cus.getUserID()}">
                                                  ${cus.getName()} 
                                             </option>
                                        </c:if>
                                        <c:if test="${param.txtCustomerID ne cus.getUserID()}">
                                             <option value="${cus.getUserID()}">
                                                  ${cus.getName()} 
                                             </option>
                                        </c:if>
                                   </c:forEach>
                              </select>

                              <c:url value="SearchCustomer.jsp" var="searchCustomer">
                                   <c:param name="txtOrderID" value="${param.txtOrderID}" />
                              </c:url>
                              <a class="fa fa-search" href="${searchCustomer}">Customer</a> </br>

                              <div class="input-container">
                                   <label for="startdateinput">Order Date</label>
                                   <fmt:formatDate var="date" value="${now}" pattern="MM-dd-yyyy" />
                                   <!--${date}-->
                                   <input type="text" readonly="true" id="startdateinput" value="${date}"
                                          required="required" />
                              </div>

                              <label for="addressinput">Address</label>
                              <!--                               <input type="text" id="addressinput" name="address" required="required" 
                                                            placeholder="Address" />-->
                              <input type="text" id="addressinput" placeholder="Address" name="txtAddress"
                                     value="${param.txtAddress}" />
                              <c:if test="${not empty errors.getAddressLengthErr()}">
                                   <font color="red">
                                   ${errors.getAddressLengthErr()}
                                   </font>
                              </c:if> <br>
                              <c:if test="${not empty errors.getAddressNumberErr()}">
                                   <font color="red">
                                   ${errors.getAddressNumberErr()}
                                   </font>
                              </c:if><br>
                              <c:if test="${not empty errors.getAddressFormErr()}">
                                   <font color="red">
                                   ${errors.getAddressFormErr()}
                                   </font>
                              </c:if>
                         </fieldset>

                         <fieldset id="cageinfo">
                              <legend>Cage</legend>

                              <table>
                                   <tr>
                                        <td><strong>Name</strong></td>
                                        <td><strong>Quantity</strong></td>
                                        <td><strong>Add</strong></td>
                                   </tr>
                                   <tr>
                                        <td>
                                             <div class="input-container1">
                                                  <select class="input-field" name="txtCageID">
                                                       <c:forEach items="${CageList}" var="cage">
                                                            <option value="${cage.getCageID()}">
                                                                 ${cage.getName()} 
                                                            </option>
                                                       </c:forEach>
                                                  </select>
                                                  <!-- Add more options as needed -->
                                                  </select>
                                                  <span class="input-highlight"></span>
                                             </div>
                                        </td>

                                        <td>
                                             <div class="input-container1">
                                                  <br>
                                                  <input placeholder="Quantity" class="input-field" type="number" min="1"
                                                         name="txtQuantity" value="" oninput="this.value = Math.abs(this.value)"
                                                         >                                                 
                                                  <c:if test="${not empty errors.getQuantityValidErr()}">
                                                       <font color="red">
                                                       ${errors.getQuantityValidErr()}
                                                       </font>
                                                  </c:if>                                                 
                                                  <span class="input-highlight"></span>
                                             </div>
                                        </td>
                                        <td>
                                             <div class="plus_button">
                                                  <button name="btAction" value="addToCart" type="submit"><i
                                                            class="fa fa-shopping-cart"></i></button>
                                             </div>
                                        </td>
                                   </tr>
                                   <!-- Add more rows as needed -->
                                   <c:if test="${not empty errors.getEmptyCartErr()}">
                                        <font color="red">
                                        ${errors.getEmptyCartErr()}
                                        </font>
                                   </c:if>
                              </table>

                              <c:set var="cart" value="${sessionScope.CART}" />
                              <c:set var="cartlist" value="${requestScope.CARTLIST}" />
                              <c:if test="${not empty cart}">
                                   <c:set var="items" value="${cart.getProductItems()}" />
                                   <%--<c:if test="${items != null}">--%>
                                   <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                   <table>
                                        <tr>
                                             <td><strong>No.</strong></td>
                                             <td><strong>Name</strong></td>
                                             <td><strong>Quantity</strong></td>
                                             <td><strong>Remove</strong></td>
                                        </tr>
                                        <tr>
                                             <c:set var="totalprice" value=""></c:set>
                                             <c:forEach items="${cartlist}" var="key" varStatus="counter">
                                             <form action="MainController" method="POST">
                                                  <tr>
                                                       <td>
                                                            ${counter.count}
                                                            .</td>
                                                       <td>
                                                            ${key.getName()}
                                                            <input type="hidden" name="txtOrderCageID" value="${key.getCageID()}" />
                                                       </td>
                                                       <td>
                                                            ${key.getQuantityOrder()}
                                                            <c:set var="totalprice" value="${totalprice +key.getQuantityOrder()* key.getPrice() }"></c:set>
                                                            <input type="hidden" name="${key.getCageID()}" value="${key.getQuantityOrder()}" />
                                                       </td>
                                                       <td>
                                                            <input type="hidden" name="txtOrderID"  value="${param.txtOrderID}" />
                                                            <input type="hidden" name="txtCustomerID" value="${param.txtCustomerID}" />
                                                            <input type="hidden" name="txtAddress" value="${param.txtAddress}"/>
                                                            <input type="hidden" name="txtEndDate" value="${param.txtEndDate}"/>
                                                            <div class="plus_button minus_button">
                                                                 <button type="submit" name="btAction" value="RemoveItemFromCart">
                                                                      <i class="fa fa-minus-square" aria-hidden="true"></i>
                                                                 </button>
                                                            </div>
                                                       </td>
                                                  </tr>
                                             </form>
                                        </c:forEach>
                                        </tr>         
                                   </table>
                                   <p>Total Price: <span style="color: red"><fmt:formatNumber value="${totalprice}" type="number" pattern="#,##0.00" /> ₫</span> </p>
                                   <input type="hidden" name="txtTotalPrice" value="${totalprice}" />
                              </c:if>
                              <%--</c:if>--%>
                         </fieldset>
                         <button name="btAction" value="Create Order" type="submit" class="custom-btn btn-1">
                              Create Order
                         </button>
                    </form>

               </div>
          </section>
     </body>
</html>