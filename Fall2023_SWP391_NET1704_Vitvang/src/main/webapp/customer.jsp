<%-- 
    Document   : customer
    Created on : Oct 15, 2023, 9:04:59 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>JSP Page</title>
     </head>
     <body>
          <h1>Hello World!</h1>
          <h1>Welcome to customer page </h1>

          <%
             Cookie[] cookie = request.getCookies();
             if (cookie != null) {
                 String username = cookie[cookie.length - 1].getName();
          %>

          <font color ="red">Welcome, <%= username%></font>
          <% } %>
          <c:set var="result" value="${requestScope.USER_RESULT}"></c:set>
          <c:if test="${not empty result}">
               <table>
                    <thead>
                         <tr>UserID</tr>
                         <tr>Name</tr>
                         <tr>PhoneNumber</tr>
                         <tr>Sex</tr>
                         <tr>Address</tr>
                         <tr>Birthdate</tr>
                         <tr>Email</tr>
                         <tr>Username</tr>
                         <tr>Password</tr>
                         <tr>RoleID</tr>
                    </thead>
                    <c:forEach var="dto" items="${result}">
                         <tbody>
                              <tr>${dto.getUserID()}</tr>
                              <tr>${dto.getName()}</tr>
                              <tr>${dto.getPhoneNumber()}</tr>
                              <tr>${dto.getSex()}</tr>
                              <tr>${dto.getAdress()}</tr>
                              <tr>${dto.getBirthDate()}</tr>
                              <tr>${dto.getEmail()}</tr>
                              <tr>${dto.getUsername()}</tr>
                              <tr>${dto.getPassword()}</tr>
                              <tr>${dto.getRoleID()}</tr>

                         </tbody>
                    </c:forEach>
               </table>
s
          </c:if>

     </body>
</html>
