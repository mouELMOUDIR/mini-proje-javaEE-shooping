<%@page  import="project.ConnectionProvider"%>
<%@page import="java.sql.*" %>

<%
try{
     Connection conn = ConnectionProvider.getConn();
     Statement st = conn.createStatement();
     String q1 = "create table users(name varchar(80),email varchar(70) primary key,phonenumber bigint,securityQuestion varchar(200),answer varchar(200),password varchar(100),address varchar(100),city varchar(100),state varchar(100),country varchar(100))";
     System.out.println(q1);
     String q2 = "create table product(id int,name varchar(50),category varchar(200),price int,active varchar(10))";
     System.out.println(q2);
     String q3 = "create table cart(email varchar(70),product_id int,quantity int,price int,total int,address varchar(100),city varchar(100),state varchar(100),country varchar(100),phonenumber bigint,orderDate varchar(100),deliveryDate varchar(100),paymentMethod varchar(100),transactionId varchar(100),status varchar(10))";
     System.out.println(q3);
     String q4 = "create table message(id int AUTO_INCREMENT,email varchar(70),subject varchar(100),body varchar(800),PRIMARY KEY(id))";
     
     //st.execute(q1);
     //st.execute(q2);
     //st.execute(q3);
     st.execute(q4);
     System.out.println("Table created");
     conn.close();
     
   }catch(Exception e){
	   System.out.println(e);
   }
     
     
     %>

