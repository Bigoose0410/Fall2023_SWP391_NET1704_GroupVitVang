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
                                   <th>OrderrID</th>
                                   <th>Start Date</th>
                                   <th>End Date</th>
                                   <th>Price</th>
                                   <th>Delivery</th>
                                   <th>Address</th>
                                   <th>Status Progress</th>
                                   <th>StaffID</th>
                                   <th>CustomerID</th>
                                   <!--<th>Delete</th>-->
                                   <th>Update</th>
                              </tr>
                         </thead>
                         <tbody>
                              <c:forEach var="dto" items="${result}" varStatus="counter">
                              <form action="MainController" method="GET">
                                   <tr>
                                        <td>
                                             ${counter.count}
                                        </td>
                                        <td>
                                             ${dto.getOrderrID()}
                                             <input type="hidden" name="txtOrderID" 
                                                    value="${dto.getOrderrID()}"/>
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
                                             ${dto.getPrice()}
                                        </td>
                                        <td>
                                             <input type="text" name="txtDelivery" 
                                                    value="${dto.getDelivery()}"/>
                                        </td>
                                        <td>
                                            <input type="text" name="txtAđress" 
                                                    value="${dto.getAddress()}"/>
                                             
                                        </td>
                                        <td>
                                             <input type="text" name="txtStatusProcess" 
                                                    value="${dto.getStatusProgress()}"/>
                                             
                                        </td>
                                        <td>
                                             <input type="text" name="txtStaffID" 
                                                    value="${dto.getStaffID()}"/>
                                             
                                        </td>
                                        <td>
                                             <input type="text" name="txtCustomer" 
                                                    value="${dto.getCustomerID()}"/>
                                             
                                        </td>
                                        <td>
                                             <!--form submits-->
                                             <input type="hidden" name="lastSearchValue" value="${searchValue}" />
                                             <input type="submit" name="btAction" value="Update">
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
