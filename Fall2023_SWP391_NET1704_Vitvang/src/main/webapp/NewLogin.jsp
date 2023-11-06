<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ru">
     <head>
          <meta charset="UTF-8" />
          <meta name="viewport" content="width=device-width, initial-scale=1.0" />
          <meta http-equiv="X-UA-Compatible" content="ie=edge" />
          <title>Login</title>
          <link href="css/NewLogin.css" rel="stylesheet" />
     </head>  
     <body>
          <c:set var="Username" value="${param.txtUsername}"/>
          <c:set var="Password" value="${param.txtPassword}"/>
          <c:set var="error" value="${requestScope.LOGIN_ERRORS}"/>
          <div class="a">
               <img src="img\Gold & Cream Modern Abstract Bird Studio Logo (1).png " class="logo">
               <div class="center">
                    <h1>Đăng Nhập</h1>
                    <p class="loginInfo" style="text-align: center; color: rgb(103, 103, 103);">Đăng nhập bằng tài khoản nội bộ hoặc tài khoản được cấp của bạn</p>
                    <br> 
                    <br> 
                    <form action="MainController">
                         <div class="inputbox">
                              <input type="text" name="txtUsername" value="${param.txtUsername}">
                              <c:if test="${not empty error.getIsEmptyUsername()}">
                                   <font style="color: red;">
                                   <!--print out error-->
                                   ${error.getIsEmptyUsername()}
                                   </font><br/>
                              </c:if>
                              <span>Account</span>
                         </div>
                         <div class="inputbox">
                              <input type="password" name="txtPassword" value="${param.txtPassword}">
                              <c:if test="${not empty error.getIsEmptyPassword()}">
                                   <font style="color: red;">
                                   print out error
                                   ${error.getIsEmptyPassword()}
                                   </font><br/>                                                   
                              </c:if>
                              <span>Password</span>
                         </div>
                         <c:if test="${not empty error.getIsWrongAccount()}">
                              <font style="color: red;">
                              <!--print out error-->
                              ${error.getIsWrongAccount()}
                              </font><br/>
                         </c:if>
                         <div class="button" >
                              <input type="hidden" name="lastUsername" value="${Username}" />
                              <input type="hidden" name="lastpassword" value="${Password}" />
                              <button  value="Login" type="submit" class="submit-button" name="btAction" ><span><i class="uil uil-estate"></i></span>Login</button>
                         </div>
<<<<<<< HEAD

                    </form>
                    </body>
                    </html>
=======
                    </form>
               </div>
     </body>
</html>
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
