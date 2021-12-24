<%@ page import="java.sql.*" %>

<%
	String email = request.getParameter("email");
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
   	 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hsgroupdailywork","root", "");
   	 String sql = "select * from sturegister where email='"+ email+"'";
	 PreparedStatement pst=con.prepareStatement(sql);
	 ResultSet rs=pst.executeQuery();
	 if(rs.next())
		{
			out.println("Email-id already exist"); 
			session.setAttribute("checkemail","Email-Id already exist");		  
		}
		else
			if(email.equalsIgnoreCase(""))
			{
			    	 
			    	out.println("");
	        }
	    else
		{
			session.setAttribute("checkemail", null);
			out.println("new Email-id");
		    	
		}
 	}
	catch(Exception ex){
	//RequestDispatcher rd = request.getRequestDispatcher("error.jsp");	
	//rd.forward(request, response);
		out.println(""+ex);
	}
	
%>