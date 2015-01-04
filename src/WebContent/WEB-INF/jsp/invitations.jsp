
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
    <meta charset="utf-8">
    <meta name="generator" content="CoffeeCup Web Editor (www.coffeecup.com)">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>MyAvailableTime_UserInvitations</title>
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
        	width:300px;
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
            color: blue;
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
<body>

<div class="header">
<form id="log" >
    <span><a class="logo" href="http://myavailabletime.com/">MyAvailableTime</a></span>
    <span class="topmenu" style="float:right;"> Logout</span>
    <span class="topmenu" style="float:right;"> <button type="submit" style="color: white;" onclick="log.action='accountsettings'">Account settings</button></span>
    <span class="topmenu" style="float:right;"> Logged in as: ${userName}</span>
    <span class="topmenu" style="float:right;"> <button type="submit" style="color: white;" onclick="log.action='homereturn'">Home</button></span>
    
</form>
</div>

<div id="wrapper">
    <div id="first">
        <div class="left">
            <p style="font-size: 1em ">${name}'s Invitations</p>
        </div>
        <%-- <form  id="form2" >
         <div>	<button  onclick="form2.action='dom'">Create a new Available calendar</button>
        <!--  <p style="font-size:1em">Existing calendars</p> -->
         
         </div>
       
        </form> --%>
        <form id="tableForm" name="tableForm" action="getMatt4EditNotif">
	<input type="hidden" id="table" name="table">
	<input type="hidden" name="username" value="${userName}">
            <div id="placetable">
                     
   <d:forEach items="${listNotifications}" var="item" > 
 
		<button id="${item[0]}" type="submit" onclick="table.value=this.id">Invitation for:  ${item[2]}  Initiator name:   ${item[1]} ID: ${item[0]}</button>

        
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