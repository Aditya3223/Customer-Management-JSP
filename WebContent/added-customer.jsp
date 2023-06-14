<%@ include file="connection.jsp"%>
<%@ include file="navbar.jsp"%>
<%
String customerid=request.getParameter("id");
String query1="select * from customerinfo where cid=?";
PreparedStatement ps1=c.prepareStatement(query1);
ps1.setString(1, customerid);
ResultSet rst=ps1.executeQuery();
if(rst.next())
{
	%>
	<div>
	<label>Customer with id <%=customerid %> already exists</label>
	</div>
	<%
	return;
}
String fname=request.getParameter("firstname");
String lname=request.getParameter("lastname");
String address=request.getParameter("address");
String phone=request.getParameter("phone");
String email=request.getParameter("email");
String query="insert into customerinfo values(?,?,?,?,?,?)";
PreparedStatement ps=c.prepareStatement(query);
ps.setString(1, customerid);
ps.setString(2, fname);
ps.setString(3, lname);
ps.setString(4, address);
ps.setString(5, phone);
ps.setString(6, email);
ps.executeUpdate();
%>
<div>
<label>Customer Record have been Saved Successfully</label>
</div>