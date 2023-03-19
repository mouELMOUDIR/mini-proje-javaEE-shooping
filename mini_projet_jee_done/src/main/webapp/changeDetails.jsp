<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<title>Change Details</title>
<style>
hr
{width:70%;}</style>
</head>
<body>

<%
  try{
	  Connection conn = ConnectionProvider.getConn();
	  Statement st = conn.createStatement();
	  ResultSet rs = st.executeQuery("SELECT * FROM users WHERE email='"+email+"'");
	  while(rs.next()){
  

%>
<h3>Name --->    <%=rs.getString(1) %></h3>
<hr>
 <h3>Email --->     <%=rs.getString(2) %></h3>
 <hr>
 <h3>Phone Number --->      <%=rs.getString(3) %></h3>
 <hr>
<h3>Security Question --->    <%=rs.getString(4) %></h3>
<hr>
      <br>
      <br>
      <br>

<% 
  }
  }catch(Exception e){
	  System.out.println(e);
  }

%>
</body>
</html>