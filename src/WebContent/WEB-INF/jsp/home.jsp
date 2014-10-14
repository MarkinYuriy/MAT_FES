
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
   
    <script>
function whichElement() {
    var targ;
    var e = window.event;
    if (e.target) {
        targ=e.target;
    }    
	return targ.id;
	}
	</script>
    <script>
    $(document).ready(function() {
    	$('#socialseti').click(
		function show(){
			var id=whichElement();
			var google=document.getElementById(id).checked;
			var data ="seti="+encodeURIComponent(id)+"&value="+encodeURIComponent(google);
			var x=document.getElementById(id);
		//	var google=document.getElementById("Google").checked;
		//	var data ="Google="+encodeURIComponent(google);
		//	var x=document.getElementById("Google");
			$.ajax({
				url : "socialseti",
				data : data,
				type : "GET",
				success : function(jXHR, status) {
					x.checked=response;
				}
			});
		return true;
		});
    });
		</script>
<script type="text/javascript">
function myLoad() {
 var disab=${SNdisabl};
//var disab = new Array("Apple", "Facebook", "Twitter", "Windows");
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
</script>
 <script type="text/javascript">
  function url(){
 	var x=${item};
   	var y=${userName};
   	String uri = "http://localhost:8080/myavailabletime/viewMatt?table="+x+"&username="+y;
   	var res = encodeURI(uri);
   	return res;
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
</form>
</div>

<div id="wrapper">
    <div id="first">
        <div class="left">
            <p style="font-size: 1em ">${name}'s Distribution Calendars</p>
        </div>
        <form  id="form2" >
         <div>	<button  onclick="form2.action='dom'">Create a new Avaliable calendar</button>
         <p style="font-size:1em">Existing calendars</p>
         
 
         </div>
       
        </form>
        <form id="tableForm" name="tableForm" >
	<input type="hidden" id="table" name="table">
	<input type="hidden" name="username" value="${userName}">
            <div id="placetable">
                     
   <d:forEach items="${matt}" var="item" >
         
   <table width='80%' border='1'>
   <tr>
   <td colspan='8'>${item}</td>
   </tr>
   <tr>
   <td colspan='8'><a id="${item}" href="javascript: (function(){var x =this.id; var y=${userName};
    String uri = 'http://localhost:8080/myavailabletime/viewMatt?table='+x+'&username='+y; 
    var res = encodeURI(uri);
   	return res;})()">http://localhost:8080/myavailabletime/viewMatt?table=${item}&username=${userName}</a></td>
   
 </tr>
   
   <tr>
		<td><input id="${item}" type="image" src='<d:url value='/resources/glas.jpg'/>' onclick="table.value=this.id, tableForm.action='viewMatt'" width='30' height='30'></td>
		<td><img src='<d:url value='/resources/karandash.jpg'/>' width='30' height='30'></td>
		<td><input id="${item}" type="image" src="resources/soed.jpg" onclick="table.value=this.id, tableForm.action='mail'" width='30' height='30' ></td>
		<td><img src='<d:url value='/resources/grafik.jpg'/>' width='30' height='30'></td>
		<td><img src='<d:url value='/resources/strelka.jpg'/>' width='30' height='30'></td>
		<td><img src='<d:url value='/resources/kalendar.jpg'/>' width='30' height='30'></td>
		<td><img src='<d:url value='/resources/chel.jpg'/>' width='30' height='30'></td>
		<td><img src="resources/mus.jpg" width='30' height='30'></td>
   </tr>
   </table>

  </d:forEach>
            </div>
            
        </form>
    </div>

    <div id="second">
        <div class="right">
            <p style="font-size: 1em ">Account Settings</p>
            <p style="font-size:0.6em">General information:</p>
            <form id="socialseti" action="socialseti" style="font-size: 0.6em">
                <p style="font-size:1em">Name:<input type="text" name="firstname" value="${name}" disabled style="width: 70%; float: right;"  ></p>
                <p style="font-size:1em">Email:<input type="text" name="Email" value="${email}" disabled  style="width: 70%; float: right;"  ></p>
            
          		<p style="font-size:1em">Synched accounts:</p>
                     
				<p style="font-size:1em">Google <input type="checkbox" id="Google" disabled style="border: none; float: right; width: 50px; "></p>
				<p style="font-size:1em">Apple (me) <input type="checkbox" id="Apple"  disabled style="border: none; float: right; width: 50px; "></p>
				<p style="font-size:1em">Windows (hotmail/Live) <input type="checkbox" id="Windows" disabled style="border: none; float: right; width: 50px; "></p>
				<p style="font-size:1em">Facebook <input type="checkbox" id="Facebook" disabled style="border: none; float: right; width: 50px; "></p>
				<p style="font-size:1em">Twitter <input type="checkbox" id="Twitter" disabled style="border: none; float: right; width: 50px; "></p>
								
            	<p id="demo" style="text-align: right; font-size: 0.4em"></p>
          	</form>

        </div  >


    </div >
</div >

</body onload="myLoad()">
</html>