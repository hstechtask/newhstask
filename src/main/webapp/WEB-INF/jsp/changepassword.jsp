<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
</head>
<body>
<script >
      function validate()
      {
    	  var pass = document.getElementById("pass").value;
    	  var cpass = document.getElementById("cpass").value;
    	  if(pass==cpass)
    		  {
    		  return true;
    		  }
    	  else
    		  {
    		  alert("password and confirm password does not match");
    		  return false;
    		  
    		  }
      }

</script>
	<div class="container-fluid">
		<div class="row">
			<div class="col col-lg-2">
			</div>
			<div class="col col-lg-8">
			<%
			  String email = request.getParameter("email");
			
			%>
			   <h2>Change password</h2>
				<form action="/hstask/updatepass/${loginsuccess }" method="post" onsubmit="return validate()">
					
					<div class="form-group">
						<input type="hidden" id="email" name="stuEmail" value=" ${loginsuccess }"> 
					</div>
					<div class="form-group">
						<label>password :</label>
						<input type="password" class="form-control" id="pass" name="password"> 
					</div>
					<div class="form-group">
						<label>Change password :</label>
						<input type="password" class="form-control" id="cpass" > 
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-success" class="form-control">Change</button>
					</div>
				</form>
			</div>
			<div class="col col-lg-2">
			
			</div>
			
		</div>
	</div>
</body>
</html>