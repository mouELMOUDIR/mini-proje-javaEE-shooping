<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
  String id = request.getParameter("id");
  String name = request.getParameter("name");
  String category = request.getParameter("category");
  String price = request.getParameter("price");
  String active = request.getParameter("active");
  
  try{
	  Connection conn = ConnectionProvider.getConn();
	  Statement st = conn.createStatement();
	  st.executeUpdate("UPDATE product set name='"+name+"',category='"+category+"',price='"+price+"',active='"+active+"' WHERE id='"+id+"'");
	  
	  if(active.equals("No")){
		  st.executeUpdate("DELETE FROM cart WHERE product_id='"+id+"' and address is NULL");
	  }
	  response.sendRedirect("allProductEditProduct.jsp?msg=done");
	  
  }catch(Exception e){
	  System.out.println(e);
	  response.sendRedirect("addProductEditProduct.jsp?msg=wrong");
  }
  
  
%>