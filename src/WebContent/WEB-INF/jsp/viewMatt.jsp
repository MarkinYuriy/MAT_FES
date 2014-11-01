<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>MyAvailableTime</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/demos/style.css">
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
        .left {
            text-align: left;
            padding:0px 20px 0 20px;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 1.6em;
            color: #888888;
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
</div>
<div id="wrapper">
    <div id="first">
        <div class="left">
            <p style="font-size: 1em "><span id="username"></span></p>
        </div>
        <div>
			<input id="par1" name="mattToJSON" value='${matJSON}' type=hidden style="display:none"/>
            <table id="mattTable">

            </table>
            <script>
                var arr = $('#par1').attr('value');
                var json = JSON.parse(arr);//"${JSON}" should be passed instead of arr
               document.getElementById('username').innerHTML=json[0];
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
                        } 
                        tr.appendChild(td);
                    }
                    newTable.appendChild(tr);
                }
                oldTable.parentNode.replaceChild(newTable, oldTable);
            </script>
        </div>
    </div>
</div >
</body>
</html>