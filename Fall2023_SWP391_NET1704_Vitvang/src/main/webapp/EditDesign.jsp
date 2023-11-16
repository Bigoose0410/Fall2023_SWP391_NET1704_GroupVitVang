<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <!----======== CSS ======== -->
          <link rel="stylesheet" href="css/EditDesign.css">

          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
          <title>Edit Design of Cage</title>
          <style>
               .nav-links li{
                    padding: 20px 0;
               }
               .nav-links {
                    flex: 2 4 auto; /* chi?m kho?ng tr?ng còn l?i */
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
                    padding-bottom: 300px;
                    border-top: 1px solid var(--border-color);
               }
               nav{
                    background-color: var(--box1-color);
               }
          </style>
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
          <c:set var="errorADD" value="${requestScope.ADD_DESIGN_ERR}"></c:set>
               <nav>

                    <div class="logo-name"style="
                         display: block;">
                         <div class="logo-image">
                              <a href="HomePage.html"><img src="img/staff.png" alt=""></a>
                              <span class="logo_name">${sessionScope.USER.getName()}</span>
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
               <h1>Design</h1>
               <h3>Cage Name: <font style="color: red">
                    ${param.txtCageName}
                    </font> </h3>
               <div class="table-container">
                    <table>
                         <thead>
                              <tr>
                                   <th>No.</th>
                                   <th>Phrase</th>
                                   <th>Time Process</th>
                                   <th>Description</th>
                                   <th>Employee Need</th>
                                   <th>Modify</th>
                              </tr>
                         </thead>

                         <tbody>
                              <c:set var="countPhare" value=""></c:set>
                              <c:set var="errorUpdate" value="${requestScope.UPDATE_DESIGN_ERR}"></c:set>
                              <c:set var="errorUpdateInPhrase" value="${requestScope.UPDATE_DESIGN_ERR_IN_PHRASE}"></c:set>
                              <c:forEach var="dto" items="${Design}" varStatus="counter">
                              <form action="MainController" method="POST">
                                   <tr>
                                        <td>
                                             ${counter.count}
                                             <c:set var="countPhare" value="${counter.count}"></c:set>
                                             </td>
                                             <td>
                                             ${dto.getPhrase()}
                                             <input type="hidden" name="txtPhrase" value="${dto.getPhrase()}" />
                                        </td>

                                        <td>
                                             <div class="input-container1">
                                                  <input placeholder="Time Process" class="input-field"
                                                         oninput="this.value = Math.abs(this.value)" type="number"
                                                         name="txtTimeProcess" value="${dto.getTimeProcess()}">
                                                  <span class="input-highlight"></span>
                                                  <c:if test="${not empty errorUpdate.getTimeProcessErr() and dto.getPhrase().equals(errorUpdateInPhrase)}">
                                                       <font color="red">
                                                       ${errorUpdate.getTimeProcessErr()}
                                                       </font>
                                                  </c:if>
                                             </div>
                                        </td>

                                        <td>
                                             <div class="input-container1">
                                                  <input placeholder="Description" class="input-field" type="text"
                                                         name="txtDescription" value="${dto.getDescription()}">
                                                  <span class="input-highlight"></span>
                                                  <div class="error">
                                                       <c:if test="${not empty errorUpdate.getDescriptionLengthErr() and dto.getPhrase().equals(errorUpdateInPhrase)}">
                                                            <font color="red">
                                                            ${errorUpdate.getDescriptionLengthErr()}
                                                            </font>
                                                       </c:if>
                                                  </div>
                                             </div>
                                        </td>

                                        <td>
                                             <div class="input-container1">
                                                  <input placeholder="Employee Need" class="input-field" type="number"
                                                         name="txtNumberOfEmployee" value="${dto.getNumberOfEmployee()}"
                                                         oninput="this.value = Math.abs(this.value)">

                                                  <c:if test="${not empty errorUpdate.getEmployeeFormatErr() and dto.getPhrase().equals(errorUpdateInPhrase)}">
                                                       <font color="red">
                                                       ${errorUpdate.getEmployeeFormatErr()}
                                                       </font>
                                                  </c:if>
                                                  <span class="input-highlight"></span>
                                             </div>
                                        </td>
                                        <td class="update_button">
                                             <input type="hidden" name="txtCageID" value="${dto.getCageID()}" />
                                             <input type="hidden" name="txtCageName" value="${param.txtCageName}" />
                                             <button type="submit" value="updateDesign" name="btAction">
                                                  <i class="fa fa-pencil-square"></i>
                                             </button>
                                        </td>
                                   </tr>
                              </form>
                         </c:forEach>

                         </tbody>
                    </table>
               </div>

               <button class="custom-btn btn-1">Add Phrase</button>
               <c:if test="${not empty errorADD.getDuplicateIDErr()}">
                    <font color="red">
                    <h4>${errorADD.getDuplicateIDErr()}</h4>
                    </font>
               </c:if>
               <c:if test="${not empty errorADD.getTimeProcessErr()}">
                    <font color="red">
                    <h4>${errorADD.getTimeProcessErr()}</h4>
                    </font>
               </c:if>
               <c:if test="${not empty errorADD.getDescriptionLengthErr()}">
                    <font color="red">
                    <h4>${errorADD.getDescriptionLengthErr()}</h4>
                    </font>
               </c:if>
               <c:if test="${not empty errorADD.getEmployeeFormatErr()}">
                    <font color="red">
                    <h4>${errorADD.getEmployeeFormatErr()}</h4>
                    </font>
               </c:if>
               <div class="tablesorter-custom1" style="display: none;">
                    <form action="MainController" method="POST">
                         <div class="step">
                              <div class="step-header">
                                   <h2>New Phrase</h2>
                              </div>

                              <div class="form-step">
                                   <label for="Phrase">Phrase</label>
                                   <div class="input-container">
                                        <input placeholder="Phrase" class="input-field" type="text" name="txtPhrase"
                                               value="${param.txtPhrase}">
                                        <span class="input-highlight"></span>
                                        <div class="error">

                                             <!-- xuat loi trung ID-->

                                        </div>
                                   </div>
                              </div>

                              <div class="form-step">
                                   <label for="Time">Time Process</label>
                                   <div class="input-container">
                                        <input placeholder="Time" class="input-field" type="number" name="txtTimeProcess" min="0"
                                               max="100" value="1" oninput="this.value = Math.abs(this.value)">
                                        <span class="input-highlight"></span>
                                        <!-- xuat loi time process-->

                                   </div>
                              </div>

                              <div class="form-step">
                                   <label for="Description">Description</label>
                                   <div class="input-container">
                                        <input placeholder="Description" class="input-field" type="text" name="txtDescription"
                                               value="${param.txtDescription}">
                                        <span class="input-highlight"></span>
                                        <!-- xuat loi Desscription-->

                                   </div>
                              </div>

                              <div class="form-step">
                                   <label for="username">Number Of Employee</label>
                                   <div class="input-container">
                                        <input placeholder="Employee" class="input-field" type="number" min="0" max="10"
                                               name="txtNumberOfEmployee" value="1" oninput="this.value = Math.abs(this.value)">
                                        <span class="input-highlight"></span>
                                        <!-- xuat loi Number of employee-->
                                   </div>
                              </div>

                              <!--<div class="form-step">-->
                              <label for="username" style="color: red; font-weight: 800">Note:</label>
                              <br>
                              <div class="input-container">
                                   <!--                                        <input placeholder="Employee" class="input-field" type="number" readonly=""
                                                                                  name="txtCompletionCage" value="1" oninput="this.value = Math.abs(this.value)">-->
                                   <h4>"Time process" and "Number of employee" are for 1 cage.</h4>
                                   <h4>Check detail before submit.</h4>
                                   <span class="input-highlight"></span>
                              </div>
                              <!--</div>-->

                              <div class="form-step">

                              </div>

                              <div class="form-step">

                              </div>

                              <div class="form-step">

                              </div>

                              <div class="form-step1">
                                   <input type="hidden" name="txtCageID" value="${CageID}" />
                                   <button class="create-button" type="submit" value="AddDesignProcess"
                                           name="btAction">Create</button>
                              </div>
                    </form>
               </div>
          </div>

          <div class="button_2">
               <a href="MainController?btAction=DetailProduct&txtCageID=${CageID}"><button class="next_button"><i
                              class="fas fa-arrow-right"></i></button></a>
          </div>
     </section>

     <script src="js/EditDesign.js"></script>

</html>

</body>
</html>
