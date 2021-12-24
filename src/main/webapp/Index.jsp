<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Hs Group</title>
<link rel = "icon" href = 
"https://c8.alamy.com/comp/2AP4XBT/letter-hs-logo-design-vector-template-initial-linked-letter-hs-vector-illustration-2AP4XBT.jpg"
		type = "image/x-icon"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="assets\js\bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
  
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <style>
   footer {
      background-color: #474743;
      padding: 25px;
    }           
     pra{
    color: white;
    }    
    .p1 {
  font-family: "Times New Roman", Times, serif;
}  
    </style>
    
</head>
<body>
<div class="container-fluid">
<%-- session management --%>
        
        <c:set var="sessionreg" scope="session" value="${sesreg}"/>  
		<c:choose>
		    <c:when test= "${sessionreg=='success'}">
		        <script>alert('Registration success')</script>
		        <% session.setAttribute("sesreg", null); %>
		    </c:when>
		<c:otherwise>
		    
		</c:otherwise>
		
		</c:choose>
		
		<c:set var="loginsuccess" scope="session" value="${loginsuccess}"/>  
		<c:choose>
		    <c:when test= "${loginsuccess=='login failed'}">
		        <script>alert('Login Failed')</script>
		        <% session.setAttribute("loginsuccess", null); %>
		    </c:when>
		<c:otherwise>
		    
		</c:otherwise>
		</c:choose>
		
		
<!-- navigation bar -->
     <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-9 col-xs-9">
        <nav class="navbar navbar-inverse">
  <div class="container-fluid"></div>
  
    <div class="navbar-header">
    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
       <a class="navbar-brand" href="#" > <img alt="img" src="${pageContext.request.contextPath}\assets\image\hslogo.png"></a>
      <a class="navbar-brand " href="#" class="p1" >Hs Group Software Training and Consultancy </a>
         </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav navbar-right">
      <li><a href="register"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in" data-toggle="modal" data-target="#myModal" >&nbsp;Login</span> </a></li>
       <li><a href="#"><span class="glyphicon glyphicon-log-in" data-toggle="modal" href="#myModal1">&nbsp;Admin Login</span> </a></li>
       
    </ul>
    
  </div>
</nav>
        
   
        </div>
     </div>
     <div class="row">
         <div class="col-lg-12 col-md-12 col-sm-9 col-xs-9"> 
              <img src="${pageContext.request.contextPath}/assets/image/stuwallppr.jpeg" style="width: 100%" >
         
         </div>
     
     </div>
       		<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog" >
  <div class="modal-dialog" class="col-lg-12 col-md-12 col-sm-9 col-xs-9" >

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"> User Login </h4>
      </div>
      <div class="modal-body">
        <form action="dologin" method="post">
				<%
					String username = (String) session.getAttribute("username");
					if(username==null)
					{
						username = "";
					} 
				%>
				<div class="text-danger"><%=username%></div>
				<div class="form-group"> 
        		<label>E-mail Id :</label>
        		<input type="text" name="username" class="form-control" placeholder=" Enter email as username">
        	</div>
        	<div class="form-group">
        		<label>Password :</label>
        		<input type="password" name="password" class="form-control" placeholder="enter password ">
        	</div>
        	<div class="form-group">
        		<button class="btn btn-success" type="submit">Login</button>
        	</div>
        	<div class="form-group">
        		<a href="forgetpass">Forget Password</a> || <a href="changepass"> Change Password </a>
        	</div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
     
     <div id="myModal1" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"> Login Admin Panel</h4>
      </div>
      <div class="modal-body">
        <form action="adminlogin" method="post">
				
				<div class="form-group">
        		<label>UserName :</label>
        		<input type="text" name="username" class="form-control">
        	</div>
        	<div class="form-group">
        		<label>Password :</label>
        		<input type="password" name="password" class="form-control">
        	</div>
        	<div class="form-group">
        		<button class="btn btn-success" type="submit">Login</button>
        	</div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
     
     <!-- Body -->
    <div class="row">
     <div class="col-lg-12 col-md-12 col-sm-9 col-xs-9">
       <footer class="container-fluid text-center">

 <a href="#" class="float-right" style="color: white;text-decoration: none; ">  2020 <i class="far fa-copyright"></i> Hs Group .LTD  All Right reserved</a>
     </footer>
     </div>
     </div>
     </div>
     
   

</body>
</html>