<%@page import="java.sql.*" %>
<%
Connection c=null;
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	c=DriverManager.getConnection("jdbc:mysql://localhost/advjava","root","mysql");
}
catch(Exception e)
{
	System.out.println(e);
}
%>