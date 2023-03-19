<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
  String email = session.getAttribute("Email").toString();
  String id = request.getParameter("id");
  String incDec = request.getParameter("quantity");
  int price = 0;
  int total = 0;
  int quantity = 0;
  int final_total = 0;
  
  int z = 0;
  try{
	  Connection conn = ConnectionProvider.getConn();
	  Statement st = conn.createStatement();
	  ResultSet rs = st.executeQuery("SELECT * FROM cart where email='"+email+"' and product_id='"+id+"' and address is NULL");
      while(rs.next()){
    	 price=rs.getInt(4);
    	 total=rs.getInt(5);
    	 quantity=rs.getInt(3);
      }
      if(quantity==1 && incDec.equals("dec")){
    	  response.sendRedirect("myCart.jsp?msg=notPossible");
      }else if(quantity!=1 && incDec.equals("dec")){
    	  total = total - price;
    	  quantity=quantity - 1;
    	  st.executeUpdate("UPDATE cart SET total='"+total+"',quantity='"+quantity+"' WHERE email='"+email+"' and product_id='"+id+"' and address is NULL");
    	  response.sendRedirect("myCart.jsp?msg=Dec");
      }
      else{
    	  total = total + price;
    	  quantity = quantity + 1;
    	  st.executeUpdate("UPDATE cart SET total='"+total+"',quantity='"+quantity+"' WHERE email='"+email+"' and product_id='"+id+"' and address is NULL");
    	  response.sendRedirect("myCart.jsp?msg=inc");
      }
      
  }catch(Exception e){
	  System.out.println(e);
	  response.sendRedirect("home.jsp?msg=invalid");
     
	  
  
  }

%>

