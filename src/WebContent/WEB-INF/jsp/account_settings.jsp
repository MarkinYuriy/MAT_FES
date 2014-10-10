<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html itemscope itemtype="http://schema.org/Article">

<head>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>

	<script type="text/javascript">
	(function () {
	    var po = document.createElement('script');
	    po.type = 'text/javascript';
	    po.async = true;
  	    po.src = 'https://plus.google.com/js/client:plusone.js?onload=start';
  	    var s = document.getElementsByTagName('script')[0];
  	    s.parentNode.insertBefore(po, s);
    })();
    
/*     (function (){
    }) */
  </script>
    <style>
        head {
            width: auto;
        }
        body {
            width: auto;
            background:#f0f0f0;
            margin-left: auto;
            margin-right: auto;
        }

        .header {
            font-family: Arial, Helvetica, sans-serif;
            background: black;
            width: auto;
            height: auto;
            margin-left: auto;
            margin-right: auto;
            font-size: 1.2em;
            font-weight: bold;
        }
        .topmenu {
            display: inline-block;
            text-align:;
            color: white;
            padding: 10px 19px 10px 0px;
            font-weight:100;
            font-size: 0.9em}
        .logo {
            display: inline-block;
            text-align:left;
            color: white;
            padding: 10px 0px 7px 19px;
        }
        a.logo:link{
            text-decoration:none;
            color:#ffffff;
        }
        a.logo:hover{
            text-decoration:none;
            color:#e9e9e9;
        }
        a.logo:active{
            text-decoration:none;
            color:#e0e0e0;
        }
        a.logo:visited{
            text-decoration:none;
            color:#ffffff;
        }
        p {
            font-size: 0.6em;
        }


        #wrapper {
            width: 100%;
            overflow: hidden; /* will contain if #first is longer than #second */
        }
        #first {
            width: 65%;
            float:left; /* add this */

        }
        #second {
            overflow: hidden; /* if you don't want #second to wrap below #first */
            background: #d6f000;
        }
        .left {
            text-align: left;
            padding:0px 20px 0 20px;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 1.6em;
            color: #888888;

        }
        .right {
            text-align: left;
            padding:0px 20px 0 20px;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 1.6em;
            color: #888888;

        }
        #shareembedemail {
            display: inline-block;
            text-align: center;
        }


        button {
            background:none!important;
            border:none;
            padding:0!important;
            /*border is optional*/
            cursor: pointer;
            font-size: 1em;
            color: white;
        }
        #table1
        {
            border:solid 1px;
            border-collapse:collapse;
        }

        #table1 th
        {
            border:solid 1px;
            border-collapse:collapse;
        }

        #table1 td
        {
            border:solid 1px;
            vertical-align:middle;
        }
    </style>
</head>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account settings</title>
</head>
<body>
<div class="header">
    <span><a class="logo" href="http://myavailabletime.com/">MyAvailableTime</a></span>
    <span class="topmenu" style="float:right;"> Logout</span>
    <span class="topmenu" style="float:right;"> Logged in as: ${username}</span>
</div>

<div id="wrapper">
<form action="savesettings">
    <div id="first">
        <div class="left">
            <p style="font-size: 1em ">Authorization MyAvailableTime in social networks</p>
		    <div id="signinButton">
 			  <input type="checkbox" id="googlecheck" name="google_check" ${GoogleCh} ${GoogleAuth} style="border: none; float: left; width: 50px">
	          <span style="color: black; font-size: 0.7em; vertical-align: 1em; margin-left: 20px ">Google</span>
	          <span style="margin-left: 50px "></span>
			  <span class="g-signin"
			    data-scope="${scopesGoogle}"
			    data-clientid="${idGoogle}"
			    data-redirecturi="postmessage"
			    data-accesstype="offline"
			    data-cookiepolicy="single_host_origin"
			    data-approvalprompt="force"
			    data-callback="signInCallback">
			  </span>
			</div><br>            
		    <div id="appleButton">
				<input type="checkbox" id="applecheck" name="apple_check" ${AppleCh} ${AppleAuth} style="border: none; float: left; width: 50px">
	       		<span style="font-size: 0.7em; vertical-align: 1em; margin-left: 20px ">Apple</span>
	        	<span style="margin-left: 50px "></span>
			</div><br>  
		    <div id="windowsButton">
 			  <input type="checkbox" id="windowscheck" name="windows_check" ${WindowsCh} ${WindowsAuth} style="border: none; float: left; width: 50px">
	          <span style="font-size: 0.7em; vertical-align: 1em; margin-left: 20px ">Windows</span>
	          <span style="margin-left: 50px "></span>
			</div><br>  
		    <div id="facebookButton">
 			  <input type="checkbox" id="facebookcheck" name="facebook_check" ${FacebookCh} ${FacebookAuth} style="border: none; float: left; width: 50px">
	          <span style="font-size: 0.7em; vertical-align: 1em; margin-left: 20px ">Facebook</span>
	          <span style="margin-left: 50px "></span>
			</div><br>  
		    <div id="twitterButton">
 			  <input type="checkbox" id="twittercheck" name="twitter_check" ${TwitterCh} ${TwitterAuth} style="border: none; float: left; width: 50px">
	          <span style="font-size: 0.7em; vertical-align: 1em; margin-left: 20px ">Twitter</span>
	          <span style="margin-left: 50px "></span>
			</div><br>  
        </div>
	</div>
    <div id="second">
        <div class="right">
            <p style="font-size: 1em ">Account Settings</p>
            <p style="font-size:0.6em">General information:</p>
            <div style="font-size: 0.6em">
                Name:<input type="text" name="firstname" value="${name}" style="float: right;"><br><br>
                Email:<input type="text" name="email" value="${email}" style="float: right;"><br><br>
                New password:<input type="text" name="password" value="*******" style="float: right;"><br><br>
				Confirm password:<input type="text" name="password1" value="*******" style="float: right;"><br><br>
	            <div style="text-align:right; margin: 40px 10px 0px 0px; color: white; font-size: 3em">	
           			<button type="submit" id="savebutton">SAVE</button>
            	</div>
            </div>
         </div>
    </div>
</form>    
</div>
<div id="result"></div>


<!-- style="display:none;" -->
<form id="result_form" action="resauto" method="post" >
	<input id="par1" name="code" type=hidden />
	<input id="par2" name="access_token" type=hidden />
<%-- 	<input id="pGoogleAuth" name="Google_Auth" type=hidden value= "${GoogleAuth}"/>
	<input id="pGoogleCh" name="Google_Ch" type=hidden value= "${GoogleCh}"/> --%>
</form>
 


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