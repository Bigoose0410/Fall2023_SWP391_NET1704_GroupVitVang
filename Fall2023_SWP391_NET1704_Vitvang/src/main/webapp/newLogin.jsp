<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ru">
     <head>
          <meta charset="UTF-8" />
          <meta name="viewport" content="width=device-width, initial-scale=1.0" />
          <meta http-equiv="X-UA-Compatible" content="ie=edge" />
          <title>WEB BEKS</title>
          <link href="css/login.css" rel="stylesheet" />
     </head>
     <body style="background-image: url('img/a.png')">
          <c:set var="Username" value="${param.txtUsername}"/>
          <c:set var="Password" value="${param.txtPassword}"/>
          <div class="center">
               <h1>Login</h1>
               <form action="MainController">
                    <c:set var="error" value="${requestScope.LOGIN_ERRORS}"/>
                    <div class="inputbox">
                         <input type="text" required="required"  placeholder="text" id="inputUsername" name="txtUsername" value="${param.txtUsername}">
                         <span for="inputUsername">Account</span>
                         <!--error of username-->
                         <c:if test="${not empty error.getIsEmptyUsername()}">
                              <font style="color: red;">
                              <!--print out error-->
                              ${error.getIsEmptyUsername()}
                              </font><br/>
                         </c:if>
                    </div>
                    <div class="inputbox">
                         <input type="password" placeholder="Password" required="required" id="inputPassword" name="txtPassword" value="${param.txtPassword}">
                         <span for="inputPassword" >Password</span>
                         <!--error of password-->
                         <c:if test="${not empty error.getIsEmptyPassword()}">
                              <font style="color: red;">
                              <!--print out error-->
                              ${error.getIsEmptyPassword()}
                              </font><br/>                                                   
                         </c:if>
                         <c:if test="${not empty error.getIsWrongAccount()}">
                              <font style="color: red;">
                              <!--print out error-->
                              ${error.getIsWrongAccount()}
                              </font><br/>                                                   
                         </c:if>
                    </div>
                    <div class="button" >
                       <input type="hidden" name="lastUsername" value="${Username}" />
                         <input type="hidden" name="lastpassword" value="${Password}" />
                         <input class="btn btn-primary" type="submit" value="Login" name="btAction" />
                    </div>
               </form>
          </div>
     </body>
</html>