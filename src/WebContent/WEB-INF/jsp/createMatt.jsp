<%--
  Created by IntelliJ IDEA.
  User: krasnov
  Date: 8/18/14
  Time: 2:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html lang="en">
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
  <%--  <script type="text/javascript">
        $(function() {

            $( ".datepicker" ).datepicker();
           // $( ".datepicker" ).datepicker("option", "dateFormat", "dd M yy");

        });


    </script>--%>
    <script>
         function insertTable()
        {
            var num_rows = (document.getElementById('endhour').value-document.getElementById('starthour').value)*document.getElementById('timeslot').value;
            var num_cols = document.getElementById('days').value;
            var theader = "<table id='table1' width = auto>";
            var tbody = "";

            for(var j = 0; j < num_cols; j++)
            {
                theader += "<th>header col "+ (j+1) +" </th>";
            }

            for(var i = 0; i < num_rows; i++)
            {
                tbody += "<tr>";
                for(var j = 0; j < num_cols; j++)
                {
                    tbody += "<td>";
                    tbody += "something";
                    tbody += "</td>"
                }
                tbody += "</tr>";
            }
            var tfooter = "</table>";
            document.getElementById('placetable').innerHTML = theader + tbody + tfooter;}
    </script>


</head>
<body>
<div class="header">
    <span><a class="logo" href="http://myavailabletime.com/">MyAvailableTime</a></span>
    <span class="topmenu" style="float:right;"> Logout</span>
    <span class="topmenu" style="float:right;"> Account settings</span>
    <span class="topmenu" style="float:right;"> Logged in as: userusername</span>
</div>

<div id="wrapper">
    <div id="first">
        <div class="left">
            <p style="font-size: 1em ">Username's Somename Calendar</p>
        </div>
        <form name="tableForm">

            <div id="placetable"></div>
        </form>
    </div>








    <div id="second">
        <div class="right">
            <p style="font-size: 1em ">Settings</p>
            <p style="font-size:0.6em">Adjust credentials to generate calendar:</p>
            <form style="font-size: 0.6em">
                Name:<input type="text" name="firstname" style="width: 70%; float: right;"  ><br>
            </form>
            <p>Number of days	<select id="days" name="saf" style="margin-left: 20px; float: right;">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
            </select></p>


            <p>Starting date <input type="text" class="datepicker" id="datepicker" value="select date"  style="border: none; color: blue; cursor: pointer; background: #d6f000; font-size: 0.8em; float: right; width: 100px; text-align: right;  "></p>

            <p>Ending date<input type="text" class="datepicker" id="datepickers" value="select date" style="border: none; color: blue; cursor: pointer; background: #d6f000; font-size: 0.8em; float: right; width: 100px; text-align: right; "></p>



            <p>Starting hour 	<select id="starthour" name="saf" style="margin-left: 20px; float:right; vertical-align baseline; width: 75px;">
                <option value="1">01:00</option>
                <option value="2">02:00</option>
                <option value="3">03:00</option>
                <option value="4">04:00</option>
                <option value="5">05:00</option>
                <option value="6">06:00</option>
                <option value="7">07:00</option>
                <option value="8">08:00</option>
                <option value="9">09:00</option>
                <option value="10">10:00</option>
                <option value="11">11:00</option>
                <option value="12">12:00</option>
                <option value="13">13:00</option>
                <option value="14">14:00</option>
                <option value="15">15:00</option>
                <option value="16">16:00</option>
                <option value="17">17:00</option>
                <option value="18">18:00</option>
                <option value="19">19:00</option>
                <option value="20">20:00</option>
                <option value="21">21:00</option>
                <option value="22">22:00</option>
                <option value="23">23:00</option>
                <option value="24">24:00</option>
            </select> </p>
            <p>Ending hour 	<select id="endhour" name="saf" style="margin-left: 20px; float:right; vertical-align: text-bottom; width: 75px;">
                <option value="1">01:00</option>
                <option value="2">02:00</option>
                <option value="3">03:00</option>
                <option value="4">04:00</option>
                <option value="5">05:00</option>
                <option value="6">06:00</option>
                <option value="7">07:00</option>
                <option value="8">08:00</option>
                <option value="9">09:00</option>
                <option value="10">10:00</option>
                <option value="11">11:00</option>
                <option value="12">12:00</option>
                <option value="13">13:00</option>
                <option value="14">14:00</option>
                <option value="15">15:00</option>
                <option value="16">16:00</option>
                <option value="17">17:00</option>
                <option value="18">18:00</option>
                <option value="19">19:00</option>
                <option value="20">20:00</option>
                <option value="21">21:00</option>
                <option value="22">22:00</option>
                <option value="23">23:00</option>
                <option value="24">24:00</option>
            </select> </p>
            <p>Time slot 	<select id="timeslot" name="saf" style="margin-left: 20px; float:right; vertical-align: text-bottom; width: 75px">
                <option value="4">15 min</option>
                <option value="2">30 min</option>
                <option value="1">1 hour</option>

            </select> </p>
            <div>

                <div id="shareembedemail"><p>Share this calendar</p></div>
                <div id="shareembedemail"><a href="https://plus.google.com/share?url=http://myavailabletime.com" onclick="javascript:window.open(this.href,
  '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;">
                    <img src="https://www.gstatic.com/images/icons/gplus-16.png" alt="Share on Google+"/></a></div>
                <div id="shareembedemail">
                    <a href="https://www.facebook.com/sharer/sharer.php?u=http://192.168.1.14:8181/Booksclient" onclick="javascript:window.open(this.href,
  '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;">
                        <img src="http://math.hawaii.edu/home/images/logo_facebook_small.gif" alt="Share on Facebook" width="16" height="16">
                    </a>
                </div>
            </div>

            <form style="font-size: 0.5em">
                <input type="checkbox" id="checkbox1" name="passreqstatus" value="value" onclick="if(this.checked){
document.getElementById('textarea1').removeAttribute('disabled');document.getElementById('textarea1').focus()}
else {
document.getElementById('textarea1').setAttribute('disabled');
}"/>

                This calendar requires a password<br>
            </form>
            <form >
                <input type="text" id="textarea1" name="firstname" size="40" disabled ><br>
            </form>
            <div style="text-align:right; margin: 40px 10px 0px 0px; color: white">	<button id="createsavebutton"  onclick="myFunction()">Create</button></div>
            <p id="demo" style="text-align: right; font-size: 0.4em"></p>
            <script>
                function myFunction() {
                    insertTable();
                    //document.getElementById("demo").innerHTML = "Calendar succesfully saved";
                    document.getElementById("createsavebutton").innerHTML="Save";

                }
            </script>
        </div  >
    </div >
</div >

</body>
</html>