<%-- 
    Document   : Product
    Created on : Oct 10, 2023, 10:26:35 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
     <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">

          <!----===== Iconscout CSS =====--> 
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <!----======== CSS ======== -->
          <link rel="stylesheet" href="css/Product.css">

          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <style>
               .nav-links li{
                    padding: 20px 0;
               }
               .nav-links {
                    flex: 2 4 auto; /* chiếm khoảng trống còn lại */
                    display: flex;
                    flex-direction: column;
                    /*justify-content: space-between;*/
               }
               .menu-items li a .link-name{
                    font-size: 18px;
                    font-weight: 400;
                    color: black;
                    transition: var(--tran-05);
               }
               nav .logo-image img {
                    width: 40px;
                    object-fit: cover;
                    border-radius: 50%;
                    margin-left: 35%;
               }
               nav .logo-image {
                    display: flex;
                    flex-direction: column;
                    justify-content: center;
                    min-width: 45px;
               }
               nav .logo-name .logo_name {
                    font-size: 25px;
                    font-weight: 600;
                    /* color: var(--text-color); */
                    /* margin-right: 30px; */
                    background-color: transparent;
                    border: none;
                    transition: var(--tran-05);
                    justify-content: center;
                    padding-left: 20px;
               }
               .menu-items .logout-mode{
                    padding-bottom: 100px;
                    border-top: 1px solid var(--border-color);
               }
               nav{
                    background-color: var(--box1-color);
               }
          </style>
          <title>Production</title>
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

               <div class="logo-name" style="display: block;">

                    <div class="logo-image">
                         <a href="HomePage.html"><img src="img/staff.png" alt=""></a>
                         <span class="logo_name">${sessionScope.USER.getName()}</span>
                    </div>
               </div>
               <div class="menu-items">
                    <ul class="nav-links">

                         <li ><a href="MainController?btAction=Search">
                                   <i class="uil uil-bill"></i>
                                   <span class="link-name">Order</span>
                              </a></li>
                         <li ><a href="MainController?btAction=Customers">
                                   <i class="uil uil-user"></i>
                                   <span class="link-name">Customers</span>
                              </a></li>
                         <li ><a href="${productionList}">
                                   <i class="uil uil-clipboard-alt"></i>

                                   <span class="link-name">Production</span>
                              </a></li>
                         <li ><a href="MainController?btAction=Production process">
                                   <i class="uil uil-chart-line"></i>
                                   <span class="link-name">Production process</span>
                              </a></li>

                         <li ><a href="MainController?btAction=View All Material">
                                   <i class="uil uil-screw"></i>
                                   <span class="link-name">Material</span>
                              </a></li>

                    </ul>
                    <ul class="logout-mode">
                         <li><a href="${logout_query}">
                                   <i class="uil uil-signout"></i>
                                   <span class="link-name" >Logout</span>
                              </a></li>
                    </ul>
               </div>
          </nav>
          <section class="dashboard">
               <div class="header">
                    <h1>Production List</h1>
                    <div class="search">
                        <form action="MainController" method="POST">
                              <input type="text" placeholder="Search name..." name="txtSearchValue" value="${param.txtSearchValue}" name="txtSearchValue">
                              <button type="submit" value="SearchCage" name="btAction">Search</button>
                         </form>
                         <form action="MainController" method="POST">
                              <button id="addBtn" style="background-color: greenyellow; color:black;margin-left: 30px"
                                      name="btAction" value="FormAddCage"
                                      >Add</button>
                              <input type="hidden" name="txtFormStatus" value="open" />
                         </form>
                    </div>
               </div>
               <c:set var="searchValue" value="${param.txtSearchValue}"></c:set>
               <c:set var="result" value="${requestScope.SEARCH_CAGE_RESULT}"></c:set>
                    <div class="container">
                         <div class="mySwiper">
                         <c:if test="${not empty result}">        
                              <c:forEach var="dto" items="${result}" varStatus="counter">
                                   <form action="MainController" method="POST">
                                        <div class="swiper-slide" id="savanna">
                                             <div class="main">
                                                  <div class="left-side">
                                                       <div class="main-wrapper">
                                                            <h3 class="main-header"> ${dto.getCageID()} </h3>
                                                            <h1 class="main-title"> ${dto.getName()} </h1>
                                                            <h2 class="main-subtitle"><fmt:formatNumber value="${dto.getPrice() * 10000}" type="number" pattern="#,##0" /> ₫ </h2>
                                                       </div>
                                                       <div class="main-content">
                                                            <div class="main-content__title">Come From: ${dto.getOrigin()}
                                                            </div>
                                                            <div class="main-content__subtitle">${dto.getDescription()}</div>
                                                            <input type="hidden" name="txtCageID" value="${dto.getCageID()}"/>
                                                            <input type="hidden" name="txtCageName" value="${dto.getName()}"/>
                                                            <button class="more-menu" name = "btAction" type="submit" value = "DetailProduct"><strong> Detail </strong></button>
                                                       </div>
                                                  </div>
                                                  <div class="center">
                                                       <div class="right-side__img">
                                                            <img class="bottle-bg"
                                                                 src="https://i.pinimg.com/736x/d3/69/81/d36981aa38aec939c776717d0660a0d6.jpg" />
                                                       </div>
                                                  </div>
                                             </div>
                                        </div>
                                   </form>
                              </c:forEach>
                         </c:if>  
                    </div>
               </div>
               <c:set var="error" value="${requestScope.CREATE_CAGE_ERROR}"></c:set>
               <c:set var="ShowForm" value="${requestScope.SHOW_FORM_ADD}"></c:set>
               <c:if test="${not empty ShowForm}">show form</c:if>
               <c:if test="${not empty ShowForm}">
                    <div id="overlay" class="hidden" style=" position: fixed;
                         left: 0;
                         top: 0;
                         width: 100%;
                         height: 100%;
                         background: rgba(0,0,0,0.5);
                         display: block;"></div>
                    <div id="popupForm" >
                         <div class="wrapper">
                              <header>Add New Cage</header>
                              <form action="MainController" method="POST">
                                   <div class="dbl-field">
                                        <div class="field" >
                                             <input type="text" name="txtCageID" placeholder="CageID" value="${param.txtCageID}">
                                             <i class="fa-solid fa-feather"></i>
                                        </div>
                                        <c:if test="${not empty error.getIDFormatErr()}">
                                             <font color="red">
                                             ${error.getIDFormatErr()}
                                             </font>
                                        </c:if>
                                        <c:if test="${not empty error.getIDExistErr()}">
                                             <font color="red">
                                             ${error.getIDExistErr()}
                                             </font>
                                        </c:if>
                                        <div class="field" style="margin-top: 25px">
                                             <input type="text" name="txtCageName" value="${param.txtCageName}" placeholder="Cage name" >
                                             <i class="fa-solid fa-crow"></i>
                                        </div>
                                        <c:if test="${not empty error.getNameLengthErr()}">
                                             <font color="red">
                                             ${error.getNameLengthErr()}
                                             </font>
                                        </c:if>
                                   </div>
                                   <div class="dbl-field">
                                        <div class="field">
                                             <input type="number" name="txtPrice" placeholder="Price" value="${param.txtPrice}" oninput="this.value = Math.abs(this.value)">
                                             <i class="fa-solid fa-dollar-sign"></i>
                                        </div>
                                        <c:if test="${not empty error.getPriceErr()}">
                                             <font color="red">
                                             ${error.getPriceErr()}
                                             </font>
                                        </c:if>
                                   </div>
                                   <div class="dbl-field">
                                        <div class="field" >
                                             <input type="text" name="txtOrigin" value="${param.txtOrigin}" placeholder="Origin">
                                             <i class="fa-solid fa-globe"></i>    
                                        </div>
                                        <c:if test="${not empty error.getOriginLengthErr()}">
                                             <font color="red">
                                             ${error.getOriginLengthErr()}
                                             </font>
                                        </c:if>
                                        <div class="message" style="margin-top:  25px">
                                             <textarea placeholder="Description"  name="txtDescription">${param.txtDescription}</textarea>
                                             <i class="fa-solid fa-pen"></i>
                                        </div>
                                        <c:if test="${not empty error.getDescriptionengthErr()}">
                                             <font color="red">
                                             ${error.getDescriptionengthErr()}
                                             </font>
                                        </c:if>
                                   </div>
                                   <div class="button-area" style="
                                        margin: 25px 0;
                                        display: flex;
                                        align-items: flex-start;
                                        justify-content: space-between;
                                        align-content: space-between;
                                        flex-wrap: wrap;
                                        flex-direction: row-reverse;
                                        ">
                                        <div> <button type="submit" name="btAction" value="AddNewCage">Next</button> </div>
                                        <div><button id="closeBtn" type="submit" name="btAction" value="FormAddCage" >Close</button> </div>
                                        <span></span>
                                   </div>
                              </form>
                         </c:if>
                    </div>


               </div>
          </section>
          <script src="../js/admin.js"></script>

     </body>
</html>   
