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
          <link rel="stylesheet" href="css/SearchCustomer.css">
          <style>
               .nav-links li{
                    padding: 20px 0;
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
                    padding-bottom: 30px;
                    border-top: 1px solid var(--border-color);
               }
          </style>
          <title>Search Customer</title>
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

               <div class="logo-name"style="
                    display: block;">
                    <div class="logo-image">
                         <a href="HomePage.html"><img src="img/staff.png" alt=""></a>
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
                         </ul>
                    </div>
          </nav>

          <section class="dashboard">
               <div id="form-all">
                    <div style="display: flex; justify-content: space-between; align-items: center">
                         <div class="search-all">
                              <form action="MainController" method="POST">
                                   <input class="form-control" type="text" value="${param.txtSearchvalue}" 
                                          name="txtSearchvalue" style=" width:400px"placeholder="Search Customer here..." >
                                   <input type="hidden" value="4" name="txtRoleSearch">
                                   <button class="search-button" value="Search Customer" name="btAction"><i class="uil uil-search"></i></button>
                              </form>



                         </div>
                         <form action="MainController" method="POST" style="margin-right:10px">
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
                                                  <th>Customer </th>
                                                  <th>Customer Name</th>
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
                                                            <c:url value="MainController" var="AdddLink">
                                                                 <c:param name="btAction" value="New Order"/>
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

                         <form action="MainController" method="get" style="display:flex; flex-wrap: wrap;justify-content: space-between">

                              <br>
                              <div style="width:48%">
                                   Customer Name
                                   <input type="text" class="form-control" value="${param.txtName}"
                                          placeholder="Customer Name" name="txtName"> <br> 
                                   <c:if test="${not empty errors.getNameLengthErr()}">
                                        <font color = "red">
                                        ${errors.getNameLengthErr()}
                                        </font><br>
                                   </c:if> 
                              </div>

                              <div style="width:48%">
                                   Birth Date
                                   <input type="date" required="required" class="form-control" value="${param.txtBirthDate}"
                                          placeholder="BirthDate" name="txtBirthDate">
                                   <c:if test="${not empty errors.getBirthDateVaildErr()}">
                                        <font color = "red">
                                        ${errors.getBirthDateVaildErr()}
                                        </font><br>
                                   </c:if> 
                              </div>
                              <br>
                              <div style="width:48%;">
                                   Gender:
                                   <br>
                                   <div style="display:flex; align-items: center; height: 80%">
                                        <select name="txtGender" class="form-control" >
                                             <option value="M" selected>Male</option>
                                             <option value="F">Female</option>
                                        </select>
                                   </div>

                              </div>
                              <div style="width:48%">
                                   Phone Number     
                                   <input type="tel" class="form-control" required="required"  value="${param.txtPhoneNumber}"
                                          placeholder="Phone Number" name="txtPhoneNumber">
                                   <c:if test="${not empty errors.getPhoneNumberTypeErr()}">
                                        <font color = "red">
                                        ${errors.getPhoneNumberTypeErr()}
                                        </font><br>
                                   </c:if>    
                              </div>

                              <br>
                              <div style="width:48%">
                                   Email
                                   <input type="email" required="required" class="form-control" value="${param.txtEmail}"
                                          placeholder="Email" name="txtEmail">
                                   <c:if test="${not empty errors.getGmailTypeErr()}">
                                        <font color = "red">
                                        ${errors.getGmailTypeErr()}
                                        </font><br>
                                   </c:if>  
                              </div>
                              <div style="width:100%">

                                   Address

                                   <input type="text" class="form-control" placeholder="Adress" value="${param.txtAdress}"
                                          name="txtAdress">
                                   <c:if test="${not empty errors.getAddressLenghtErr()}">
                                        <font color = "red">
                                        ${errors.getAddressLenghtErr()}
                                        </font> 
                                   </c:if>

                              </div>
                              <br>
                              <div style="width: 100%">
                                   Account Username

                                   <input type="text" class="form-control" value="${param.txtUsername}"
                                          placeholder="Account Username" name="txtUsername">
                                   <br>
                                   <c:if test="${not empty errors.getUsernameLengthErr()}">
                                        <font color = "red">
                                        ${errors.getUsernameLengthErr()}
                                        </font><br>
                                   </c:if>  
                                   Account Password
                                   <c:if test="${not empty errors.getPasswordLengthErr()}">
                                        <font color = "red">
                                        ${errors.getPasswordLengthErr()}
                                        </font><br>
                                   </c:if> 
                                   <input type="password" class="form-control" value="${param.txtPassword}"
                                          placeholder="Account Password" name="txtPassword">
                                   <br>

                                   Confirm Password
                                   <c:if test="${not empty errors.getConfirmNotMatch()}">
                                        <font color = "red">
                                        ${errors.getConfirmNotMatch()}
                                        </font><br>
                                   </c:if> 
                                   <input type="password" class="form-control" placeholder="Confirm Password" name="txtConfirm">

                              </div>
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
</div>
</body>
</html>