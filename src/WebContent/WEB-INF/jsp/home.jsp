
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
    <meta charset="utf-8">
    <meta name="generator" content="CoffeeCup Web Editor (www.coffeecup.com)">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>MyMatt</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
   
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
   
	<script type="text/javascript">
	function socialseti(id){
		var google=document.getElementById(id).checked;
		var data ="seti="+encodeURIComponent(id)+"&value="+encodeURIComponent(google);
		var x=document.getElementById(id);
		$.ajax({
			url : "socialseti",
			data : data,
			type : "GET",
			success : function(jXHR, status) {
				x.checked=response;
			}
		});
	}
	</script>
	<script type="text/javascript">
	function setsocialseti(id){
	var data ="seti="+encodeURIComponent(document.getElementById(id).name);
	$.ajax({
		url : "setsocialseti",
		data : data,
		type : "GET",
		
	});
	}
	</script>
 
<script type="text/javascript">
function myLoad() {
var disab=${SNdisabl};
//var disab = new Array("Google","Apple", "Facebook", "Twitter", "Windows");
   for (i=0;i<disab.length;i++){
   var x = document.getElementById(disab[i]);
   x.disabled= false;
   }
   var chek=${SNchek};
 //var chek = new Array("Apple", "Facebook", "Twitter", "Windows");
    for (i=0;i<chek.length;i++){
    var y = document.getElementById(chek[i]);
    y.checked= true;
    }
}
function toggle(element) {
	
	 if( document.getElementById(element.name).style.display=='none' ){
	   document.getElementById(element.name).style.display = '';
	 }else{
	   document.getElementById(element.name).style.display = 'none';
	 }
	}
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
        td {
        	width:100px;
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
        .close{
		cursor: pointer;
		
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
            color: red;
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
<body onload="myLoad()">


<div class="header">
<form id="log" >
    <span><a class="logo" href="http://myavailabletime.com/">MyAvailableTime</a></span>
    <span class="topmenu" style="float:right;"> Logout</span>
    <span class="topmenu" style="float:right;"> <button type="submit" style="color: white;" onclick="log.action='accountsettings'">Account settings</button></span>
    <span class="topmenu" style="float:right;"> Logged in as: ${userName}</span>
    <span class="topmenu" style="float:right;"> <button type="submit" style="color: white;" onclick="log.action='invitations'">Invitations</button></span>
    
</form>
</div>

<div id="wrapper">
    <div id="first">
        <div class="left">
            <p style="font-size: 1em ">${name}'s Distribution Calendars</p>
        </div>
        <form  id="form2" >
         <div>	<button  onclick="form2.action='dom'">Create a new Available calendar</button>
         <p style="font-size:1em">Existing calendars</p>
         
 
         </div>
       
        </form>
        <form id="tableForm" name="tableForm" >
	<input type="hidden" id="table" name="table">
	<input type="hidden" name="username" value="${userName}">
            <div id="placetable">
                     
   <d:forEach items="${matt}" var="item" >
         
   <table style="width:80%; margin-left:10%">  <!-- border='1' --> 
   <tr>
   <td colspan='8'>${item}</td>
   </tr>
   <tr>
   <td colspan='8'><a href="http://ec2-54-166-51-117.compute-1.amazonaws.com:8080/myavailabletime/viewMatt?table=${item}&username=${userName}">http://ec2-54-166-51-117.compute-1.amazonaws.com:8080/myavailabletime/viewMatt?table=${item}&username=${userName}</a></td>
   
 </tr>
   
   <tr>
		<td><input name="${item}" type="image" src="resources/glas.jpg" title="View" onclick="table.value=this.name, tableForm.action='viewMatt'" width='30' height='30'></td>
		<td><input name="${item}" type="image" src="resources/karandash.jpg" title="View" onclick="table.value=this.name, tableForm.action='action_edit'" width='30' height='30'></td>
		<td><a name="${item}" href=#  onclick="toggle(this)"><img   src="resources/soed.jpg" title="Share" width='30' height='30' ></a></td>
		<td><img src='<d:url value='/resources/grafik.jpg'/>' width='30' height='30'></td>
		<td><img src='<d:url value='/resources/strelka.jpg'/>' width='30' height='30'></td>
		<td><img src='<d:url value='/resources/kalendar.jpg'/>' width='30' height='30'></td>
		<td><img src="resources/chel.jpg" width='30' height='30'></td>
		<td><input name="${item}" type="image" src="resources/mus.jpg" title="Remove" onclick="table.value=this.name, tableForm.action='removematt'" width='30' height='30'></td>
		
   </tr>
   <tr id="${item}" style="display:none; height:50px">
   		<td> </td>
   		<td><input name="${item}" type="image" src="resources/mail_icon.png" title="Share" onclick="table.value=this.name, tableForm.action='mail'" width='30' height='30' ></td>
        <td><a  id="googleshare" href="https://plus.google.com/share?url=http://ec2-54-166-51-117.compute-1.amazonaws.com:8080/myavailabletime/viewMatt%3Ftable%3D${item}%26username%3D${userName}" 
                onclick=" sharegoogle(); javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;">
                <img src="https://www.gstatic.com/images/icons/gplus-32.png" title="Share on Google+" width='30' height='30'/></a></td>
        <td><a id="fbshare" href="https://www.facebook.com/sharer/sharer.php?u=http://ec2-54-166-51-117.compute-1.amazonaws.com:8080/myavailabletime/viewMatt%3Ftable%3D${item}%26username%3D${userName}" 
                onclick=" sharefb(); javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;">
                <img src="http://math.hawaii.edu/home/images/logo_facebook_small.gif" title="Share on Facebook" width="30" height="30"></a></td>
   </tr>
   		
   </table>
<br>
  </d:forEach>
            </div>
            
        </form>
    </div>

    <div id="second">
        <div class="right">
            <p style="font-size: 1em ">Account Settings</p>
            <p style="font-size:0.6em">General information:</p>
            <form id="socialseti" style="font-size: 0.6em">
                <p style="font-size:1em">Name:<input type="text" name="firstname" value="${name}" disabled style="width: 70%; float: right;"  ></p>
                <p style="font-size:1em">Email:<input type="text" name="Email" value="${email}" disabled  style="width: 70%; float: right;"  ></p>
            
          		<p style="font-size:1em">Synched accounts:</p>
                     
				<p style="font-size:1em">Google <input type="image" id="Googleset" name="Google" alt="google#in_image" src="resources/kalendar.jpg" title="Create MyAvailableTime Calendar in Google" onclick="setsocialseti(this.id)" style=" float:right" width='20' height='20'>
												<input type="checkbox" id="Google" disabled onclick="socialseti(this.id)" style="float: right;"> </p>
				<p style="font-size:1em">Apple (me) <input type="checkbox" id="Apple"  disabled onclick="socialseti(this.id)" style="border: none; float: right; width: 50px; "></p>
				<p style="font-size:1em">Windows (hotmail/Live) <input type="checkbox" id="Windows" disabled onclick="socialseti(this.id)" style="border: none; float: right; width: 50px; "></p>
				<p style="font-size:1em">Facebook <input type="checkbox" id="Facebook" disabled onclick="socialseti(this.id)" style="border: none; float: right; width: 50px; "></p>
				<p style="font-size:1em">Twitter <input type="checkbox" id="Twitter" disabled onclick="socialseti(this.id)" style="border: none; float: right; width: 50px; "></p>
								
            	<p id="demo" style="text-align: right; font-size: 0.4em"></p>
          	</form>

        </div  >


    </div >
</div >

</body>
</html>