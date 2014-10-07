<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
	<script type="text/javascript">
	 function validate() {
	//	boolean fl=true;
//		fl=test(document.form.name.value,document.form.password.value);
	//	if (action="add1") {
	//		alert("name or password incorrect!");
	//	return false;}
	//	alert("name or password incorrect!");
  return true;
 }
</script>
</head>
<body>
<form id="form1" name="form" enctype="text/plain" onSubmit="return validate();">
<p id="p1">enter the name and password</p>
	<input id="" type="text" value="username or email" name="name" size=50 onclick="this.value=''"/>
	<a id="p1">${name}</a><br>
	<p></p>
	<input id="pas" type="password" name="password" size=50>
	<input type="checkbox"  onclick="if(this.checked){pas.type='text'}else {pas.type='password'; }">
	<a id="p1">${password}</a><br>
	
	<p id="p1">${aktiv}</p>
	<input type="submit" value="LOGIN" onclick="form1.action='home'"/><br>
 	<input type="submit" value="registry" onclick="form1.action='registry'"/><br>
</form>

</body>
</html>