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
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
   
    <script type="text/javascript">
	 function submit1() {
		ajaxjson();
		document.getElementById("blok-form").action= 'saveMatt';
  return true;
 }
</script>
<script type="text/javascript">
function ajaxjson(){
	var json=document.getElementById("par1").value;
	var mattname=document.getElementById("mattName").value;
	var data ="mattjson="+json+"&mattname="+mattname;
	$.ajax({
		url : "ajaxjson",
		data : data,
		type : "POST",
		
	});
	}
</script>
<script type="text/javascript">
function newJson1(){
	var dateStr=document.getElementById("startDate").value;
	var dateEnd=document.getElementById("endDate").value;
	var timeSlotStr=document.getElementById("timeSlot").value;
	var data="dateStr="+encodeURIComponent(dateStr)+"&dateEnd="+encodeURIComponent(dateEnd)+"&timeSlotStr="+encodeURIComponent(timeSlotStr);
	$.ajax({
		url : "newJson",
		data : data,
		type : "GET",
		success : function(mattToJSON) {
			document.getElementById("par1").value=mattToJSON;
			viewTab(0);
		}
	});
	var data1="dateStr="+encodeURIComponent(dateStr)+"&dateEnd="+encodeURIComponent(dateEnd);
	$.ajax({
		url : "nWek",
		data : data1,
		type : "GET",
		success : function(buf) {
			var mbuf=buf;
			if (mbuf>0){document.getElementById("txtnext").value=mbuf;	
						document.getElementById("next").disabled= false;}
			else {document.getElementById("next").disabled= true;}
			document.getElementById("txtback").value=0;
			document.getElementById("back").disabled= true;
		}
	});
}
    </script> 
    <script>
    function viewTab(s1){
    	var s=s1;
		var arr = $('#par1').attr('value');

        var json = JSON.parse(arr);

        var oldTable = document.getElementById('mattTable'),
                newTable = oldTable.cloneNode();
        var tr = document.createElement('tr');
        tr.id = "dayValue";
        for(var i = s; i < json[2].length && i<s+7; i++){
            var th = document.createElement('th');
            th.appendChild(document.createTextNode(json[2][i]));
            tr.appendChild(th);
        }
        newTable.appendChild(tr);
      
        var tr1 = document.createElement('tr');
        for(var i = s; i < json[1].length && i<s+7; i++){
            var th1 = document.createElement('td');
            var id = "th" + i;
            th1.id = id;
            th1.appendChild(document.createTextNode(json[1][i]));
            th1.style.cursor = "pointer";
            th1.setAttribute("onClick", "changeWek(this.id)");
            tr1.appendChild(th1);
        }
	       newTable.appendChild(tr1);
	      oldTable.parentNode.replaceChild(newTable, oldTable);
	      
	      var oldTable = document.getElementById('mattTable1'),
    	 newTable = oldTable.cloneNode();
	      
        for(var i = 0; i < json[3].length; i++){
            var tr = document.createElement('tr');
            for(var j = s; j < json[2].length && j<s+7; j++){
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
    }
    </script>
    <script>
    function mback(){
	  var x=document.getElementById("txtnext").value;
  	  var y=document.getElementById("txtback").value;
  	  x++;
  	  y--;
  	  document.getElementById("txtnext").value=x;
  	  document.getElementById("txtback").value=y;
  	  viewTab(y*7);
  	  if(x>0)document.getElementById("next").disabled=false;
  	  if(y==0)document.getElementById("back").disabled=true;
    }
    </script>
    <script>
  function mnext(){
	  var x=document.getElementById("txtnext").value;
	  var y=document.getElementById("txtback").value;
	  x--;
	  y++;
	  document.getElementById("txtnext").value=x;
	  document.getElementById("txtback").value=y;
	  viewTab(y*7);	  
	  if(x==0)document.getElementById("next").disabled=true;
	  if(y>0)document.getElementById("back").disabled=false;
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
        #shareembedemail {
            display: inline-block;
            text-align: center;
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
        #art::-webkit-scrollbar { width: 0 !important }
    </style>
</head>
<body>
<div class="header">
    <span><a class="logo" href="http://myavailabletime.com/">MyAvailableTime</a></span>
    <span class="topmenu" style="float:right;"> Logout</span>
    <span class="topmenu" style="float:right;"> Logged in as:<span id="userName"> ${userName}</span></span>
</div>
<div id="wrapper">
	<form id="blok-form" name="blok-form">
    <div id="first">
        <div class="left">
            <p style="font-size: 1em ">${name}'s Calendar</p>
            <button id="back" type="button" disabled onclick="mback()">back</button>
            <button id="next" type="button" disabled onclick="mnext()">next</button>
        </div>
        <div  >
 			  <input id="par1" name="mattToJSON" value='${matJSON}' type=hidden style="display:none"/>
              <input id="txtback" name="txtback" value=0 />
 			  <input id="txtnext" name="txtnext" value=0 />
 			<div>
            <table id="mattTable" border="1" width="100%" >
            </table>
            </div>
            <div id="art" style="overflow:scroll; height:300px; width:100% ">
            <table id="mattTable1" border="1" width="100%" >
            </table>
            </div>
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
		            var id = "th" + i;
                    th1.id = id;
		            th1.appendChild(document.createTextNode(json[1][i]));
		            th1.style.cursor = "pointer";
		            th1.setAttribute("onClick", "changeWek(id)");
		            th1.style.cursor = "pointer";
		            tr1.appendChild(th1);
		        }
 		       newTable.appendChild(tr1);
 		      oldTable.parentNode.replaceChild(newTable, oldTable);
 		      
 		      var oldTable = document.getElementById('mattTable1'),
            	 newTable = oldTable.cloneNode();

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
            
                 function changeWek(arg){
                	 var arr = $('#par1').attr('value');
                	 var json = JSON.parse(arr);
                     var j;
                     var id = arg.replace ( /[^\d.]/g, '' );
                     if (id<100){ j = arg.slice(2,3);}
                     else { j = arg.slice(2,4);}
                    // var cell = document.getElementById(arg);
                     for(var i = 0; i < json[3].length; i++){
                    	var id1 = "td" + i + j;
                    	var cell = document.getElementById(id1);
                     	if(cell.style.backgroundColor == "yellow" || cell.style.backgroundColor == "green"){
                    		cell.style.backgroundColor = "#f0f0f0";
                    		cell.style.cursor =" ";
                     		json[4][i][j]=0;
                     		$('#par1').attr('value', JSON.stringify(json));}
                     	else {
                     		cell.style.backgroundColor = "yellow"
                     		cell.setAttribute("onClick", "changeColor(id)");
                     		cell.style.cursor = "pointer";
                     		json[4][i][j]=1;
                     		$('#par1').attr('value', JSON.stringify(json));}
                     }
                
                 }
                function changeColor(arg)
                {
                	var arr = $('#par1').attr('value');
                	var json = JSON.parse(arr);
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
   				Name:<input id="mattName" name="mattName" type="text" style="width: 70%; float: right;"  ><br>
            </div>
                <p>Starting date <input type="text" id="startDate" name="startDate" value='${startDate}' style="border: none; color: blue; cursor: pointer; background: #d6f000; font-size: 0.8em; float: right; width: 120px; text-align: right;  "></p>
                <p>Ending date<input type="text" id="endDate" name="endDate" value='${endDate}' style="border: none; color: blue; cursor: pointer; background: #d6f000; font-size: 0.8em; float: right; width: 120px; text-align: right; "></p>
               <script>
    var dates = $("#startDate").datepicker({
      defaultDate: "+1w",
      changeMonth: true,
      numberOfMonths: 1,
      dateFormat: "dd.mm.yy",
      onSelect: function(selectedDate){
        var option = this.id == "startDate" ? "minDate" : "maxDate",
        instance = $( this ).data( "datepicker" ),
        date = $.datepicker.parseDate(
          instance.settings.dateFormat || $.datepicker._defaults.dateFormat,
          selectedDate, instance.settings);
        dates.not(this).datepicker("option", option, date);
        newJson1();}
    });
    var dates = $("#endDate").datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 1,
        dateFormat: "dd.mm.yy",
        onSelect: function(selectedDate){
          var option = this.id == "endDate" ? "minDate" : "maxDate",
          instance = $( this ).data( "datepicker" ),
          date = $.datepicker.parseDate(
            instance.settings.dateFormat || $.datepicker._defaults.dateFormat,
            selectedDate, instance.settings);
          dates.not(this).datepicker("option", option, date);
          newJson1();}
      });
  </script> 
            <p>Time slot 	<select id="timeSlot" name="timeSlot" onchange="newJson1()" style="margin-left: 20px; float:right; vertical-align: text-bottom; width: 75px">
                <option value="15" ${ts15}>15 min</option>
                <option value="30" ${ts30}>30 min</option>
                <option value="60" ${ts60}>1 hour</option>
            </select></p>
           
            <div>
                <div style="text-align:right; margin: 40px 10px 0px 0px; color: white">
                	<button id="saveMatt" type="submit" onclick="submit1()" >SAVE</button>
            	</div>
        	</div>
		</div>
    </div>
	</form>
</div>
</body>
</html>