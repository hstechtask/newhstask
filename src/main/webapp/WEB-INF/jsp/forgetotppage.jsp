<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hs Group</title>
<link rel = "icon" href = 
"https://c8.alamy.com/comp/2AP4XBT/letter-hs-logo-design-vector-template-initial-linked-letter-hs-vector-illustration-2AP4XBT.jpg"
		type = "image/x-icon"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>  
</head>
<body>
      <div class="container-fluid">
          <div class="row">
              <div class="col col-lg-12">
                 <nav class="navbar navbar-inverse">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
     <div class="navbar-header">
      <a class="navbar-brand" href="#"> <img alt="img" src="${pageContext.request.contextPath}\assets\image\hslogo.png"></a>
      <a class="navbar-brand p1" href="#" >Hs Group Software Training and Consultancy </a> 
    </div>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      
       
       </div>
   
    </nav>               
              </div>
          </div>
          
          <div class="row">
              <div class="col col-lg-2">
              
              </div>
              <div class="col col-lg-8">
                 <form action="otpverify" method="post">
                     <c:set  var="updateotp" value="${updateotp }"></c:set>
                           	<c:choose>
		                       <c:when test= "${updateotp=='updateotp'}">
		                      <div class="alert info">Your otp</div>
	                           <% session.setAttribute("sesreg", null); %>
	                    	    </c:when>
		                    <c:otherwise>
		    
		                    </c:otherwise>
		
	                     	</c:choose>
                           <div class="form-group">
                               <input type="hidden" name="username" value="${username}">
                           </div>
                          <div class="form-group">
                              <label>Enter OTP</label>
                              <input type="text" name="newotp" class="form-control">
                          </div>
                          <div class="form-group">
                           <button type="submit" class="btn btn-primary"> Verify</button>
                          </div>
                     </form>
        
        
                  
              </div>
              <div class="col col-lg-2">
              
              </div>
          </div>
          
          
      </div>

</body>
</html>