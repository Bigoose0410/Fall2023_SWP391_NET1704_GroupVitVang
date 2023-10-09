<%-- 
    Document   : EditOrder
    Created on : Sep 25, 2023, 8:19:19 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>Order</title>
     </head>
     <body>
          <c:set var="error" value="${requestScope.UPDATE_ORDER_ERROR}"></c:set>
               <div>
               <c:url var="logout_query" value="MainController">
                    <c:param name="cookiekey" value="${sessionScope.USER.getAccountID()}"/>
                    <c:param value="Log Out" name="btAction"/>
               </c:url>
               <a href="${logout_query}">Log Out</a><br>
               <font color="green">
               Welcome, ${sessionScope.USER.getAccountID()}
               </font> <br>
          </div>
          <div>
               <form action="MainController" method="GET">
                    <!--form submit-->
                    ${param.txtOrderID}
                    <input type="hidden" name="txtOrderID" 
                           value="${param.txtOrderID}"/>
                    <br>
                    <input type="date" name="txtStartDate" 
                           value="${param.txtStartDate}"/> 
                    
                    <c:if test="${not empty error.getStartDateAfterEndDateErr()}">
                         ${error.getStartDateAfterEndDateErr()}
                    </c:if>
                    <br>
                    <input type="date" name="txtEndDate" 
                           value="${param.txtEndDate}"/>
                    <br>
                    <input type="text" name="txtAddress" 
                           value="${param.txtAddress}"/>
                    <c:if test="${not empty error.getAddressNullErr()}">
                         ${error.getAddressNullErr()}
                    </c:if>
                    <br>
                    <input type="text" name="txtStatusProgress" 
                           value="${param.txtStatusProgress}"/> 
                    <c:if test="${not empty error.getStatusProgessNullErr()}">
                         ${error.getStatusProgessNullErr()}
                    </c:if>
                    <br>
                    <input type="text" name="txtCustomerID" 
                           value="${param.txtCustomerID}"/>
                    <c:if test="${not empty error.getCustomerFormatErr()}">
                         ${error.getCustomerFormatErr()}
                    </c:if><br>
                    </div>
                    <div>
                         <c:url var="delelteLink" value="MainController">
                              <c:param name="btAction" value="Delete" />
                              <c:param name="pk" value="${param.txtOrderID}"/>
                              <c:param name="lastSearchValue" value="${param.lastSearchValue}" />
                         </c:url>
                         <a href="${delelteLink}">Delete</a>
                    </div>
                    <!--form submit-->
                    <input type="hidden" name="lastSearchValue" 
                           value="${param.lastSearchValue}"/>
                    <input type="submit" name="btAction" value="Update">
               </form>

     </body>
</html>
