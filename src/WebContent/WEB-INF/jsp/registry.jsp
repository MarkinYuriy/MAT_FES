<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registry</title>
	<script type="text/javascript">
	 function validate() {
		 if (document.form1.password.value!=document.form1.password1.value) {
	  		 alert("Pasword");
	  		 return false;}
  return true;
 }
</script>
 
 <style>
   .fig {
    text-align: center; 
   }
  </style>
</head>
<body>
<form class="fig" id="form1" name="form1" enctype="text/plain" onSubmit="return validate();">
<p class="fig" id="p1">Account Setting</p>
	<p>firstName</p>
	<input class="fig" type="text"  name="firstName" size=50 /><br>
	<!-- <p>lastName</p>
	<input class="fig" type="text"  name="lastName" size=50 /><br> -->
	<p>email</p>
	<input class="fig" type="text"  name="email" size=50 />
	<a id="p1">${email}</a><br>
	<p>password</p>
	<input class="fig" type="text" name="password" size=10 /><br><br>
	<input class="fig" type="text" name="password1" size=10 /><br><br>
	<input type="submit" value="registry" onclick="form1.action='person'"/><br>
</form>
</body>
</html>