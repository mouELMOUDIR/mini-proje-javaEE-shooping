<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<% 
   String Name = request.getParameter("Name");
   String Email = request.getParameter("Email");
   String PhoneNumber = request.getParameter("PhoneNumber");
   String SecurityQuestion = request.getParameter("SecurityQuestion");
   String Answer = request.getParameter("Answer");
   String Password = request.getParameter("Password");
   String address = "";
   String city = "";
   String state = "";
   String country = "";
   
   try{
	   Connection conn = ConnectionProvider.getConn();
	   PreparedStatement ps = conn.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?,?)");
	   ps.setString(1,Name);
	   ps.setString(2,Email);
	   ps.setString(3,PhoneNumber);
	   ps.setString(4,SecurityQuestion);
	   ps.setString(5,Answer);
	   ps.setString(6,Password);
	   ps.setString(7,address);
	   ps.setString(8,city);
	   ps.setString(9,state);
	   ps.setString(10,country);
	   ps.executeUpdate();
	   response.sendRedirect("signup.jsp?msg=valid");
   }catch(Exception e){
	   System.out.println(e);
	   response.sendRedirect("signup.jsp?msg=invalid");
   }
%>
   