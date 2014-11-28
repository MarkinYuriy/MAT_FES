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
				Time zone:<select id="timeZone" name="timeZone" style="float:right; width: 173px">
					<option value="0" ${tz0}>(GMT-12:00) International Date Line West</option>
					<option value="1" ${tz1}>(GMT-11:00) Midway Island, Samoa</option>
					<option value="2" ${tz2}>(GMT-10:00) Hawaii</option>
					<option value="3" ${tz3}>(GMT-09:00) Alaska</option>
					<option value="4" ${tz4}>(GMT-08:00) Pacific Time (US & Canada)</option>
					<option value="5" ${tz5}>(GMT-08:00) Tijuana, Baja California</option>
					<option value="6" ${tz6}>(GMT-07:00) Arizona</option>
					<option value="7" ${tz7}>(GMT-07:00) Chihuahua, La Paz, Mazatlan</option>
					<option value="8" ${tz8}>(GMT-07:00) Mountain Time (US & Canada)</option>
					<option value="9" ${tz9}>(GMT-06:00) Central America</option>
					<option value="10" ${tz10}>(GMT-06:00) Central Time (US & Canada)</option>
					<option value="11" ${tz11}>(GMT-06:00) Guadalajara, Mexico City, Monterrey</option>
					<option value="12" ${tz12}>(GMT-06:00) Saskatchewan</option>
					<option value="13" ${tz13}>(GMT-05:00) Bogota, Lima, Quito, Rio Branco</option>
					<option value="14" ${tz14}>(GMT-05:00) Eastern Time (US & Canada)</option>
					<option value="15" ${tz15}>(GMT-05:00) Indiana (East)</option>
					<option value="16" ${tz16}>(GMT-04:00) Atlantic Time (Canada)</option>
					<option value="17" ${tz17}>(GMT-04:00) Caracas, La Paz</option>
					<option value="18" ${tz18}>(GMT-04:00) Manaus</option>
					<option value="19" ${tz19}>(GMT-04:00) Santiago</option>
					<option value="20" ${tz20}>(GMT-03:30) Newfoundland</option>
					<option value="21" ${tz21}>(GMT-03:00) Brasilia</option>
					<option value="22" ${tz22}>(GMT-03:00) Buenos Aires, Georgetown</option>
					<option value="23" ${tz23}>(GMT-03:00) Greenland</option>
					<option value="24" ${tz24}>(GMT-03:00) Montevideo</option>
					<option value="25" ${tz25}>(GMT-02:00) Mid-Atlantic</option>
					<option value="26" ${tz26}>(GMT-01:00) Cape Verde Is.</option>
					<option value="27" ${tz27}>(GMT-01:00) Azores</option>
					<option value="28" ${tz28}>(GMT+00:00) Casablanca, Monrovia, Reykjavik</option>
					<option value="29" ${tz29}>(GMT+00:00) Greenwich Mean Time : Dublin, Edinburgh, Lisbon, London</option>
					<option value="30" ${tz30}>(GMT+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna</option>
					<option value="31" ${tz31}>(GMT+01:00) Belgrade, Bratislava, Budapest, Ljubljana, Prague</option>
					<option value="32" ${tz32}>(GMT+01:00) Brussels, Copenhagen, Madrid, Paris</option>
					<option value="33" ${tz33}>(GMT+01:00) Sarajevo, Skopje, Warsaw, Zagreb</option>
					<option value="34" ${tz34}>(GMT+01:00) West Central Africa</option>
					<option value="35" ${tz35}>(GMT+02:00) Amman</option>
					<option value="36" ${tz36}>(GMT+02:00) Athens, Bucharest, Istanbul</option>
					<option value="37" ${tz37}>(GMT+02:00) Beirut</option>
					<option value="38" ${tz38}>(GMT+02:00) Cairo</option>
					<option value="39" ${tz39}>(GMT+02:00) Harare, Pretoria</option>
					<option value="40" ${tz40}>(GMT+02:00) Helsinki, Kyiv, Riga, Sofia, Tallinn, Vilnius</option>
					<option value="41" ${tz41}>(GMT+02:00) Jerusalem</option>
					<option value="42" ${tz42}>(GMT+02:00) Minsk</option>
					<option value="43" ${tz43}>(GMT+02:00) Windhoek</option>
					<option value="44" ${tz44}>(GMT+03:00) Kuwait, Riyadh, Baghdad</option>
					<option value="45" ${tz45}>(GMT+03:00) Moscow, St. Petersburg, Volgograd</option>
					<option value="46" ${tz46}>(GMT+03:00) Nairobi</option>
					<option value="47" ${tz47}>(GMT+03:00) Tbilisi</option>
					<option value="48" ${tz48}>(GMT+03:30) Tehran</option>
					<option value="49" ${tz49}>(GMT+04:00) Abu Dhabi, Muscat</option>
					<option value="50" ${tz50}>(GMT+04:00) Baku</option>
					<option value="51" ${tz51}>(GMT+04:00) Yerevan</option>
					<option value="52" ${tz52}>(GMT+04:30) Kabul</option>
					<option value="53" ${tz53}>(GMT+05:00) Yekaterinburg</option>
					<option value="54" ${tz54}>(GMT+05:00) Islamabad, Karachi, Tashkent</option>
					<option value="55" ${tz55}>(GMT+05:30) Sri Jayawardenapura</option>
					<option value="56" ${tz56}>(GMT+05:30) Chennai, Kolkata, Mumbai, New Delhi</option>
					<option value="57" ${tz57}>(GMT+05:45) Kathmandu</option>
					<option value="58" ${tz58}>(GMT+06:00) Almaty, Novosibirsk</option>
					<option value="59" ${tz59}>(GMT+06:00) Astana, Dhaka</option>
					<option value="60" ${tz60}>(GMT+06:30) Yangon (Rangoon)</option>
					<option value="61" ${tz61}>(GMT+07:00) Bangkok, Hanoi, Jakarta</option>
					<option value="62" ${tz62}>(GMT+07:00) Krasnoyarsk</option>
					<option value="63" ${tz63}>(GMT+08:00) Beijing, Chongqing, Hong Kong, Urumqi</option>
					<option value="64" ${tz64}>(GMT+08:00) Kuala Lumpur, Singapore</option>
					<option value="65" ${tz65}>(GMT+08:00) Irkutsk, Ulaan Bataar</option>
					<option value="66" ${tz66}>(GMT+08:00) Perth</option>
					<option value="67" ${tz67}>(GMT+08:00) Taipei</option>
					<option value="68" ${tz68}>(GMT+09:00) Osaka, Sapporo, Tokyo</option>
					<option value="69" ${tz69}>(GMT+09:00) Seoul</option>
					<option value="70" ${tz70}>(GMT+09:00) Yakutsk</option>
					<option value="71" ${tz71}>(GMT+09:30) Adelaide</option>
					<option value="72" ${tz72}>(GMT+09:30) Darwin</option>
					<option value="73" ${tz73}>(GMT+10:00) Brisbane</option>
					<option value="74" ${tz74}>(GMT+10:00) Canberra, Melbourne, Sydney</option>
					<option value="75" ${tz75}>(GMT+10:00) Hobart</option>
					<option value="76" ${tz76}>(GMT+10:00) Guam, Port Moresby</option>
					<option value="77" ${tz77}>(GMT+10:00) Vladivostok</option>
					<option value="78" ${tz78}>(GMT+11:00) Magadan, Solomon Is., New Caledonia</option>
					<option value="79" ${tz79}>(GMT+12:00) Auckland, Wellington</option>
					<option value="80" ${tz80}>(GMT+12:00) Fiji, Kamchatka, Marshall Is.</option>
					<option value="81" ${tz81}>(GMT+13:00) Nuku'alofa</option>
				</select><br><br>
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