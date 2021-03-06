<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="generator" content="CoffeeCup Web Editor (www.coffeecup.com)">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>Save</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script type="text/javascript">
        $(function() {
            $( ".datepicker" ).datepicker({ dateFormat: "dd.mm.yy"});
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
</head>
<body>
<div class="header">
    <span><a class="logo" href="http://myavailabletime.com/">MyAvailableTime</a></span>
    <span class="topmenu" style="float:right;"> Logout</span>
    <span class="topmenu" style="float:right;"> Logged in as:<span id="userName"> ${userName}</span></span>
</div>
<div id="wrapper">
	<form action="saveMatt">
    <div id="first">
        <div class="left">
            <p style="font-size: 1em ">${name}'s Calendar</p>
        </div>
        <div>
			<input id="par1" name="mattToJSON" value='${matJSON}' type=hidden style="display:none"/>
            <table id="mattTable">
            </table>
            <script>
                var arr = $('#par1').attr('value');

                /* '[["petya"],["h1","h2","h3","h4","h5"],["9:00","10:00","11:00","12:00"],[[0,1,0,0,1],[0,1,0,1,0],[0,0,1,0,1],[1,1,0,1,0]]]' */
                /*instead "arr" we pass string with matt data whatever its name is
                 file  named "json" is changing its value due to color selection
                 and should be passed to controller on @RequestMapping*/

                var json = JSON.parse(arr);
		//		alert(json);
                /*generating a table according to our data*/

                var oldTable = document.getElementById('mattTable'),
                        newTable = oldTable.cloneNode();
                var tr = document.createElement('tr');
                tr.id = "dayValue";
                for(var i = 0; i < json[2].length; i++){
                    var th = document.createElement('th');
                    th.appendChild(document.createTextNode(json[2][i]));
                    tr.appendChild(th);
                }
                newTable.appendChild(tr);

                var tr1 = document.createElement('tr');
		        for(var i = 0; i < json[1].length; i++){
		            var th1 = document.createElement('td');
		            th1.appendChild(document.createTextNode(json[1][i]));
		            tr1.appendChild(th1);
		        }
 		       newTable.appendChild(tr1);


                for(var i = 0; i < json[3].length; i++){
                    var tr = document.createElement('tr');
                    for(var j = 0; j < json[2].length; j++){
                        var td = document.createElement('td');
                        var id = "td" + i + j
                        td.id = id;
                        td.appendChild(document.createTextNode(json[3][i]));
                        if(!json[4][i][j]) {
                            td.style.backgroundColor = "green";
                            td.style.cursor = "pointer";
                            td.setAttribute("onClick", "changeColor(id)");
                            td.style.cursor = "pointer";
                        }
                        tr.appendChild(td);
                    }
                    newTable.appendChild(tr);
                }
                oldTable.parentNode.replaceChild(newTable, oldTable);

                /*this part is changing color of our calendar and affects to "json" data,
                 this data should be passed to controller, don't know how:)
                 mayby it should be stringified, have to check it out!
                 */
                function changeColor(arg)
                {
                    var i;
                    var j;
                    var id = arg.replace ( /[^\d.]/g, '' );
                    if (id<100){
	                    i = arg.slice(2,3);
	                    j = arg.slice(3,4);}
                    else {
	                    i = arg.slice(2,4);
	                    j = arg.slice(4,5);}

                    var cell = document.getElementById(arg);
                    if(cell.style.backgroundColor == "green")
                    {
                        cell.style.backgroundColor = "yellow";
                        json[4][i][j]=1;
                        $('#par1').attr('value', JSON.stringify(json));
                    }
                    else if
                            (cell.style.backgroundColor == "yellow")
                    {
                        cell.style.backgroundColor = "green";
                        json[4][i][j]=0;
                        $('#par1').attr('value', JSON.stringify(json));
                    }
                }
            </script>
        </div>
    </div>
    <div id="second">
        <div class="right">
            <p style="font-size: 1em ">Settings</p>
            <p style="font-size:0.6em">Adjust credentials to generate calendar:</p>
            <div style="font-size: 0.6em">
                Name:<input id="mattName" name="mattName" type="text" value='${mattName}' style="width: 70%; float: right;"  ><br>
            </div>
            <p>Number of days	<select id="nDays" name="nDays" style="margin-left: 20px; float: right;">
                <option value="1" ${nd1}>1</option>
                <option value="2" ${nd2}>2</option>
                <option value="3" ${nd3}>3</option>
                <option value="4" ${nd4}>4</option>
                <option value="5" ${nd5}>5</option>
                <option value="6" ${nd6}>6</option>
                <option value="7" ${nd7}>7</option>
            </select></p>
           	<p>Starting date <input type="text" class="datepicker" id="startDate" name="startDate" value='${startDate}' style="border: none; color: blue; cursor: pointer; background: #d6f000; font-size: 0.8em; float: right; width: 120px; text-align: right;  "></p>
            <p>Ending date<input type="text" class="datepicker" id="endDate" name="endDate" value='${endDate}' style="border: none; color: blue; cursor: pointer; background: #d6f000; font-size: 0.8em; float: right; width: 120px; text-align: right; "></p>
            <p>Starting hour <select id="starthour" name="startHour" style="margin-left: 20px; float:right; vertical-align baseline; width: 75px;">
                <option value="0" ${sh0}>00:00</option>
                <option value="1" ${sh1}>01:00</option>
                <option value="2" ${sh2}>02:00</option>
                <option value="3" ${sh3}>03:00</option>
                <option value="4" ${sh4}>04:00</option>
                <option value="5" ${sh5}>05:00</option>
                <option value="6" ${sh6}>06:00</option>
                <option value="7" ${sh7}>07:00</option>
                <option value="8" ${sh8}>08:00</option>
                <option value="9" ${sh9}>09:00</option>
                <option value="10" ${sh10}>10:00</option>
                <option value="11" ${sh11}>11:00</option>
                <option value="12" ${sh12}>12:00</option>
                <option value="13" ${sh13}>13:00</option>
                <option value="14" ${sh14}>14:00</option>
                <option value="15" ${sh15}>15:00</option>
                <option value="16" ${sh16}>16:00</option>
                <option value="17" ${sh17}>17:00</option>
                <option value="18" ${sh18}>18:00</option>
                <option value="19" ${sh19}>19:00</option>
                <option value="20" ${sh20}>20:00</option>
                <option value="21" ${sh21}>21:00</option>
                <option value="22" ${sh22}>22:00</option>
                <option value="23" ${sh23}>23:00</option>
            </select></p>
            <p>Ending hour <select id="endhour" name="endHour" style="margin-left: 20px; float:right; vertical-align: text-bottom; width: 75px;">
                <option value="1" ${eh1}>01:00</option>
                <option value="2" ${eh2}>02:00</option>
                <option value="3" ${eh3}>03:00</option>
                <option value="4" ${eh4}>04:00</option>
                <option value="5" ${eh5}>05:00</option>
                <option value="6" ${eh6}>06:00</option>
                <option value="7" ${eh7}>07:00</option>
                <option value="8" ${eh8}>08:00</option>
                <option value="9" ${eh9}>09:00</option>
                <option value="10" ${eh10}>10:00</option>
                <option value="11" ${eh11}>11:00</option>
                <option value="12" ${eh12}>12:00</option>
                <option value="13" ${eh13}>13:00</option>
                <option value="14" ${eh14}>14:00</option>
                <option value="15" ${eh15}>15:00</option>
                <option value="16" ${eh16}>16:00</option>
                <option value="17" ${eh17}>17:00</option>
                <option value="18" ${eh18}>18:00</option>
                <option value="19" ${eh19}>19:00</option>
                <option value="20" ${eh20}>20:00</option>
                <option value="21" ${eh21}>21:00</option>
                <option value="22" ${eh22}>22:00</option>
                <option value="23" ${eh23}>23:00</option>
                <option value="24" ${eh24}>24:00</option>
            </select> </p>
            <p>Time slot 	<select id="timeSlot" name="timeSlot" style="margin-left: 20px; float:right; vertical-align: text-bottom; width: 75px">
                <option value="15" ${ts15}>15 min</option>
                <option value="30" ${ts30}>30 min</option>
                <option value="60" ${ts60}>1 hour</option>
            </select></p>
            <div>
                <div style="text-align:right; margin: 40px 10px 0px 0px; color: white">
                	<button id="saveMatt" type="submit"  >SAVE</button>
            	</div>
        	</div>
		</div>
    </div>
	</form>
</div>
</body>
</html>