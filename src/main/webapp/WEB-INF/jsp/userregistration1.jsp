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
    
             <c:set var="sessionreg" scope="session" value="${checkemail}"/>  
		<c:choose>
		    <c:when test= "${checkemail=='checkemail'}">
		        <script>alert('check Your E-mail id ')</script>
		        <% session.setAttribute("checkemail", null); %>
		    </c:when>
		<c:otherwise>
		    
		</c:otherwise>
		
		</c:choose>
           
</head>
<body>


             
<div class="container-fluid">
        <!-- jumbotron sign up -->
        <div class="row">
             <div class="col col-lg-12">
           <div class="jumbotron" style=" background-color: #946ffb; text-align: center;"><h2 class="p1" >Fill The Registration Form </h2></div>
             </div>
        </div>
        <!-- body -->
		<div class="row">
			<div class="col col-lg-2">
			
			</div>
			<div class="col col-lg-8">
				 <h2>Fill The Registration Form</h2>
                     <form action="studentregistration" method="post">
                <div class="form-group">
                    <label>Student Name </label>
                    <input type="text" id="fname" name="stuName"  required  class="form-control">
                </div>
                <div class="form-group">
                    <label>Student Email </label>
                    <input type="email" name="stuEmail"  required  class="form-control" id="email">
                    <small id="checkemail" class="text-danger"></small>
                </div>
                 
                  <div class="form-group">
                    <label>Student Phone </label>
                    <input type="tel" name="stuPhone"  required  class="form-control">
                </div>
                <div class="form-group">
                    <label>Student Password</label> 
                    <input type="password" name="stuPassword"  required  class="form-control">
                </div> 
                <%--                 <div class="form-group">
                     <label>Student Address</label>
                     <textarea rows="3" cols="3" name="stuAddress"  required  class="form-control"></textarea>
                 </div>
                <div class="form-group">
                    <label>Date of Birth </label>
                    <input type="date" name="stuDob"  required  class="form-control">
                </div>
                
                
                 
                 <div class="form-check">
                     <label class="form-check-label" for="defaultCheck1">Select Subject</label>
                 </div>
                  <div class="form-check">             
                      <input type="checkbox" name="subject" value="spring framework" class="form-check-input" id="defaultCheck1">
                      <label>Spring Framework</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                      <input type="checkbox" name="subject" value="core java" class="form-check-input">
                      <label>Core Java</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                      <input type="checkbox" name="subject" value="advanced java" class="form-check-input">
                      <label>Advanced Java</label>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 </div>
                  <div class="form-check">
                     <label class="form-check-label" for="defaultCheck1"  required  >Select Gender</label>
                 </div>
                 <div class="form-check">
                     
                     <label>Male</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="gender" value="male"  required  class="form-check-input">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <label>Female</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="gender" value="female"  required  class="form-check-input">
                 </div>
                 <div class="form-group">
                    <label>Select City </label>
                    <select name="city" class="form-control"  required >
                        <option default="select city">Select any city</option>
                        <option>Nagpur</option>
                        <option>Mumbai</option>
                        <option>Pune</option>
                    </select> 
                </div>
                 --%>
                
                <div class="form-group">
                    <button class="btn btn-warning" type="submit">Register</button>
                </div>
            </form>			
			</div>
			<div class="col col-lg-2">
			</div>
		</div>
		<!-- footer -->
		<br>
		<br>
		<br>
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