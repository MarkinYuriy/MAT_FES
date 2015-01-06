
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
function toggle(element) {
	var buf="collab"+element;
	document.getElementById(buf).style.display='none';
	 if( document.getElementById(element).style.display=='none' ){
	   document.getElementById(element).style.display = '';
	 }else{
	   document.getElementById(element).style.display = 'none';
	 }
	}
</script>
<script type="text/javascript">
function collab(element) {
	var buf="collab"+element;
	document.getElementById(element).style.display='none';
	 if( document.getElementById(buf).style.display=='none' ){
	   document.getElementById(buf).style.display = '';
	 }else{
	   document.getElementById(buf).style.display = 'none';
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
        #placetable::-webkit-scrollbar { width: 0 !important }

    </style>
 
</head>
<body>

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
            <div id="placetable" style="overflow:scroll; height:380px; width:100% ">
                     
   <d:forEach items="${matt}" var="item" >
         
   <table style="width:80%; margin-left:10%">  <!-- border='1' --> 
   <tr>
   <td colspan='8'>${item.value}</td>
   </tr>
   <tr>
   <td colspan='8'><a href="http://ec2-54-166-51-117.compute-1.amazonaws.com:8080/myavailabletime/viewMatt2?table=${item.key}&username=${userName}">http://ec2-54-166-51-117.compute-1.amazonaws.com:8080/myavailabletime/viewMatt2?table=${item.key}&username=${userName}</a></td>
   
 </tr>
   
   <tr>
		<td><input name="${item.key}" type="image" src="resources/glas.png" title="View" onclick="table.value=this.name, tableForm.action='viewMatt'" width='30' height='30'></td>
		<td><input name="${item.key}" type="image" src="resources/karandash.png" title="Edit" onclick="table.value=this.name, tableForm.action='action_edit'" width='30' height='30'></td>
		<td><a name="${item.key}" href=#  onclick="toggle(this.name)"><img   src="resources/soed.png" title="Share" width='30' height='30' ></a></td>
		<td><img src='<d:url value='/resources/grafik.png'/>' width='30' height='30'></td>
		<td><img src='<d:url value='/resources/strelka.png'/>' width='30' height='30'></td>
		<td><input name="${item.key}" type="image" src="resources/kalendar.png" title="Upload" onclick="table.value=this.name, tableForm.action='upload_matt'" width='30' height='30'></td>
		<%-- <td><img src='<d:url value='/resources/kalendar.jpg'/>' width='30' height='30'></td> --%>
		<td><a name="${item.key}" href=#  onclick="collab(this.name)"><img src="resources/chel.png" title="Collaboration" width='30' height='30'></a></td>
		<td><input name="${item.key}" type="image" src="resources/mus.png" title="Remove" onclick="table.value=this.name, tableForm.action='removematt'" width='30' height='30'></td>
		
   </tr>
   <tr id="${item.key}" style="display:none; height:50px">
   		<td> </td>
   		<td><input name="${item.key}" type="image" src="resources/mail_icon.png" title="Share" onclick="table.value=this.name, tableForm.action='mail'" width='30' height='30' ></td>
        <td><a  id="googleshare" href="https://plus.google.com/share?url=http://ec2-54-166-51-117.compute-1.amazonaws.com:8080/myavailabletime/viewMatt%3Ftable%3D${item.key}%26username%3D${userName}" 
                onclick=" sharegoogle(); javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;">
                <img src="https://www.gstatic.com/images/icons/gplus-32.png" title="Share on Google+" width='30' height='30'/></a></td>
        <td><a id="fbshare" href="https://www.facebook.com/sharer/sharer.php?u=http://ec2-54-166-51-117.compute-1.amazonaws.com:8080/myavailabletime/viewMatt%3Ftable%3D${item.key}%26username%3D${userName}" 
                onclick=" sharefb(); javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;">
                <img src="http://math.hawaii.edu/home/images/logo_facebook_small.gif" title="Share on Facebook" width="30" height="30"></a></td>
   </tr>
   <tr id="collab${item.key}" style="display:none; height:50px">
   		<td> </td><td> </td><td> </td><td> </td><td> </td>
   		<td><input name="${item.key}" type="image" src="resources/mail_icon.png" title="Send invitation" onclick="table.value=this.name, tableForm.action='invitation'" width='30' height='30' ></td>
    	<td><input name="${item.key}" type="image" src="resources/chel.png" title="Set appointment" onclick="table.value=this.name, tableForm.action='setAppointment'" width='30' height='30' ></td>
 
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
                
          	</form>

        </div  >


    </div >
</div >

</body>
</html>