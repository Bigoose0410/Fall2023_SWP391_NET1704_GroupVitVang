<%-- 
    Document   : NotProgressing
    Created on : Nov 6, 2023, 1:59:54 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <!----======== CSS ======== -->
          <link rel="stylesheet" href="css/Empty.css">

          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
          <title>Not Progressing</title>
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


     <section>
          <!--          <header>
                         <h1>Process Detail<i class="fas fa-cogs"></i></h1>
          
                    </header>-->

          <div class="empty">
               <img src="data:image/png;base64,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" alt="Your Image">
               <h2>
                    <i class="fas fa-exclamation-triangle"></i>
                    Your order is not in processing !!!
                    <i class="fas fa-exclamation-triangle"></i>
               </h2>
               <!--<p>There are no orders in <span class="clutch">here</span>.</p>-->
               <p>
                    <a href="javascript:history.back()" class="button">
                         <i class="fas fa-arrow-circle-left"></i>
                         BACK
                    </a>
               </p> 
          </div>
     </section>

     <script src="ProcessDetail.js"></script>
</body>

</html>
