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
	<div class="container-fluid">
		<div class="row">
			<div class="col col-lg-2">
			</div>
			<div class="col col-lg-8">
			<h2>Change password through Password & Email:  </h2>
				<form action="change" method="post">
					<div class="form-group">
						<label>password :</label>
						<input type="text" class="form-control" name="stuPassword"> 
					</div>
					<div class="form-group">
						<label>Email :</label>
						<input type="email" class="form-control" name="stuEmail"> 
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