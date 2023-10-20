<%-- 
    Document   : EditDesign
    Created on : Oct 20, 2023, 8:50:39 AM
    Author     : Nguyen Ba Tung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!----======== CSS ======== -->
    <link rel="stylesheet" href="css\EditDesign.css">

    <!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <title>EditDesign</title>
</head>

<body>
    <c:url var="logout_query" value="MainController">
        <c:param name="cookiekey" value="" />
        <c:param value="Log Out" name="btAction" />
    </c:url>
    <c:url var="productionList" value="MainController">
        <c:param value="SearchCage" name="btAction" />
    </c:url>
    <c:set var="CageID" value="${param.txtCageID}"></c:set>
    <c:set var="Design" value="${requestScope.DESIGN_PROCESS}"></c:set>
    <nav>

        <div class="logo-name">
            <div class="logo-image">
                <img src="images/logo.png" alt="">
            </div>

            <span class="logo_name">${sessionScope.USER.getName()}</span>
        </div>

        <div class="menu-items">
            <ul class="nav-links">
                <li><a href="#">
                        <i class="uil uil-estate"></i>
                        <span class="link-name">Dahsboard</span>
                    </a></li>
                <li><a href="MainController?btAction=Order">
                        <i class="uil uil-bill"></i>
                        <span class="link-name">Order</span>
                    </a></li>
                <li><a href="#">
                        <i class="uil uil-grin"></i>
                        <span class="link-name">Customers</span>
                    </a></li>
                <li><a href="${productionList}">
                        <i class="uil uil-grin"></i>
                        <span class="link-name">Production</span>
                    </a></li>
                <li><a href="#">
                        <i class="uil uil-chart-line"></i>
                        <span class="link-name">Production process</span>
                    </a></li>
                <li><a href="#">
                        <i class="uil uil-clipboard-alt"></i>
                        <span class="link-name">Reports</span>
                    </a></li>
                <li><a href="#">
                        <i class="uil uil-screw"></i>
                        <span class="link-name">Material</span>
                    </a></li>
                <li><a href="#">
                        <i class="uil uil-archive-alt"></i>
                        <span class="link-name">Inventory</span>
                    </a></li>
            </ul>

            <ul class="logout-mode">
                <li><a href="${logout_query}">
                        <i class="uil uil-signout"></i>
                        <span class="link-name">Logout</span>
                    </a></li>

                <li class="mode">
                    <a href="#">
                        <i class="uil uil-moon"></i>
                        <span class="link-name">Dark Mode</span>
                    </a>

                    <div class="mode-toggle">
                        <span class="switch"></span>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
    <section class="dashboard">
        <h1>Desgin</h1>
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Phrase</th>
                        <th>CageID</th>
                        <th>Time Process</th>
                        <th>Description</th>
                        <th>Employee Need</th>
                        <th>Modify</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td>
                            <c:set var="countPhare" value=""></c:set>
                        </td>

                        <td>
                            <input type="hidden" name="txtPhrase" value="" />
                        </td>

                        <td>
                            <input type="hidden" name="txtCageID" value="" />
                        </td>

                        <td>
                            <div class="input-container1">
                                <input placeholder="Time Process" class="input-field" type="number"
                                    name="txtNumberOfEmployee" value="">
                                <span class="input-highlight"></span>
                            </div>
                        </td>

                        <td>
                            <div class="input-container1">
                                <input placeholder="Description" class="input-field" type="text"
                                    name="txtNumberOfEmployee" value="">
                                <span class="input-highlight"></span>
                            </div>
                        </td>

                        <td>
                            <div class="input-container1">
                                <input placeholder="Employee Need" class="input-field" type="number"
                                    name="txtNumberOfEmployee" value="">
                                <span class="input-highlight"></span>
                            </div>
                        </td>

                        <td class="update_button">
                            <button type="submit" value="updateDesign" name="btAction">
                                <i class="fa fa-pencil-square"></i>
                            </button>
                            <!--<button type="submit" value="DeleteDesign" name="btAction">
                                                   Delete
                                              </button>-->
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <c:set var="countPhare" value=""></c:set>
                        </td>

                        <td>
                            <input type="hidden" name="txtPhrase" value="" />
                        </td>

                        <td>
                            <input type="hidden" name="txtCageID" value="" />
                        </td>

                        <td>
                            <div class="input-container1">
                                <input placeholder="Time Process" class="input-field" type="number"
                                    name="txtNumberOfEmployee" value="">
                                <span class="input-highlight"></span>
                            </div>
                        </td>

                        <td>
                            <div class="input-container1">
                                <input placeholder="Description" class="input-field" type="text"
                                    name="txtNumberOfEmployee" value="">
                                <span class="input-highlight"></span>
                            </div>
                        </td>

                        <td>
                            <div class="input-container1">
                                <input placeholder="Employee Need" class="input-field" type="number"
                                    name="txtNumberOfEmployee" value="">
                                <span class="input-highlight"></span>
                            </div>
                        </td>

                        <td class="update_button">
                            <button type="submit" value="updateDesign" name="btAction">
                                <i class="fa fa-pencil-square"></i>
                            </button>
                            <!--<button type="submit" value="DeleteDesign" name="btAction">
                                                   Delete
                                              </button>-->
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <c:set var="countPhare" value=""></c:set>
                        </td>

                        <td>
                            <input type="hidden" name="txtPhrase" value="" />
                        </td>

                        <td>
                            <input type="hidden" name="txtCageID" value="" />
                        </td>

                        <td>
                            <div class="input-container1">
                                <input placeholder="Time Process" class="input-field" type="number"
                                    name="txtNumberOfEmployee" value="">
                                <span class="input-highlight"></span>
                            </div>
                        </td>

                        <td>
                            <div class="input-container1">
                                <input placeholder="Description" class="input-field" type="text"
                                    name="txtNumberOfEmployee" value="">
                                <span class="input-highlight"></span>
                            </div>
                        </td>

                        <td>
                            <div class="input-container1">
                                <input placeholder="Employee Need" class="input-field" type="number"
                                    name="txtNumberOfEmployee" value="">
                                <span class="input-highlight"></span>
                            </div>
                        </td>

                        <td class="update_button">
                            <button type="submit" value="updateDesign" name="btAction">
                                <i class="fa fa-pencil-square"></i>
                            </button>
                            <!--<button type="submit" value="DeleteDesign" name="btAction">
                                                   Delete
                                              </button>-->
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <button class="custom-btn btn-1">New Step</button>

            <table class="tablesorter-custom1" style="display: none;">
                <thead>
                </thead>

                <tbody>
                    <form action="MainController">
                        <tr>
            
                            <td>
                                <div class="input-container">
                                    <input placeholder="Phrase" class="input-field" type="text">
                                    <label for="input-field" class="input-label">Phrase</label>
                                    <span class="input-highlight"></span>
                                </div>
                            </td>

                            <td>
                                <div class="input-container">
                                    <input placeholder="Time Process" class="input-field" type="text">
                                    <label for="input-field" class="input-label">Time Process</label>
                                    <span class="input-highlight"></span>
                                </div>
                            </td>

                            <td>
                                <div class="input-container">
                                    <input placeholder="Description" class="input-field" type="text">
                                    <label for="input-field" class="input-label">Description</label>
                                    <span class="input-highlight"></span>
                                </div>
                            </td>

                            <td>
                                <div class="input-container">
                                    <input placeholder="NumberOfEmployee" class="input-field" type="text">
                                    <label for="input-field" class="input-label">NumberOfEmployee</label>
                                    <span class="input-highlight"></span>
                                </div>
                            </td>

                            <td>
                                <div class="input-container">
                                    <input placeholder="CompletionCage" class="input-field" type="text">
                                    <label for="input-field" class="input-label">CompletionCage</label>
                                    <span class="input-highlight"></span>
                                </div>
                            </td>

                            <td>
                                <input type="hidden" name="txtCageID" value="" />
                                <div class="plus_button">
                                    <button type="submit" value="AddDesignProcess" name="btAction"><i
                                            class="fa fa-plus"></i></button>
                                </div>
                            </td>

                        </tr>
                    </form>
                </tbody>
            </table>
    </section>

    <script src="js\EditDesign.js"></script>

</body>

</html>
