<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<html>
<body>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String userid=request.getParameter("userid");
session.putValue("userid",userid);
String passwor=request.getParameter("passwor");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:5433/postgres","lavanya_users","root123");
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from customers where userid='"+userid+"' and passwor='"+passwor+"'");
try{
rs.next();
if(rs.getString("passwor").equals(passwor)&&rs.getString("userid").equals(userid))
{
out.println("Welcome " +userid);
}
else{
out.println("Invalid passwor or username.");
}
}
catch (Exception e) {
e.printStackTrace();
}
%>