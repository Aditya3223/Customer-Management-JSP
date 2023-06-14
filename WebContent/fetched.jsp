<%@ include file="connection.jsp" %>
<%
String query1="select * from customerinfo where cid=?";
PreparedStatement ps1=c.prepareStatement(query1);
String id=request.getParameter("id");
ps1.setString(1, id);
ResultSet rst=ps1.executeQuery();
if(rst.next())
{
	%>
	<%@include file="navbar.jsp" %>
	<html>
	<head>
	<title>Edit Customer</title>
	</head>
	<body>
	<form action="fetched-customer-update.jsp" method="post">
		<label>Customer Details</label>
		<table>
			<tr><td>Customer ID:</td><td><%=rst.getString(1)%><input type="hidden" value='<%=rst.getString(1)%>' name="id"></td></tr>
			<tr><td>First Name:</td><td><input type="text" value='<%=rst.getString(2)%>' name="firstname"></td></tr>
			<tr><td>Last Name:</td><td><input type="text" value='<%=rst.getString(3)%>' name="lastname"></td></tr>
			<tr><td>Address:</td><td><input type="text" value='<%=rst.getString(4)%>' name="address"></td></tr>
			<tr><td>Phone:</td><td><input type="text" value='<%=rst.getString(5)%>' name="phone"></td></tr>
			<tr><td>Email:</td><td><input type="text" value='<%=rst.getString(6)%>' name="email"></td></tr>
			<tr><td colspan="2"><button>Update</button></td></tr>
		</table>
	</form>
	</body>
	</html>
	<%	
	return;
}
%>
<jsp:include page ="fetch.jsp" />
<div><label>Customer with id <%=rst.getString(1) %> does not exist</label></div>