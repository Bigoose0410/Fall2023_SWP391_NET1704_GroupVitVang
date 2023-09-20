<%-- 
    Document   : login
    Created on : Sep 19, 2023, 4:46:01 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Welcome to ProductionManagement</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <c:set var="error" value="${requestScope.LOGIN_ERRORS}"/>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Login</h3></div>
                                    <div class="card-body">
                                        <form action="MainController">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputUsername" name="txtUsername" type="text" placeholder="text"/>
                                                <label for="inputUsername">Username</label>
                                                <c:if test="${not empty error.getIsEmptyUsername()}">
                                                    <font style="color: red;">
                                                    <!--print out error-->
                                                    ${error.getIsEmptyUsername()}
                                                    </font><br/>
                                                </c:if>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputPassword" name="txtPassword" type="password" placeholder="Password" />
                                                <label for="inputPassword">Password</label>
                                                <c:if test="${not empty error.getIsEmptyPassword()}">
                                                    <font style="color: red;">
                                                    <!--print out error-->
                                                    ${error.getIsEmptyPassword()}
                                                    </font><br/>                                                   
                                                </c:if>
                                            </div>
                                            <!--                                            <div class="form-check mb-3">
                                                                                            <input class="form-check-input" id="inputRememberPassword" type="checkbox" value="" />
                                                                                            <label class="form-check-label" for="inputRememberPassword">Remember Password</label>
                                                                                        </div>-->
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <!--<a class="small" href="password.html">Forgot Password?</a>-->
                                                <!--<a class="btn btn-primary" href="index.html">Login</a>-->
                                                <input class="btn btn-primary" type="submit" value="Login" name="btAction" />
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="register.html">Need an account? Sign up!</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Vịt Vàng vô đối 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>