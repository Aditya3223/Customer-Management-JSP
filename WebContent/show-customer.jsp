<%@ include file="connection.jsp" %>
<%@ include file="navbar.jsp" %>
<%
String query="select * from customerinfo";
Statement s=c.createStatement();
ResultSet rst=s.executeQuery(query);
%>
<div class="container my-2">
<table>
<tr>
<th>CId</th><th>FirstName</th><th>LastName</th><th>Address</th><th>PhoneNo</th><th>Email</th><th>Action</th>
</tr>
<%
	while(rst.next())
	{
		%>
		<tr>
		<td><%=rst.getString(1) %></td>
		<td><%=rst.getString(2) %></td>
		<td><%=rst.getString(3) %></td>
		<td><%=rst.getString(4) %></td>
		<td><%=rst.getString(5) %></td>
		<td><%=rst.getString(6) %></td>
		<td>
		<a href="edit-customer.jsp?id=<%=rst.getString(1)%>">Edit | </a>
		<a href="delete.jsp?id=<%=rst.getString(1)%>" onclick="return confirm('Are you sure to Delete?')">Delete</a>
		</td>
		</tr>
		<%
	}
%>
</table>
</div>