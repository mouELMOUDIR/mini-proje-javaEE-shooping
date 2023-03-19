<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
   String Email = request.getParameter("Email");
   String PhoneNumber = request.getParameter("PhoneNumber");
   String SecurityQuestion = request.getParameter("SecurityQuestion");
   String Answer = request.getParameter("Answer");
   String NewPassword = request.getParameter("NewPassword");
   
   int check=0;
   try{
	   Connection conn = ConnectionProvider.getConn();
	   Statement st = conn.createStatement();
	   ResultSet rs = st.executeQuery("select * from users where email='"+Email+"' and phonenumber='"+PhoneNumber+"' and securityQuestion='"+SecurityQuestion+"' and answer='"+Answer+"'");
	   while(rs.next()){
		   check=1;
		   st.executeUpdate("update users set password='"+NewPassword+"' where email='"+Email+"'");
		   response.sendRedirect("forgotPassword.jsp?msg=done");
	   }
	   if(check == 0){
		   response.sendRedirect("forgotPassword.jsp?msg=invalid");
	   }
		   
   }catch(Exception e){
	   System.out.println(e);
   }

 %>