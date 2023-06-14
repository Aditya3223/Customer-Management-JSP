<%@ include file="connection.jsp"%>
<%@ include file="navbar.jsp"%>
<%
String query="update customerinfo set firstname=?,lastname=?,address=?,phone=?,email=? where cid=?";
String fname=request.getParameter("firstname");
String lname=request.getParameter("lastname");
String address=request.getParameter("address");
String phone=request.getParameter("phone");
String email=request.getParameter("email");
String id=request.getParameter("id");
PreparedStatement ps=c.prepareStatement(query);
ps.setString(1, fname);
ps.setString(2, lname);
ps.setString(3, address);
ps.setString(4, phone);
ps.setString(5, email);
ps.setString(6, id);
ps.executeUpdate();
response.sendRedirect("show-customer.jsp");
%>