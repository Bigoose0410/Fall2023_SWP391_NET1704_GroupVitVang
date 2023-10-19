<%-- 
    Document   : CageDetail
    Created on : Oct 17, 2023, 12:38:56 AM
    Author     : Nguyen Ba Tung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!----======== CSS ======== -->
    <link rel="stylesheet" href="css/CageDetail.css">

    <!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="js/Material.js"></script>

    <title>Material</title>
</head>

<body>
     <c:url var="logout_query" value="MainController">
               <c:param name="cookiekey" value="${sessionScope.USER.getName()}"/>
               <c:param value="Log Out" name="btAction"/>
          </c:url>
          <c:url var="productionList" value="MainController">
               <c:param value="SearchCage" name="btAction"/>
          </c:url>
           <nav>

                    <div class="logo-name"style="
                         display: block;">
                         <div class="logo-image">
                              <a href="HomePage.html"><img src="img/OIP.jpg" alt=""></a>
                              <span class="logo_name">${sessionScope.USER.getName()}</span>
                    </div>
                    <div class="menu-items">
                         <ul class="nav-links">
<!--                              <li ><a href="#">
                                        <i class="uil uil-estate"></i>
                                        <span class="link-name">Dahsboard</span>
                                   </a></li>-->
                              <li ><a href="MainController?btAction=Order">
                                        <i class="uil uil-bill"></i>
                                        <span class="link-name">Order</span>
                                   </a></li>
                              <li ><a href="MainController?btAction=Customers">
                                        <i class="uil uil-bill"></i>
                                        <span class="link-name">Customers</span>
                                   </a></li>
                              <li ><a href="${productionList}">
                                        <i class="uil uil-grin"></i>
                                        <span class="link-name">Production</span>
                                   </a></li>
                              <li ><a href="MainController?btAction=Production process">
                                        <i class="uil uil-chart-line"></i>
                                        <span class="link-name">Production process</span>
                                   </a></li>
                              <li > <a href="#">
                                        <i class="uil uil-clipboard-alt"></i>
                                        <span class="link-name">Reports</span>
                                   </a></li>
                              <li ><a href="#">
                                        <i class="uil uil-screw"></i>
                                        <span class="link-name">Material</span>
                                   </a></li>
                              <li > <a href="#">
                                        <i class="uil uil-archive-alt"></i>
                                        <span class="link-name">Inventory</span>
                                   </a></li>
                         </ul>

                         <ul class="logout-mode">
                              <li><a href="${logout_query}">
                                        <i class="uil uil-signout"></i>
                                        <span class="link-name" >Logout</span>
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
        <!--Form CageID-->
        <div class="section">
            <div class="info">
                <img src="https://i.pinimg.com/750x/d0/ac/19/d0ac190f6cd24a3cf0edaedb49f355e2.jpg" alt="Cage Image">
                <div class="info-details">
                    <div class="info-item">CageID: CG001</div>
                    <div class="info-item">Name: long tang vuong</div>
                    <div class="info-item">Price: 2000</div>
                    <div class="info-item">Origin: VN</div>
                    <div class="info-item">Description: Long vuong chao mao</div>
                    <div class="info-item">
                        Material: Tre, Cửa, Móc,...</br>
                        <button class="toggle-button">
                            <i class="fa fa-plus"></i>
                        </button>
                    </div>
                    <div class="info-item">
                        Step:</br>
                        <button class="toggle-button1">
                            <i class="fa fa-plus"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="dashboard1" style="display: none;">
        <div id="processing-form">
            <button class="toggle-button">
                <i class="fa fa-minus"></i>
            </button>
            <!--Form Material-->
            <h1>Material</h1>

            <table class="tablesorter-custom">
                <thead>
                    <tr>
                        <form class="search-container">
                            <input type="text" id="search-bar" placeholder="Search">
                        </form>
                        <th>No.</th>
                        <th>CageID</th>
                        <th>MaterialID</th>
                        <th>Name</th>
                        <th>Origin</th>
                        <th>Need/Cage</th>
                        <th>Price/Unit</th>
                        <th>Quantity Order</th>
                        <th>Total Quantity</th>
                        <th>Total Price</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td>1</td>
                        <td>CG001</td>
                        <td>MT001</td>
                        <td>Nan tre</td>
                        <td>VN</td>
                        <td>10</td>
                        <td>100</td>
                        <td>cai</td>
                        <td>40</td>
                        <td>400</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>CG001</td>
                        <td>MT002</td>
                        <td>Nep De</td>
                        <td>VN</td>
                        <td>5</td>
                        <td>100</td>
                        <td>Mieng</td>
                        <td>40</td>
                        <td>200</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>CG001</td>
                        <td>MT003</td>
                        <td>Moc treo</td>
                        <td>VN</td>
                        <td>1</td>
                        <td>100</td>
                        <td>cai</td>
                        <td>40</td>
                        <td>40</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>CG001</td>
                        <td>MT004</td>
                        <td>Tru</td>
                        <td>VN</td>
                        <td>6</td>
                        <td>100</td>
                        <td>cai</td>
                        <td>40</td>
                        <td>240</td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td>CG001</td>
                        <td>MT005</td>
                        <td>Cua</td>
                        <td>VN</td>
                        <td>4</td>
                        <td>100</td>
                        <td>cai</td>
                        <td>40</td>
                        <td>160</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>

    <section class="dashboard2" style="display: none;">
        <div id="processing-form">
            <button class="toggle-button1">
                <i class="fa fa-minus"></i>
            </button>
            <!--Form DesignProcess-->
            <h1>DesignProcess</h1>

            <div id="process-form">
                <table class="tablesorter-custom1">
                    <thead>
                        <form class="search-container1">
                            <input type="text" id="search-bar" placeholder="Search">
                        </form>
                        <tr>
                            <th>No.</th>
                            <th>Phrase</th>
                            <th>CageID</th>
                            <th>Time Process</th>
                            <th>Description</th>
                            <th>NumberOfEmployee</th>
                            <th>CompletionCage</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Some Phrase</td>
                            <td>CG001</td>
                            <td>2 hours</td>
                            <td>Some description</td>
                            <td>5</td>
                            <td>Yes</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Some Phrase</td>
                            <td>CG001</td>
                            <td>4 hours</td>
                            <td>Some description</td>
                            <td>3</td>
                            <td>Yes</td>
                        </tr>
                    </tbody>

                </table>
            </div>
        </div>
    </section>

    <button class="custom-btn btn-1">Continuous</button>

    <script src="js/CageDetail.js"></script>
</body>

</html>
