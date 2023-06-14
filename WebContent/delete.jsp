<%@include file="connection.jsp" %>
<%@include file="navbar.jsp" %>
<%
String id=request.getParameter("id");
String query="delete from customerinfo where cid=?";
PreparedStatement ps1=c.prepareStatement(query);
ps1.setString(1,id);
ps1.executeUpdate();
response.sendRedirect("show-customer.jsp");
%>
