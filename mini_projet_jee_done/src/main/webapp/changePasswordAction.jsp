<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
  String email = session.getAttribute("Email").toString();
  String OldPassword = request.getParameter("OldPassword");
  String NewPassword = request.getParameter("NewPassword");
  String ConfirmPassword = request.getParameter("ConfirmNewPassword");
  
  if(!ConfirmPassword.equals(NewPassword)){
	  response.sendRedirect("changePassword.jsp?msg=notMatch");
  }
  else{
	  int check=0;
	  try{
		  Connection conn = ConnectionProvider.getConn();
		  Statement st = conn.createStatement();
		  ResultSet rs = st.executeQuery("SELECT * FROM users WHERE email='"+email+"' and password='"+OldPassword+"'");
		  while(rs.next()){
			  check=1;
			  st.executeUpdate("UPDATE users SET password='"+NewPassword+"' WHERE email='"+email+"'");
			  response.sendRedirect("changePassword.jsp?msg=done");
			  
		  }
		  if(check==0){
			  response.sendRedirect("changePassword.jsp?msg=wrong");
		  }
	  }catch(Exception e){
		  System.out.println(e);
	  }
  }


%>