<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
  String email = session.getAttribute("Email").toString();
  String status = "processing";
  try{
	  Connection conn = ConnectionProvider.getConn();
	  PreparedStatement ps = conn.prepareStatement("UPDATE cart SET status=? WHERE email=? and status='bill'");
	  ps.setString(1,status);
	  ps.setString(2,email);
	  ps.executeUpdate();
	  response.sendRedirect("home.jsp");
  
  }catch(Exception e){
	  System.out.println(e);
  }



%>