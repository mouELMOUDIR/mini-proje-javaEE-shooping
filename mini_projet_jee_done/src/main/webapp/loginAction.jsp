<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<% 
   String Email = request.getParameter("Email");
   String Password = request.getParameter("Password");
   
   if("admin@gmail.com".equals(Email) && "admin123".equals(Password)){
	   session.setAttribute("Email",Email);
	   response.sendRedirect("admin/adminHome.jsp");
   }
   else{
	   int z=0;
	   try{
		   Connection conn = ConnectionProvider.getConn();
		   Statement st = conn.createStatement();
		   ResultSet rs = st.executeQuery("select * from users where email='"+Email+"' and password='"+Password+"'");
		   while(rs.next()){
			   z=1;
			   session.setAttribute("Email",Email);
			   response.sendRedirect("home.jsp");
			   
		   }
		   if(z==0){
			   response.sendRedirect("login.jsp?msg=notexist");
	   }
	   }
	   catch(Exception e){
		   System.out.println(e);
		   response.sendRedirect("login.jsp?msg=invalid");
	   }
	   }
   
   
%>
   