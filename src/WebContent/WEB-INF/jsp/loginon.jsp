<!DOCTYPE html>
<html>
 <head>
  <title>MyAvailableTime&login</title>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  <meta name="description" content="Generated at http://psd2htmlconverter.com - Your site's description should be here" />
  <meta name="keywords" content="Generated at http://psd2htmlconverter.com - Your site's keywords should be here" />
  <meta name="generator" content="http://psd2htmlconverter.com" />
  <link rel="stylesheet" type="text/css" href="resources/style.css" /> 
  <!--[if IE 6]>
	<style type="text/css">
		* html .group {
			height: 1%;
		}
	</style>
  <![endif]--> 
  <!--[if IE 7]>
	<style type="text/css">
		*:first-child+html .group {
			min-height: 1px;
		}
	</style>
  <![endif]--> 
  <!--[if lt IE 9]> 
	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script> 
  <![endif]--> 
  <script type="text/javascript">
	 function submit1(e) {
		if (e==1)document.getElementById("blok-form").action= 'home';
		if (e==2)document.getElementById("blok-form").action= 'registry';
	//	x.submit;
	//	document.getElementById("myForm").action = "form_action.asp";
  return true;
 }
</script>
<script type="text/javascript">
	function view(){
		var pas=document.getElementById("pas");
		var x=document.getElementById("3");
	
		if(x.className=="knopka_avs"){
			x.className="knopka_zvez";
			pas.type="text";
			}
			else{
				x.className="knopka_avs";
				pas.type="password";
			}
		
	}
</script>
<script type="text/javascript">
	function error(){
		var num=${num};
		var x=document.getElementById("3");
		if(num==1){
			x.src="resources/images/username_test.png"
		}		
	}
</script>
 </head>
 <body onload="error()">
  <div class="global_container_">
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
       <input class="pole1" type="text" name="name" placeholder="" />
       <img id="4" class="username_test" src="resources/images/username_test.png" alt="" width="35" height="34" />
      </div>
      <div class="password group">
       <input id="pas" class="pole" type="password" name="password" placeholder="" />
       <img id="3" class="knopka_avs" name="knopka_avs" onclick="view()"/>
      </div>
     </div>
     <div class="knopki">
      <div class="login_n_image group">
       <input id="1" class="on" type="image" src="resources/images/on.png" alt="" onclick="submit1(this.id)" width="33" height="33" />
       <p class="login">LOGIN</p>
      </div>
      <div class="registrashion_n_image group">
       <input id="2" class="on2" type="image" src="resources/images/on2.png" alt="" onclick="submit1(this.id)" width="34" height="34" />
       <p class="registration">SIGN UP</p>
      </div>
     </div>
    </div>
   </form>
  </div>
 </body>
</html>