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
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

  
  <style>
   footer {
      background-color: #474743;
      padding: 25px;
    }           
     pra{
    color: white;
    }      
    </style>
</head>
<body>
<div class="container-fluid">
<%-- session management --%>
        
        <c:set var="sessionreg" scope="session" value="${sesreg}"/>  
		<c:choose>
		    <c:when test= "${sesreg=='success'}">
		        <script>Swal.fire(
		        		  'Good job!',
		        		  'Registration success!',
		        		  'success'
		        		 )</script>
		        <% session.setAttribute("sesreg", null); %>
		    </c:when>
		<c:otherwise>
		    
		</c:otherwise>
		
		</c:choose>
		
		<c:set var="loginsuccess" scope="session" value="${loginsuccess}"/>  
		<c:choose>
		    <c:when test= "${loginsuccess=='login failed'}">
		        <script>Swal.fire(
		        		  'Oops! ',
		        		  'LOGIN FAILED!',
		        		  'error'
		        		)</script>
		        <% session.setAttribute("loginsuccess", null); %>
		    </c:when>
		<c:otherwise>
		    
		</c:otherwise>
		</c:choose>
		
		<c:set var="sessionreg" scope="session" value="${password}"/>  
		<c:choose>
		    <c:when test= "${password=='password'}">
		        <script>alert('password sent successfully')</script>
		        <% session.setAttribute("password", null); %>
		    </c:when>
		<c:otherwise>
		    
		</c:otherwise>
		
		</c:choose>
		
		<c:set var="sessionreg" scope="session" value="${updatepass}"/>  
		<c:choose>
		    <c:when test= "${sessionreg=='updatepass'}">
		        <script>alert('password update successfully')</script>
		        <% session.setAttribute("updatepass", null); %>
		    </c:when>
		<c:otherwise>
		    
		</c:otherwise>
		
		</c:choose>
		
<!-- navigation bar -->
     <div class="row">
        <div class="col col-lg-12">
        <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#"> <img alt="img" src="${pageContext.request.contextPath}\assets\image\hslogo.png"></a>
      <a class="navbar-brand p1" href="#" >Hs Group Software Training and Consultancy </a> 
    </div>
    
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
         <div class="col col-lg-12">
              <img src="${pageContext.request.contextPath}/assets/image/stuwallppr.jpeg" style="width: 100%" >
         
         </div>
     
     </div>
     
       		<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

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
        		<label>E-mail Id:</label>
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
    <div class="modal-content">
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
     <div class="col col-lg-12">
         <footer class="container-fluid text-center">

 <a href="#" class="float-right" style="color: white;text-decoration: none; ">  2020 <i class="far fa-copyright"></i> Hs Group .LTD  All Right reserved</a>
     </footer>
     </div>
     </div>
     </div>
     

</body>
</html>