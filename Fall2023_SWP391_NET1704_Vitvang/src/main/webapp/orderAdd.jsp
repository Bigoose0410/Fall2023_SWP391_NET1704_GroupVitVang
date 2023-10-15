
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
          <link rel="stylesheet" href="css/addOrder_1.css">

          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


          <title>Admin Dashboard Panel</title>
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
                         <li><a href="MainController?btAction=Order">
                                   <i class="uil uil-bill"></i>
                                   <span class="link-name">Order</span>
                              </a></li>
                         <li><a href="#">
                                   <i class="uil uil-grin"></i>
                                   <span class="link-name">Customers</span>
                              </a></li>
                         <li><a href="${productionList}">
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
          <section class="dashboard">
               <div class="top">
                    <div class="add-order-form"> 
                         <main>
                              <h1>NEW ORDER</h1>
                              </br>
                              <form action="MainController" method="get">
                                   <div class="form-group">
                                        <label for="orderId">OrderID</label>
                                        <input type="text" class="form-control" placeholder="OrderID" 
                                               name="txtOrderID" value="${param.txtOrderID}" />
                                        <c:if test="${not empty errors.getOrderIdFormatErr()}">
                                             <font color ="red">
                                             ${errors.getOrderIdFormatErr()}
                                             </font>
                                        </c:if>
                                        <c:if test="${not empty errors.getDuplicateOrderIDErr()}">
                                             <font color ="red">
                                             ${errors.getDuplicateOrderIDErr()}
                                             </font>
                                        </c:if>
                                   </div>
                                   <div class="form-group">  
                                        <label for="customerId">CustomerID</label>
                                        <input type="text" class="form-control" placeholder="CustomerID"
                                               name="txtCustomerID" value="${param.txtCustomerID}"/>
                                        <c:if test="${not empty errors.getCustomerNotExistInDatabasErr()}">
                                             <font color ="red">
                                             ${errors.getCustomerNotExistInDatabasErr()}
                                             </font>
                                        </c:if>
                                        <c:if test="${not empty errors.getCustomerIdFormatErr()}">
                                             <font color ="red">
                                             ${errors.getCustomerIdFormatErr()}
                                             </font>
                                        </c:if>
                                        <c:url value="searchCustomer.jsp" var="searchCustomer">
                                             <c:param name="txtOrderID" value="${param.txtOrderID}"/>
                                        </c:url>

                                        <a href="${searchCustomer}">Find or New customer</a>     
                                   </div>

                                   <div class="form-group">
                                        <label for="startDate">StartDate</label> 
                                        <fmt:formatDate var="date" value="${now}" pattern="MM-dd-yyyy" />
                                        ${date}
                                   </div>

                                   <div class="form-group">
                                        <label for="Address">Address</label>
                                        <input type="text" class="form-control" placeholder="Address" name="txtAddress"  value="${param.txtAddress}" />
                                        <c:if test="${not empty errors.getAddressLengthErr()}">
                                             <font color ="red">
                                             ${errors.getAddressLengthErr()}
                                             </font>
                                        </c:if>
                                   </div>
                                   <div class="form-group"> <label>Cage</label> 
                                        <div class="cages"> 
                                             <table border="1">
                                                  <thead>
                                                       <tr>
                                                            <th>Name</th>
                                                            <th>Quanity</th>
                                                            <th>        </th>
                                                       </tr>
                                                  </thead>
                                                  <tbody>
                                                       <tr>

                                                            <td>
                                                                 <select name="txtCageID">
                                                                      <c:forEach items="${CageList}" var="cage">
                                                                           <option value="${cage.getCageID()}">${cage.getName()}</option>
                                                                      </c:forEach>
                                                                 </select>
                                                            </td>
                                                            <td>
                                                                 <input type="number" name="txtQuantity" value="${param.txtQuantity}"
                                                                        placeholder="Quantity Order" min="5" max="100" step="5"/>
                                                                 <c:if test="${not empty errors.getNullQuanityErr()}">
                                                                      <font color ="red">
                                                                      ${errors.getNullQuanityErr()}
                                                                      </font>
                                                                 </c:if>
                                                            </td>
                                                            <td>
                                                                 <input type="hidden"  placeholder="Address" name="txtAddress"  value="${param.txtAddress}" />
                                                                 <button name="btAction" value="addToCart" type="submit">Add</button> 
                                                            </td>
                                                       </tr>
                                                  </tbody>
                                                  <input type="hidden" name="inAddOrder" value="true" />
                                                  <input type="submit" name="btAction" value="View Detail" />
                                             </table>
                                        </div> 
                                        <c:set var="cart" value="${sessionScope.CART}"/>
                                        <c:if test="${not empty cart}">
                                             <h2>Your cart includes</h2>
                                             <!-- 3. Cus  takes items - ngăn chứa đồ-->
                                             <c:set var="items" value="${cart.items}" />
                                             <c:if test="${items != null}">
                                                  <!-- 4. Cus picks each item up - lấy đồ-->
                                                  <table border="1">
                                                       <thead>
                                                            <tr>
                                                                 <th>No.</th>
                                                                 <th>Name</th>
                                                                 <th>Quantity</th>
                                                            </tr>
                                                       </thead>
                                                       <tbody>
                                                            <c:forEach items="${items.keySet()}" var="key" varStatus="counter">
                                                                 <tr>                
                                                                      <td>
                                                                           ${counter.count}
                                                                           .</td>
                                                                      <td>
                                                                           ${key}
                                                                      </td>
                                                                      <td>
                                                                           ${items.get(key)}
                                                                      </td>
                                                                 </tr>
                                                            </c:forEach>
                                                       </tbody>
                                                  </table>
                                             </c:if>
                                        </c:if>
                                   </div>
                                   <div class="form-group">
                                        <button name="btAction" value="Create Order" type="submit">Create Order</button> 
                                   </div>
                              </form>
                         </main> 
                    </div>
               </div>
          </section>
     </body>
</html>