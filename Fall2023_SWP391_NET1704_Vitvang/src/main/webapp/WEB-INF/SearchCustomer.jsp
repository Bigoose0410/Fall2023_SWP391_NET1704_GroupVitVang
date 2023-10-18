<%-- 
    Document   : searchCustomer
    Created on : Oct 3, 2023, 10:52:53 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <link rel="stylesheet" href="css/searchCustomer.css">
          <title>BPMS</title>
     </head>
     <body>
          <c:url var="logout_query" value="MainController">
               <c:param name="cookiekey" value="${sessionScope.USER.getName()}"/>
               <c:param value="Log Out" name="btAction"/>
          </c:url>
          <c:set var="searchValue" value="${param.txtSearchvalue}" />
          <c:set var="ShowForm" value="${requestScope.SHOW_CUS_CREATE_FORM}" />
          <c:set var="CustomerList" value="${requestScope.SEARCH_CUS_RESULT}"/>

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
                                   <i class="uil uil-bill"></i>>
                                   <span class="link-name">Order</span>
                              </a></li>
                         <li><a href="#">
                                   <i class="uil uil-grin"></i>
                                   <span class="link-name">Customers</span>
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
               <div id="form-all">
                    <div class="search-all">
                         <form action="MainController" method="POST">
                              <input class="form-control" type="text" value="${param.txtSearchvalue}" 
                                     name="txtSearchvalue" placeholder="Search Customer here..." >
                              <input type="hidden" value="4" name="txtRoleSearch">
                              <button class="search-button" value="Search Customer" name="btAction">Find Customer</button>
                         </form>

                         <form action="MainController" method="POST">
                              <input type="submit" class="show" name="btAction" value="Create New Customer" />
                         </form>
                    </div>

                    <c:if test="${not empty searchValue}">

                         <c:if test="${not empty CustomerList}">
                              <div class="table-container">
                                   <table border="1">
                                        <thead>
                                             <tr>
                                                  <th>No.</th>
                                                  <th>CustomerID</th>
                                                  <th>Name</th>
                                                  <th>Sex</th>
                                                  <th>Address</th>
                                                  <th>Date of Birth</th>
                                                  <th>Email</th>
                                                  <th>Get Order</th>
                                             </tr>
                                        </thead>
                                        <tbody>
                                             <c:forEach items="${CustomerList}" var="dto" varStatus="counter">
                                                  <tr>
                                                       <td>
                                                            ${counter.count}
                                                       </td>
                                                       <td>
                                                            ${dto.getUserID()}
                                                            <input type="hidden" name="txtCustomerName" value="${dto.getUserID()}" />
                                                       </td>
                                                       <td>
                                                            ${dto.getName()}
                                                       </td>
                                                       <td>
                                                            ${dto.getSex()}
                                                       </td>
                                                       <td>
                                                            ${dto.getAdress()}
                                                       </td>
                                                       <td>
                                                            ${dto.getBirthDate()}
                                                       </td>
                                                       <td>
                                                            ${dto.getEmail()}
                                                       </td>
                                                       <td>
                                                            <c:url value="orderAdd.jsp" var="AdddLink">
                                                                 <c:param name="txtCustomerID" value="${dto.getUserID()}"/>
                                                            </c:url>
                                                            <span class="data-list"><a href="${AdddLink}">Generate Order</a></span>
                                                       </td>
                                                  </tr>
                                             </c:forEach>
                                        </tbody>
                                   </table>
                              </div>
                         </c:if>
                         <c:if test="${empty CustomerList}">
                              <h2>
                                   No Match Record!!!
                              </h2>
                         </c:if>
                    </c:if>
                    <c:set var="ShowForm" value="${sessionScope.SHOW_CUS_CREATE_FORM}" />
                    <c:if test="${not empty ShowForm}">
                         <c:set var="errors" value="${requestScope.CREATE_CUS_ERROR}" />

                         <form action="MainController" method="POST">
                              CustomerID 
                              <c:if test="${not empty errors.getCustomerIDFormatErr()}">
                                   <font color = "red">
                                   ${errors.getCustomerIDFormatErr()}
                                   </font><br>
                              </c:if>
                              <c:if test="${not empty errors.getCustomerIDexistErr()}">
                                   <font color = "red">
                                   ${errors.getCustomerIDexistErr()}
                                   </font>
                              </c:if>    
                              <input type="text" class="form-control" value="${param.txtUserID}" 
                                     placeholder="Customer ID" name="txtUserID" >

                              <br>
                              Customer Name
                              <c:if test="${not empty errors.getNameLengthErr()}">
                                   <font color = "red">
                                   ${errors.getNameLengthErr()}
                                   </font><br>
                              </c:if>   
                              <input type="text" class="form-control" value="${param.txtName}"
                                     placeholder="Customer Name" name="txtName"> <br>
                              <!--check customer name-->
                              Phone Number     
                              <input type="tel" class="form-control" required="required"  value="${param.txtPhoneNumber}"
                                     placeholder="Phone Number" name="txtPhoneNumber"> <br>
                              <fieldset>
                                   <select name="txtGender" class="form-control" >
                                        <option value="M" selected>Male</option>
                                        <option value="F">Female</option>
                                   </select>
                              </fieldset> <br>
                              <!--check gender -->
                              Address
                              <c:if test="${not empty errors.getAddressLenghtErr()}">
                                   <font color = "red">
                                   ${errors.getAddressLenghtErr()}
                                   </font><br>
                              </c:if>  
                              <input type="text" class="form-control" placeholder="Adress" value="${param.txtAdress}"
                                     name="txtAdress"> <br>

                              Birth Date
                              <input type="date" required="required" class="form-control" value="${param.txtBirthDate}"
                                     placeholder="BirthDate" name="txtBirthDate">
                              <br>

                              Email
                              <input type="email" required="required" class="form-control" value="${param.txtEmail}"
                                     placeholder="Email" name="txtEmail">
                              <br>

                              Account Username
                              <c:if test="${not empty errors.getUsernameLengthErr()}">
                                   <font color = "red">
                                   ${errors.getUsernameLengthErr()}
                                   </font><br>
                              </c:if>  
                              <input type="text" class="form-control" value="${param.txtUsername}"
                                     placeholder="Account Username" name="txtUsername">
                              <br>

                              Account Password
                              <c:if test="${not empty errors.getPasswordLengthErr()}">
                                   <font color = "red">
                                   ${errors.getPasswordLengthErr()}
                                   </font><br>
                              </c:if> 
                              <input type="text" class="form-control" value="${param.txtPassword}"
                                     placeholder="Account Password" name="txtPassword">
                              <!--check password -->
                              <br>

                              Confirm Password
                              <c:if test="${not empty errors.getConfirmNotMatch()}">
                                   <font color = "red">
                                   ${errors.getConfirmNotMatch()}
                                   </font><br>
                              </c:if> 
                              <input type="text" class="form-control" placeholder="Confirm Password" name="txtConfirm">
                              <br>
                              <button class="btn btn-md btn-primary" name = "btAction" type="submit" value = "New Customer">
                                   Create New customer
                              </button>
                         </form>
                    </c:if>
               </div>
          </section>
     </div>
</body>
</html>