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
<meta name="description" content="Bootstrap.">  
<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">   
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
<script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
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


<script type="text/javascript">
$(document).ready(function(){
    var maxField = 10; //Input fields increment limitation
    var addButton = $('.add_button'); //Add button selector
    var wrapper = $('.field_wrapper'); //Input field wrapper
    var fieldHTML = '<div><input type="text" name="to" class="form-control" value=""/><a href="javascript:void(0);" class="remove_button">&nbsp;&nbsp;Remove</a><br></div>'; //New input field html 
    var x = 1; //Initial field counter is 1
    
    //Once add button is clicked
    $(addButton).click(function(){
        //Check maximum number of input fields
        if(x < maxField){ 
            x++; //Increment field counter
            $(wrapper).append(fieldHTML); //Add field html
        }
    });
    
    //Once remove button is clicked
    $(wrapper).on('click', '.remove_button', function(e){
        e.preventDefault();
        $(this).parent('div').remove(); //Remove field html
        x--; //Decrement field counter
    });
});
</script>
	
	


<%-- session manage --%>
 <c:set var="sessionreg"  value="${sendemail}"/>  
		<c:choose>
		    <c:when test= "${sendemail=='sendemail'}">
		        <script>alert('Remark send Succesully')</script>
		        <% session.setAttribute("sendemail", null); %>
		    </c:when>
		<c:otherwise>
		    
		</c:otherwise>
		
		</c:choose>
		
		<c:set var="sessionreg"  value="${sendattach}"/>  
		<c:choose>
		    <c:when test= "${sendattach=='sendattach'}">
		        <script>alert('Remark send Succesully')</script>
		        <% session.setAttribute("sendattach", null); %>
		    </c:when>
		<c:otherwise>
		    
		</c:otherwise>
		
		</c:choose>
		
		
</head>
<body>
<script>
		$( window ).on( "load", function() {
			$("#usertable1").show();
		$("#remark1").hide();
		$("#sendtask1").hide();
		$("#username").hide();
	});
	</script>

<script>  
	$(document).ready(function(){  
    $("#remark").click(function(){  
    	$("#usertable1").hide();
    	$("#remark1").show();
    	$("#username").show();
    	$("#sendtask1").hide();
    });  
});  
</script>

<script>  
	$(document).ready(function(){  
    $("#sendtask").click(function(){  
    	$("#remark1").hide();
    	$("#usertable1").hide();
    	$("#sendtask1").show();
    	$("#username").hide();
    });  
});  
</script>

  <script>  
	$(document).ready(function(){  
    $("#usertable").click(function(){  
    	$("#remark1").hide();
    	$("#usertable1").show();
    	$("#sendtask1").hide();
    	$("#username").hide();
    });  
});  
</script>

      <div class="container-fluid">
         <div class="row">
             <div class="col col-lg-12">
             <div class="jumbotron" style=" background-color: #f6b937;">
                    <h2 style="text-align: center;" class="p1">Hs Group Software Training and Consultancy</h2>
                   <p style="text-align: center;"  class="p1"> Admin Panel </p>
                   
             </div>
             </div>
         </div>
         <div class="row">
              <div class="col col-lg-8"></div>
            
              <div class="col col-lg-4"> <div class="alert alert-success">Welcome &nbsp; ${loginsuccess} &nbsp;  <a href="logout"> <button data-toggle="tooltip" data-placement="bottom" title="Logouthere "><span class="glyphicon glyphicon-log-out"></span></button> </a> </div> </div>
         </div>
         <div class="row">
             <div class="col col-lg-2">
             <ul class="nav nav-pills nav-stacked">
             <li class="active" id="usertable"><a href="#">Student Task View</a></li>
             <li><a href="#" id="remark">Send Your task</a></li>
               <li><a href="#" id="sendtask"> </a></li>
             </ul> 
             </div>
         
             <div class="col col-lg-6">
             <div id="usertable1">
               <input class="form-control" id="myInput" type="text" placeholder="Search..">
             <table class="table table-responsive table-hover  table-bordered table-striped tableback" id="myTable">
					<tr style="background-color: #ffca0a;"> <th> Sr no.</th><th>Task </th><th>Task Work</th><th>Task Time</th> <th>Username</th> <th>filename</th><th>View Image</th><th>Remark</th><th>Delete</th></tr>
                 <c:forEach var="handler" items="${task }">
                  <tr> <td>${handler.id }</td><td>${handler.task }</td><td>${handler.taskdetail }</td><td>${handler.tasktime }</td> <td> ${handler.username }</td><td> <a> <form action="viewimage/${handler.filename }">  <button type="submit" class="btn btn-success"> <i class="fas fa-eye"></button></form></a></td><td> <img alt="img" src="http://localhost:8080/upl/${handler.filename }" width="100" height="100"></td><td><a href="editremark/${handler.id }"> <button class="btn btn-success"> <i class="fa fa-comments" aria-hidden="true"></i></button> <%--  --%></a></td> <td> <a href="deleteremark/${handler.id }" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span></a></td></tr>
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
                 
                 <div id="remark1">
                      <h3>${loginsuccess }:Send Your Task </h3>    
                      
                      
                     <div class="container-fluid">
                     
             
                 <script>
$(document).ready(function(){
  $("#myInput1").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable1 tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
		<form action="sendEmailAttachment" method="post" enctype="multipart/form-data">
			<div class="field_wrapper">
    				<div>
    				<lable>To</lable>
        				<input type="text" name="to" class="form-control" value=""/>
        					<a href="javascript:void(0);" class="add_button" title="Add field">&nbsp;&nbsp;ADD</a>
   					 </div>
				</div>
		
		<div class="form-group">
				<label> Subject </label>
				<input type="text" name="subject" class="form-control">
			</div>
			<div class="form-group">
				<label> Task Description </label>
				<textarea rows="3" cols="3" class="form-control" name="message"></textarea>
			</div>
			<div class="form-group">
				<label>Attach File </label>
				<input type="file" name="file" class="form-control">
			</div>
			<div class="form-group">
				<button class="btn btn-success" type="submit">Send Email</button>
			</div>
		</form>
	</div>
                       
                 </div>
                 
             </div>
             <div class="col col-lg-4">
                 <div class="row " id="username">
                     <div class="col col-lg-12">
                    
                      <table class="table table-responsive table-hover  table-bordered table-striped tableback" class="container" id="myTable3" class="table table-striped">
					<thead>
					<tr style="background-color: #ffca0a;"> <th>Username</th></tr>
					</thead>
					<tbody>
             <c:forEach var="handler" items="${task2 }">
                  <tr> <td> ${handler.stuEmail }</td> </tr>
                   </c:forEach>
                   
                   </tbody>
                   <script>
$(document).ready(function(){
    $('#myTable3').dataTable();
});
</script>
             </table>
            
                     </div>
                     
                 </div>
             
             </div>
         </div>
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