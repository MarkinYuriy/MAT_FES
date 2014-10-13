<%--
  Created by IntelliJ IDEA.
  User: Krasnov
  Date: 10/13/14
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
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
            <p style="font-size: 1em "><span id="username"/></p>
        </div>
        <div>
            <table id="mattTable">

            </table>
            <script>
                /*this should be removed, used for testing only*/
                var arr = '[["Test calendar"],["Mon","Tue","Wed"],["13.10","14.10","15.10"],["09:00","09:30","10:00","10:30","11:00","11:30","12:00","12:30","13:00","13:30","14:00","14:30","15:00","15:30"],[[0,0,0],[0,0,0],[0,0,0],[0,1,1],[1,1,0],[0,0,0],[0,0,1],[1,0,0],[0,0,1],[1,0,0],[0,0,0],[0,1,1],[0,0,0],[0,0,1]]]';

                /*instead "arr" we pass string with matt data whatever its name is
                 file  named "json" is changing its value due to color selection
                 and should be passed to controller on @RequestMapping*/
                alert(arr);
                var json = JSON.parse(arr);//"${JSON}" should be passed instead of arr
                var json_example = json;

                /*generating a table according to our data*/
                document.getElementById('username').innerHTML=json[0];
                var oldTable = document.getElementById('mattTable'),
                        newTable = oldTable.cloneNode();
                var tr = document.createElement('tr');
                tr.id="dayValue";
                for(var i = 0; i < json_example[1].length; i++){
                    var th = document.createElement('th');
                    th.appendChild(document.createTextNode(json_example[2][i]));
                    tr.appendChild(th);
                }
                newTable.appendChild(tr);

                var tr1 = document.createElement('tr');
                tr1.id="dateValue";
                for(var i = 0; i < json_example[2].length; i++){
                    var th1 = document.createElement('td');
                    th1.appendChild(document.createTextNode(json_example[1][i]));
                    tr1.appendChild(th1);
                }
                newTable.appendChild(tr1);


                for(var i = 0; i < json_example[3].length; i++){
                    var tr = document.createElement('tr');
                    for(var j = 0; j < json_example[2].length; j++){
                        var td = document.createElement('td');
                        var id = "td" + (i) + (j);
                        td.id = id;
                        td.appendChild(document.createTextNode(json_example[3][i]));
                        if(!json_example[4][i][j]) {
                            td.style.backgroundColor = "green";

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
            </script>
        </div>
    </div>
</div >
</body>
</html>