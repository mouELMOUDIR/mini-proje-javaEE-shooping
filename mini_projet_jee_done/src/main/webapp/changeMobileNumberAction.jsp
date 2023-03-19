<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
  String email = session.getAttribute("Email").toString();
  String NewPhoneNumber = request.getParameter("NewPhoneNumber");
  String password = request.getParameter("password");
  
  int check =0;
  try{
	  Connection conn = ConnectionProvider.getConn();
	  Statement st = conn.createStatement();
	  ResultSet rs = st.executeQuery("SELECT * FROM users WHERE email='"+email+"' and password='"+password+"'");
	  while(rs.next()){
		  check = 1;
		  st.executeUpdate("UPDATE users SET phonenumber='"+NewPhoneNumber+"' WHERE email='"+email+"'");
		  response.sendRedirect("changeMobileNumber.jsp?msg=done");
		  
	  }
	  if(check == 0)
		  response.sendRedirect("changeMobileNumber.jsp?msg=wrong");
	  
  }catch(Exception e){
	  System.out.println(e);
  }
%>