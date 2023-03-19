<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>ForgotPassword</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
  
   <form action="forgotPasswordAction.jsp" method="POST">
    <input type="text" name="Email" placeholder="Enter email" required>
    <input type="number" name="PhoneNumber" placeholder="Enter your phone number" required>
    <select name="SecurityQuestion">
     <option value="What's your father's name ?">What's your father's name ?</option>
     <option value="Your favourite anime character ?">Your favourite anime character ?</option>
     <option value="Your favourite serie ?">Your favourite serie ?</option>
    </select>
    <input type="text" name="Answer" placeholder="Enter answer" required>
    <input type="password" name="NewPassword" placeholder="Enter new password" required>
    <input type="submit" value="Save">
   </form>
     
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whyforgotPassword'>
  
  <%
   String msg = request.getParameter("msg");
   if("done".equals(msg)){
   %>
   
<h1>Password Changed Successfully!</h1>
   <%} %>
   
   <%
   if("invalid".equals(msg)){
   %>
<h1>Some thing Went Wrong! Try Again !</h1>
   <%} %>
    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>
</body>
</html>