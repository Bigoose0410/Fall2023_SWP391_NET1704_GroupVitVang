<%-- 
    Document   : header
    Created on : Sep 19, 2023, 10:41:48 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header Page</title>
    </head>
    <body>
        <div>
            <c:url var="logout_query" value="DispatchServlet">
                <c:param name="cookiekey" value="${sessionScope.USER.username}"/>
                <c:param value="Logout" name="btAction" />
            </c:url>
            <a href="${logout_query}">Log Out</a> <br>
        </div>
    </body>
</html>
