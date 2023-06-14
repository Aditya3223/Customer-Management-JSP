<%@ include file="connection.jsp" %>
<%@ include file="navbar.jsp" %>
<%
String id=request.getParameter("id");
String query1="select * from customerinfo where cid=?";
PreparedStatement ps1=c.prepareStatement(query1);
ps1.setString(1, id);
ResultSet rst=ps1.executeQuery();
rst.next();
%>
<html>
<head>
<title>Edit Customer</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<label class="menuCategory">Add Customer</label>
<div class="container my-2">
<form action="edited-customer.jsp" method="post">
<div class="row">
	<div class="form-group col-md-10"><label for="id">Customer Id:</label><input type='text' name='id' value='<%=rst.getString(1)%>' class='form-control' readonly></div>
	<div class="form-group col-md-5"><label for="firstname">Edit First Name:</label><input class="form-control" id="fname" type="text" name="firstname" value="<%=rst.getString(2)%>"></div>
	<div class="form-group col-md-5"><label for="lastname">Edit Last Name:</label><input class="form-control" id="lname" type="text" name="lastname" value="<%=rst.getString(3)%>"></div>
	<div class="form-group col-md-5"><label for="address">Edit Address:</label><input class="form-control" id="address" type="text" name="address" value="<%=rst.getString(4)%>"></div>
	<div class="form-group col-md-5"><label for="phone">Edit Phone:</label><input class="form-control" id="phone" type="text" name="phone" value="<%=rst.getString(5)%>"></div>
	<div class="form-group col-md-10"><label for="email">Edit Email:</label><input class="form-control" id="email" type="text" name="email" value="<%=rst.getString(6)%>"></div>
	<div class="form-group col-md-10"><button>Update</button></div>
</div>
</form>
</div>
</body>
</html>