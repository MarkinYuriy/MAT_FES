<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html itemscope itemtype="http://schema.org/Article">

<head>
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js">
  </script>
  <script type="text/javascript">
    (function () {
      var po = document.createElement('script');
      po.type = 'text/javascript';
      po.async = true;
      po.src = 'https://plus.google.com/js/client:plusone.js?onload=start';
      var s = document.getElementsByTagName('script')[0];
      s.parentNode.insertBefore(po, s);
    })();
  </script>
</head>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account settings</title>
</head>
<body>
<p id="p1">Choose social network for calendar addition</p>
<div id="signinButton">
  <span class="g-signin" 
    data-scope="${scopes}"
    data-clientid="${id}"
    data-redirecturi="postmessage"
    data-accesstype="offline"
    data-cookiepolicy="single_host_origin"
    data-approvalprompt="force"
    data-callback="signInCallback">
  </span>
</div>
<div id="result"></div>

<!-- style="display:none;" -->
<form id="result_form" action="resauto" method="post" >
<input id="par1" name="code" type=hidden /><br><br>
<input id="par2" name="access_token" type=hidden /><br><br>
</form><br>
 


<script type="text/javascript">
function signInCallback(authResult) {
  if (authResult['code']) {
//  if(result['status']['signed_in']){
	$('#par1').attr('value', authResult['code']);
 	$('#par2').attr('value', authResult['access_token']);
//    $('#signinButton').attr('style', 'display: none');
    document.getElementById('result_form').submit();


  } else if (authResult['error']) {
	  console.log('There was an error: ' + authResult['error']);
  }
 
}
</script>
</body>
</html>