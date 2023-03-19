<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>

<%
  String msg = request.getParameter("msg");
  if("valid".equals(msg)){
%>

<h3 class="alert">Address Successfully Updated !</h3>
<%} %>

<%
  if("invalid".equals(msg)){
  %>
<h3 class="alert">Some thing Went Wrong! Try Again!</h3>
<%} %>

<%
  try{
	  Connection conn = ConnectionProvider.getConn();
	  Statement st = conn.createStatement();
	  ResultSet rs = st.executeQuery("SELECT * FROM users WHERE email='"+email+"'");
	  while(rs.next()){
		  
%>

<form action="addChangeAddressAction.jsp" method="POST">
<h3>Enter Address</h3>
<input class="input-style" type="text" name="address" placeholder="Enter address" required>
 <hr>
 <h3>Enter city</h3>
 <input class="input-style" type="text" name="city" placeholder="Enter city" required>
<hr>
<h3>Enter State</h3>
<input class="input-style" type="text" name="state" placeholder="Enter state" required>
<hr>
<h3>Enter country</h3>
<input class="input-style" type="text" name="country" placeholder="Enter country" required>
<hr>
 <button class="button" type="submit">Save<i class='far fa-arrow-alt-circle-right'></i></button>
 <%
	  }
  }catch(Exception e){
	  System.out.println(e);
  }
 
 %>
</form>
</body>
<br><br><br>
</html>