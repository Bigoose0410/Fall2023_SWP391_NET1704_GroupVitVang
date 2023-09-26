<%-- 
Document   : resultOrderSearch
Created on : Sep 22, 2023, 2:14:45 PM
Author     : Admin
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>Search</title>
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

          <form action="MainController">
               Search Value <input type="text" name="txtSearchValue" 
                                   value="${param.txtSearchValue}" /> <br>
               <input type="submit" name="btAction" value="Search" />
          </form> <br>
          <c:set var="searchValue" value="${param.txtSearchValue}"></c:set>
          <c:if test="${not empty searchValue}">
               <c:set var="result" value="${requestScope.SEARCH_RESULT}"></c:set>
               <c:if test="${not empty result}">
                    <table border="1">
                         <thead>
                              <tr>
                                   <th>No.</th>
                                   <th>OrderID</th>
                                   <th>Start Date</th>
                                   <th>End Date</th>
                                   <th>TotalPrice</th>
                                   <!--<th>Delivery</th>-->
                                   <th>Address</th>
                                   <th>Status Progress</th>
                                   <!--<th>StaffID</th>-->
                                   <th>CustomerID</th>
                                   <th>Edit</th>
                              </tr>
                         </thead>
                         <tbody>
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

                                             <!--<input type="button"onclick="dieu_huong()" name="btEdit" value="Edit" />-->
                                        </td>

                                   </c:forEach>
                                   </tbody>
                                   </table>
                              </c:if>
               <c:if test="${ empty result}">
                              <font color="green">
                              <h2>
                                   No match record!!!
                              </h2>
                              </font>
                         </c:if>
                    </c:if>

                    </body>
                    </html>
