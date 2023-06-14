<%@ include file="connection.jsp" %>
<%@include file="navbar.jsp" %>
<%
String query1="select * from customerinfo where cid=?";
PreparedStatement ps1=c.prepareStatement(query1);
String id=request.getParameter("id");
ps1.setString(1, id);
ResultSet rst=ps1.executeQuery();
if(rst.next())
{
	%>
	<html>
	<head>
	<title>Edit Customer</title>
	</head>
	<body>
	<form action="fetched-customer-update.jsp" method="post">
		<label>Customer Details</label>
		<table>
			<tr><td>Customer ID:</td><td><%=rst.getString(1)%></td></tr>
			<tr><td>First Name:</td><td><%=rst.getString(2)%></td></tr>
			<tr><td>Last Name:</td><td><%=rst.getString(3)%></td></tr>
			<tr><td>Address:</td><td><%=rst.getString(4)%></td></tr>
			<tr><td>Phone:</td><td><%=rst.getString(5)%></td></tr>
			<tr><td>Email:</td><td><%=rst.getString(6)%></td></tr>
		</table>
	</form>
	</body>
	</html>
	<%	
	return;
}
%>

<div><label>Customer with id <%=rst.getString(1) %> does not exist</label></div>