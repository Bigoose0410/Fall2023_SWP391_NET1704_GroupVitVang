<%-- 
    Document   : showSearch
    Created on : Sep 22, 2023, 2:14:56 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

     <head>
          <meta charset="UTF-8" />
          <meta name="viewport" content="width=device-width, initial-scale=1.0" />
          <title>Navbar Example</title>
          <link rel="stylesheet" href="css\historyOrder.css" />
     </head>

     <body>
          <c:url var="logout_query" value="MainController">
               <c:param name="cookiekey" value="${sessionScope.USER.getAccountID()}"/>
               <c:param value="Log Out" name="btAction"/>
          </c:url>
          <a href="${logout_query}">Log Out</a><br>
          <font color="green">
          Welcome, ${sessionScope.USER.getAccountID()}
          </font> <br>
          <header>
               <nav class="navbar">
                    <div class="content-navebar">
                         <img
                              src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLEcpRsJfs-3m4K2TdEZM3NQzjQB_fcNoJdQ&usqp=CAU" />
                         <h1 class="logo">VitVang</h1>
                         <ul class="nav-links">
                              <li><a href="#">Home</a></li>
                              <li><a href="#">About</a></li>
                              <li><a href="#">Services</a></li>
                              <li><a href="#">Contact</a></li>
                         </ul>
                    </div>
               </nav>
          </header>
          <div class="container">
               <aside>
                    <ul class="nav-links">
                         <li><a href="#">Dashboard</a></li>
                         <li><a href="#">Orders</a></li>
                         <li><a href="#">Customers</a></li>
                         <li><a href="#">Production process</a></li>
                         <li><a href="#">Reports</a></li>
                         <li><a href="#">Material</a></li>
                         <li><a href="#">Inventory</a></li>
                    </ul>
               </aside>

               <div class="table-content">
                    <table>
                         <thead>
                              <tr>
                                   <th>No.</th>
                                   <th>OrderID</th>
                                   <th>Start Date</th>
                                   <th>End Date</th>
                                   <th>TotalPrice</th>
                                   <th>Address</th>
                                   <th>Status Progress</th>
                                   <th>CustomerID</th>
                                   <th>Edit</th>
                              </tr>
                         </thead>
                         <tbody>
                              <c:set var="searchValue" value="${param.txtSearchValue}"></c:set>
                              <c:if test="${not empty searchValue}">
                                   <c:set var="result" value="${requestScope.SEARCH_RESULT}"></c:set>

                                   <c:forEach var="dto" items="${result}" varStatus="counter">
                                        <c:set var="ender" value="${requestScope.UPDATE_ORDER_ERROR}"></c:set>
                                        <form action="MainController" method="POST">
                                             <tr>
                                                  <td>
                                                  ${counter.count}
                                             </td>
                                             <td>
                                                  ${dto.getOrderID()}
                                                  <input type="hidden" name="txtOrderID" 
                                                         value="${dto.getOrderID()}"/>
                                             </td>
                                             <td>
                                                  <input type="date" name="txtStartDate" 
                                                         value="${dto.getStartDate()}"/>

                                             </td>
                                             <td>
                                                  <input type="date" name="txtEndDate" 
                                                         value="${dto.getEndDate()}"/>
                                             </td>
                                             <td>
                                                  ${dto.getTotalPrice()}
                                             </td>
                                             <td>
                                                  <input type="text" name="txtAddress" 
                                                         value="${dto.getAddress()}"/>
                                             </td>
                                             <td>
                                                  <input type="text" name="txtStatusProgress" 
                                                         value="${dto.getStatusProgress()}"/>
                                             </td>
                                             <td>
                                                  <input type="text" name="txtCustomerID" 
                                                         value="${dto.getCustomerID()}"/>
                                             </td>
                                             <td>
                                                  <c:url var="editlink" value="EditOrder.jsp">
                                                       <c:param name="txtOrderID" value="${dto.getOrderID()}"/>
                                                       <c:param name="txtStartDate" value="${dto.getStartDate()}"/>
                                                       <c:param name="txtEndDate" value="${dto.getEndDate()}"/>
                                                       <c:param name="txtAddress" value="${dto.getAddress()}"/>
                                                       <c:param name="txtStatusProgress" value="${dto.getStatusProgress()}"/>
                                                       <c:param name="txtCustomerID" value="${dto.getCustomerID()}"/>
                                                       <c:param name="lastSearchValue" value="${searchValue}" />
                                                  </c:url> 
                                                  <a href="${editlink}">Edit</a>
                                             </td>
                                        </c:forEach>
                                   </c:if>
                                   </tbody>
                                   </table>
                                   </div>
                              <main>
                                   <div class="main-Info">
                                        <div class="search-container">
                                             <input type="text" name="txtSearchValue" class="form-control" value="${param.txtSearchValue}" placeholder="SearchOrder..." />
                                             <input type="submit" name="btAction" value="Search" class="search-button"/>
                                        </div>
                                        <div class="text-right">
                                             <button class="add-button">Add Order</button>
                                        </div>
                              </main>
                              </div>
                              <div class="footer">
                                   <footer>
                                        <p>&copy; VitVang 2023</p>
                                   </footer>
                              </div>
                              </body>

                              </html>