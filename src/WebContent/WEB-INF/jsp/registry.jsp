<!DOCTYPE html>
<html>
 <head>
  <title>Registry</title>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  <meta name="description" content="Generated at http://psd2htmlconverter.com - Your site's description should be here" />
  <meta name="keywords" content="Generated at http://psd2htmlconverter.com - Your site's keywords should be here" />
  <meta name="generator" content="http://psd2htmlconverter.com" />
  <link rel="stylesheet" type="text/css" href="resources/style1.css" /> 
 
<script type="text/javascript">
	function namepol() {
	var x = document.getElementById("namepole").value;
    if (x) document.getElementById("nameikon").src="resources/images/galozhka.png";else document.getElementById("nameikon").src="resources/images/zvezdochka.png";
}
</script>
<script type="text/javascript">
	function emailpol() {
	var x = document.getElementById("emailpole").value;
    if (x.indexOf("@")>0) document.getElementById("emailikon").src="resources/images/galozhka.png";else document.getElementById("emailikon").src="resources/images/zvezdochka.png";
}
</script>
<script type="text/javascript">
	function passwpol() {
	var x = document.getElementById("passwpole").value;
    if (x.length>0) {document.getElementById("passwikon").src="resources/images/galozhka.png";document.getElementById("passwikon1").src="resources/images/zvezdochka.png";}
    else {document.getElementById("passwikon").src="resources/images/zvezdochka.png";document.getElementById("passwikon1").src="resources/images/zvezdochka.png";}
}
</script>
<script type="text/javascript">
	function passwpol1() {
	var x = document.getElementById("passwpole").value;
	var y = document.getElementById("passwpole1").value;
    if (x==y && y.length>0) document.getElementById("passwikon1").src="resources/images/galozhka.png";else document.getElementById("passwikon1").src="resources/images/zvezdochka.png";
}
</script>
<script type="text/javascript">
	function subm() {
		var x =	document.getElementById("passwikon1").src
		
		return true;
}
</script>
 </head>
 <body>
  <div class="global_container_">
    <img class="logo" src="resources/images/logo.gif" alt="" width="408" height="167" />
   <form class="blok-form" action="person">
    <div class="blok group">
     <div class="c_wrapper1">
      <p class="create_a_new_account">Create a New Account</p>
      <div class="polya group">
       <div class="c_wrapper2">
        <p class="username">Username</p>
        <p class="email">Email</p>
        <p class="create_a_password">Create a password</p>
        <p class="re-enter_password">Re -enter password</p>
       </div>
       <div class="c_wrapper3">
        <input id="namepole" class="username_2" type="text" name="username_2"  onblur="namepol()" />
        <input id="emailpole" class="email_2" type="text" name="email_2" onblur="emailpol()" />
        <input id="passwpole" class="create_a_password_2" type="password" name="create_a_password_2" onblur="passwpol()" />
        <input id="passwpole1" class="re-enter_password_2" type="password" name="re-enter_password_2" onblur="passwpol1()" />
       </div>
      </div>
      <input class="mergedimage_2" type="submit" name="mergedimage_2" alt="REGISTRATION" value="" onclick="subm()"/>
     </div>
     <div class="ikonki">
      <img id="nameikon" class="galozhka" src="resources/images/zvezdochka.png" alt="" width="40" height="37" />
      <img id="emailikon" class="galozhka_2" src="resources/images/zvezdochka.png" alt="" width="40" height="37" />
      <img id="passwikon" class="zvezdochka" src="resources/images/zvezdochka.png" alt="" width="40" height="39" />
      <img id="passwikon1" class="zvezdochka_1" src="resources/images/zvezdochka.png" alt="" width="40" height="37" />
     </div>
    </div>
   </form>
  </div>
 </body>
</html>