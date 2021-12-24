<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.Format"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<title>Hs Group</title>
<link rel = "icon" href = 
"https://c8.alamy.com/comp/2AP4XBT/letter-hs-logo-design-vector-template-initial-linked-letter-hs-vector-illustration-2AP4XBT.jpg"
		type = "image/x-icon"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  
  
  
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

<meta name="viewport" content="width=device-width, initial-scale=1">


</head>

   <script type="text/javascript">
   function gettime() {
	
	   Format formatter = new SimpleDateFormat("dd/MM/yyyy");
       Long date = session.getLastAccessedTime();
       String datenew = formatter.format(date);
}
   alert('datenew');
         
   </script>
   <%   Format formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
       Long date = session.getLastAccessedTime();
       String datenew = formatter.format(date); 
       
       %>
       <%-- session manage --%>
        <c:set var="sessionreg" scope="session" value="${taskd}"/>  
		<c:choose>
		    <c:when test= "${sessionreg=='taskd'}">
		        <script>alert('your task submited succesfully')</script>
		        <% session.setAttribute("taskd", null); %>
		    </c:when>
		<c:otherwise>
		    
		</c:otherwise>
		
		</c:choose>
<body>
<script>
		$( window ).on( "load", function() {
			$("#usertable1").show();
		$("#remark1").hide();
		
		
	});
	</script>

<script>  
	$(document).ready(function(){  
    $("#remark").click(function(){  
    	$("#usertable1").hide();
    	$("#remark1").show();
    	
    });  
});  
</script>

  <script>  
	$(document).ready(function(){  
    $("#usertable").click(function(){  
    	$("#remark1").hide();
    	$("#usertable1").show();
    	
    });  
});  
</script>
    <div class="container-fluid">
         <div class="row">
             <div class="col col-lg-12">
             <div class="jumbotron" style=" background-color: #f6b937;">
                   <h2 style="text-align: center;" class="p1">Hs Group Software Training and Consultancy</h2>
                   <p style="text-align: center;"  class="p1"> Student Panel </p>
             </div>
             </div>
         </div>
         
       <div class="row">
              <div class="col col-lg-8"></div>
              <div class="col col-lg-4"> <div class="alert alert-success">Welcome &nbsp; ${loginsuccess} &nbsp; <a href="logout"> <button><span class="glyphicon glyphicon-log-out"></span></button> </a> </div> </div>
         </div>
         <div class="row">
         <div class="col col-lg-3">
         <ul class="nav nav-pills nav-stacked">
             <li class="active" id="usertable"><a href="#">Student View</a></li>
             <li><a href="#" id="remark">Your Remark </a></li>
            
             </ul> 
         </div>
             <div class="col col-lg-6" >
               <div id="usertable1">
                   <h3>Submit your Task detail </h3>
                  <form action="taskdetail" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                       
                        <input type="hidden" class="form-control" name="username" value="${loginsuccess }"> 
                        </div>
                        <div class="form-group">
                        <label>Task</label>
                        <input type="text" class="form-control" name="task"> 
                        </div>
                        <div class="form-group">
                        <label>Task Detail</label>
                        <textarea rows="3" cols="3" name="taskdetail" class="form-control"></textarea>
                        </div>
                        <div class="form-group">
                        <label>Task submit Timing</label>
                        <input type="text" class="form-control" name="tasktime" value="<%= datenew %>" onkeyup="gettime()" > 
                        </div>
                        <div class="form-control">
                        <input type="file" name="file" >
                        </div>
                        &nbsp;
                        <div class="form-group">
                        <button class="btn btn-success">Submit</button> 
                        </div>
                  </form>    
               </div>
               <div id="remark1">
                 <a href="remarkby/${loginsuccess}">click here</a>
                 <h2>${loginsuccess}</h2> 
                <input class="form-control" id="myInput" type="text" placeholder="Search..">
                 
                 <table class="table table-responsive table-hover  table-bordered table-striped tableback" id="myTable">
					<tr style="background-color: #ffca0a;"> <th>Task </th><th>Task Work</th><th>Task Time</th><th>Remark</th></tr>
                 <c:forEach var="handler" items="${modaltask }">
                  <tr> <td>${handler.task }</td><td>${handler.taskdetail }</td><td>${handler.tasktime }</td> <td>${handler.remark }</td></tr>
                   </c:forEach>
                 </table>
                 <script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>

              </div>
         </div>
             <div class="col col-lg-3">
             
             </div>
         </div>
         <%-- footer --%>
         <div class="row">
             <div class="col col-lg-12">
            <h4>.</h4>
             </div>
         </div>
         
         
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