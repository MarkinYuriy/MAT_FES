<head>
    <meta charset="utf-8">
    <meta name="generator" content="CoffeeCup Web Editor (www.coffeecup.com)">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>MyMatt</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script type="text/javascript">
        $(function() {
            $( ".datepicker" ).datepicker({ dateFormat: "dd M yy"});
        });
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
<body>
<div class="header">
    <span><a class="logo" href="http://myavailabletime.com/">MyAvailableTime</a></span>
    <span class="topmenu" style="float:right;"> Logout</span>
    <span class="topmenu" style="float:right;"> Account settings</span>
    <span class="topmenu" style="float:right;"> Logged in as: ${userName}</span>
</div>

<div id="wrapper">
    <div id="first">
        <div class="left">
            <p style="font-size: 1em ">${userName} Distribution Calendars</p>
        </div>
        <form  id="form2" >
         <div>	<button  onclick="form2.action='buf'">Create a new Avaliable calendar</button></div>
        
        </form>
        <form name="tableForm">

            <div id="placetable"></div>
        </form>
    </div>

    <div id="second">
        <div class="right">
            <p style="font-size: 1em ">Account Settings</p>
            <p style="font-size:0.6em">General information:</p>
            <form style="font-size: 0.6em">
                Name:<input type="text" name="firstname" value="${userName}" disabled = false style="width: 70%; float: right;"  ><br>
                Email:<input type="text" name="Email" value="" disabled = false style="width: 70%; float: right;"  ><br>
            </form>
            <p style="font-size:0.5em">Synched accounts:</p>
                     
			<p>Google <input type="checkbox" id="Google" disabled = false style="border: none; float: right; width: 50px; "></p>
			<p>Apple (me) <input type="checkbox" id="Apple" disabled = false style="border: none; float: right; width: 50px; "></p>
			<p>Windows (hotmail/Live) <input type="checkbox" id="Windows" disabled = false style="border: none; float: right; width: 50px; "></p>
			<p>Facebook <input type="checkbox" id="Facebook" disabled = false style="border: none; float: right; width: 50px; "></p>
			<p>Twitter <input type="checkbox" id="Twitter" disabled = false style="border: none; float: right; width: 50px; "></p>
		 
		 
		 
		



            <p id="demo" style="text-align: right; font-size: 0.4em"></p>
          

        </div  >


    </div >
</div >

</body>
</html>