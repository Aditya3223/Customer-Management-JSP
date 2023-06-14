<%@include file="connection.jsp" %>

<%
String id=request.getParameter("id");
String query1="select * from customerinfo where cid=?";
PreparedStatement ps1=c.prepareStatement(query1);
ps1.setString(1,id);
ResultSet rst=ps1.executeQuery();
if(rst.next())
{
%>
<%@include file="navbar.jsp" %>
<title>Delete Customer</title>
<form action="deleted-confirm.jsp" method="post">
<table>
<tr><td>Customer Id:</td><td><%=rst.getString(1)%><input type="hidden" name="id" value='<%=rst.getString(1)%>'></td></tr>
<tr><td>Customer First Name:</td><td><%=rst.getString(2) %></td></tr>
<tr><td>Customer Last Name:</td><td><%=rst.getString(3) %></td></tr>
<tr><td>Customer Address:</td><td><%=rst.getString(4) %></td></tr>
<tr><td>Customer Phone:</td><td><%=rst.getString(5) %></td></tr>
<tr><td>Customer Email:</td><td><%=rst.getString(6) %></td></tr>
<tr><td colspan="2"><button>Confirm Delete</button></td></tr>
</table>
</form>
<%
return;
}
%>
<jsp:include page="delete.jsp"/>
<div>
Customer with id <%=id%> does not exist
</div>