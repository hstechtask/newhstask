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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 
<style>
.footer {
  position: fixed;
  left: 0;
  bottom: 0;
  width: 100%;
  background-color: red;
  color: white;
  text-align: center;
}
</style>
</head>
<body>
     <div class="container-fluid">
         <div class="row">
             <div class="col col-lg-12">
             <div class="jumbotron" style=" background-color: #946ffb;">
                   <h2 style="text-align: center;">Welcome to HS Group</h2>
                   <p style="text-align: center;"> Student Panel </p>
                   <h4 style="text-align: center;"> ${loginsuccess } </h4>
             </div>
             </div>
         </div>
          
         <div class="row">
              <div class="col col-lg-3">
              
              </div>
               <div class="col col-lg-6">
                    <h3>Send Remark by Email </h3>
                    <c:forEach var="student" items="${handlers}">
                  <form action="/hstask/sendemail" method="post">
                        <div class="form-group">
                        <label>Sr No.</label>
                        <input type="text" class="form-control" name="id" value="${student.id }"> 
                        </div>
                        <div class="form-group">
                        <label>Task</label>
                        <input type="text" class="form-control" name="task" value="${student.task }"> 
                        </div>
                        <div class="form-group">
                        <label>Task Detail</label>
                        <textarea rows="3" cols="3" name="taskdetail" class="form-control">${student.taskdetail }</textarea>
                        </div>
                        <div class="form-group">
                        <label>Task submit Timing</label>
                        <input type="text" class="form-control" name="tasktime"  value="${student.tasktime }" > 
                        </div>
                        <div class="form-group">
                        <label>Username</label>
                        <input type="text" class="form-control" name="username"  value="${student.username }" > 
                        </div> 
                        <div class="form-group">
                        <label>Remark</label>
                        <textarea rows="3" cols="3" name="remark" class="form-control"></textarea>
                        </div>
                        <div class="form-group">
                        <button class="btn btn-success">Submit</button> 
                        </div>
                  </form>   
                  </c:forEach> 
              </div>
               <div class="col col-lg-3">
              
              </div>
         </div>
     </div>
</body>
</html>