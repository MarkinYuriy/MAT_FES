<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="generator" content="CoffeeCup Web Editor (www.coffeecup.com)">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>Create new</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script type="text/javascript">
        $(function() {

            $('#endDate').datepicker({
                dateFormat: "dd.mm.yy"
            });
            $("#startDate").datepicker({
                dateFormat: "dd.mm.yy",
                minDate:  0,
                onSelect: function(date){
                    var ndays=$('#nDays').val();
                    var date2 = $('#startDate').datepicker('getDate');
                    date2.setDate(date2.getDate()+parseInt(ndays)-1);
                    $('#endDate').datepicker('setDate', date2);
                }
            });
        })
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
<body>
<div class="header">
    <span><a class="logo" href="http://myavailabletime.com/">MyAvailableTime</a></span>
    <span class="topmenu" style="float:right;"> Logout</span>
    <span class="topmenu" style="float:right;"> Logged in as:<span id="userName"> ${userName}</span></span>
</div>

<div id="wrapper">
    <div id="first">
        <div class="left">
            <p style="font-size: 1em ">${name}'s Calendar</p>
        </div>
        <form name="tableForm">
            <div id="placetable"></div>
        </form>
    </div>
    <div id="second">
        <div class="right">
            <form action="createMatt">
                <p style="font-size: 1em ">Settings</p>
                <p style="font-size:0.6em">Adjust credentials to generate calendar:</p>
                <div style="font-size: 0.6em">
                    Name:<input id="mattName" name="mattName" type="text" style="width: 70%; float: right;"  ><br>
                </div>
                <p>Number of days	<select id="nDays" name="nDays" style="margin-left: 20px; float: right;">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                </select></p>
                <p>Starting date <input type="text" class="datepicker" id="startDate" name="startDate" value="select date"  style="border: none; color: blue; cursor: pointer; background: #d6f000; font-size: 0.8em; float: right; width: 120px; text-align: right;  "></p>
                <p>Ending date<input type="text" class="datepicker" id="endDate" name="endDate" value="select date" style="border: none; color: blue; cursor: pointer; background: #d6f000; font-size: 0.8em; float: right; width: 120px; text-align: right; "></p>
                <p>Starting hour 	<select id="starthour" name="startHour" style="margin-left: 20px; float:right; vertical-align baseline; width: 75px;">
                    <option value="0" selected>00:00</option>
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
                </select> </p>
                <p>Ending hour 	<select id="endhour" name="endHour" style="margin-left: 20px; float:right; vertical-align: text-bottom; width: 75px;">
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
                    <option value="24" selected>24:00</option>
                </select> </p>
                <p>Time slot 	<select id="timeSlot" name="timeSlot" style="margin-left: 20px; float:right; vertical-align: text-bottom; width: 75px">
                    <option value="15">15 min</option>
                    <option value="30" selected>30 min</option>
                    <option value="60">1 hour</option>
                </select> </p>
                <div>
                    <div style="text-align:right; margin: 40px 10px 0px 0px; color: white">
                        <button id="createMatt" type="submit"  >Create</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>