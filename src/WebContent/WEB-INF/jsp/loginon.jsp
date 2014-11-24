<!DOCTYPE html>
<html>
 <head>
  <title>MyAvailableTime&login</title>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  <meta name="description" content="Generated at http://psd2htmlconverter.com - Your site's description should be here" />
  <meta name="keywords" content="Generated at http://psd2htmlconverter.com - Your site's keywords should be here" />
  <meta name="generator" content="http://psd2htmlconverter.com" />
  <link rel="stylesheet" type="text/css" href="resources/style.css" /> 
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
  <script type="text/javascript">
	 function submit1(e) {
		if (e==1)document.getElementById("blok-form").action= 'home';
		if (e==2)document.getElementById("blok-form").action= 'registry';
  return true;
 }
</script>
 <script>
 function myEnter(e) {
	 if (typeof e == 'undefined' && window.event) {
		e = window.event;}
	 if (e.which == 13){
	  	document.getElementById("blok-form").action= 'home';
	 	document.forms["blok-form"].submit();}
	 }
 
</script>
<script type="text/javascript">
	function view(){
		var pas=document.getElementById("password");
		var x=document.getElementById("codortex");
		if(x.className=="knopka_avs"){
			x.className="knopka_zvez";
			x.src="resources/images/zvezdochki.png"
			pas.type="text";
			}
			else{
				x.className="knopka_avs";
				x.src="resources/images/knopka_avs.png";
				pas.type="password";
			}
	}
</script>
<script type="text/javascript">
	function error(){
		var pas=${password};
		var nam=${name};
		var akt=${aktiv};
		var x=document.getElementById("ok");
		if(pas) {x.src="resources/images/username_open.png";}
		if(nam) {x.src="resources/images/username_test.png";}
		if(akt) {x.src="resources/images/username_aktiv.png";}
			
	}
</script>
<script type="text/javascript">
	function emailpol() {
	var x = document.getElementById("polelogin").value;
 
	var data ="email="+encodeURIComponent(x);
	$.ajax({
		url : "email",
		data : data,
		type : "GET",
		success : function(response) {
			if (response=="3") document.getElementById("ok").src="resources/images/username_test.png";
			else if (response=="0"){ document.getElementById("ok").src="resources/images/username_aktiv.png"; alert("Your account as not activated");}else document.getElementById("ok").src="resources/images/username_open.png";
		}
	});
  
}
</script>

 </head>
 <body onload="error()">
  <div class="global_container_">
   <img class="logo" src="resources/images/logo.gif" alt="" width="379" height="165" />
   <form id="blok-form" class="blok-form" name="blok-form" >
    <div class="blok">
     <div class="ikonki">
      <img class="liniya" src="resources/images/liniya.png" alt="" width="377" height="14" />
      <input class="facebook" type="image" name="facebook" alt="facebook#in_image" src="resources/images/facebook.png" />
      <input class="twitter" type="image" name="twitter" alt="twitter#in_image" src="resources/images/twitter.png" />
      <input class="in" type="image" name="in" alt="in#in_image" src="resources/images/in.png" />
      <input class="google" type="image" name="google" alt="google#in_image" src="resources/images/google.png" />
      <input class="yhoo" type="image" name="yhoo" alt="yhoo#in_image" src="resources/images/yhoo.png" />
      <input class="windows" type="image" name="windows" alt="windows#in_image" src="resources/images/windows.png" />
     </div>
     <div class="polya">
      <div class="username group">
       <p class="username_or_email">Username or Email</p>
       <input id="polelogin" class="pole1" type="text" name="name" value="${logon}" value="" onblur="emailpol()"/>
       <img id="ok" class="username_test" src="resources/images/username_test.png" alt="" width="32" height="31" />
      </div>
      <div class="password group">
      <p class="password_2">Password</p>
       <input id="password" class="pole" type="password" name="password" placeholder="" onkeypress="myEnter(event)"/>
       <img id="codortex" class="knopka_avs" src="resources/images/knopka_avs.png" alt="" width="32" height="32" onclick="view()"/>
      </div>
     </div>
     <div class="knopki">
        <input id="1" class="mergedimage_2" type="submit" name="mergedimage_2" alt="LOGIN" value="" onclick="submit1(this.id)" />
      	<input id="2" class="mergedimage_3" type="submit" name="mergedimage_3" alt="SIGN UP" value="" onclick="submit1(this.id)"/>
      </div>
    </div>
   </form>
  </div>
 </body>
</html>