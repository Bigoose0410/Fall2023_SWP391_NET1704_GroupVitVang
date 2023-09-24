     <%-- 
    Document   : resultOrderSearch
    Created on : Sep 22, 2023, 2:14:45 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>Search</title>
     </head>
     <body>
          <font color="red">
          Welcome, ${sessionScope.USER.getFullName()}
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
                                   <!--<th>Delete</th>-->
                                   <!--<th>Update</th>-->
                              </tr>
                         </thead>
                         <tbody>
                              <c:forEach var="dto" items="${result}" varStatus="counter">
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
                                             <!--${dto.getStartDate()}-->
                                             <input type="date" name="txtStartDate" 
                                                    value="${dto.getStartDate()}"/>
                                        </td>
                                        <td>
                                             <!--${dto.getEndDate()}-->
                                             <input type="date" name="txtEndDate" 
                                                    value="${dto.getEndDate()}"/>
                                        </td>
                                        <td>
                                             ${dto.getTotalPrice()}
                                        </td>
                                        <%--
                                        <td>
                                             <input type="text" name="txtDelivery" 
                                                    value="${dto.getDelivery()}"/>
                                        </td>
                                        --%>
                                        <td>
                                             ${dto.getAddress()}
                                        </td>
                                        <td>
                                             ${dto.getStatusProgress()}
                                        </td>
                                        <%--
                                        <td>
                                             ${dto.getStaffID()}
                                        </td>
                                        --%>
                                        <td>
                                             ${dto.getCustomerID()}
                                        </td>
                                   </tr>
                              </form>
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
