<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
  String email = session.getAttribute("Email").toString();
  String product_id = request.getParameter("id");
  
  try{
	  Connection conn = ConnectionProvider.getConn();
	  Statement st = conn.createStatement();
	  st.executeUpdate("DELETE FROM cart WHERE email='"+email+"' and product_id='"+product_id+"' and address is NULL");
	  response.sendRedirect("myCart.jsp?msg=removed");
  
  }catch(Exception e){
	  System.out.println(e);
  }

%>