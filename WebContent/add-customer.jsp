<%@ include file="navbar.jsp" %>
<html>
<head>
<title>Add Customer</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<label class="menuCategory">Add Customer</label>
<div class="container my-2">
<form action="added-customer.jsp">
<div class="row">
	<div class="form-group col-md-10"><label for="id">Enter Id:</label><input class="form-control" type="text" name="id" required></div>
	<div class="form-group col-md-5"><label for="firstname">Enter First Name:</label><input class="form-control" type="text" name="firstname" required></div>
	<div class="form-group col-md-5"><label for="lastname">Enter Last Name:</label><input class="form-control" type="text" name="lastname" required></div>
	<div class="form-group col-md-5"><label for="address">Enter Address:</label><input class="form-control" type="text" name="address" required></div>
	<div class="form-group col-md-5"><label for="phone">Enter Phone:</label><input class="form-control" type="text" name="phone" required></div>
	<div class="form-group col-md-10"><label for="email">Enter Email:</label><input class="form-control" type="text" name="email" required></div>
	<div class="form-group col-md-10"><button>Submit</button></div>
</div>
</form>
</div>
</body>
</html>