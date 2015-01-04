<%@ page language="java" contentType="text/html"%>
<%@ page import="java.util.*"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	// Create an ArrayList with test data /* ${matt}; */
	String emails = "001@yahoo.com 0003@gmail.com myavailabletime@gmail.com 0004@gmail.com 0005@gmail.com";
	String delims = "[ ;,]+";
	String[] email = emails.split(delims);

	ArrayList list = new ArrayList();

	for (int i = 0; i < email.length; i++)
		list.add(email[i]);
	pageContext.setAttribute("addresses", list);
%>

<html>
<head>
<title>E-mail addresses</title>
<script type="text/javascript">
    var MesValidAddr = 'Please enter valid Email-Address.';
	function addItems() {
		var ai = document.getElementById("availableEmails");
		var si = document.getElementById("sendEmails");
		for (i = 0; i < ai.options.length; i++) {
			if (ai.options[i].selected) {
				var opt = ai.options[i];
				si.options[si.options.length] = new Option(opt.innerHTML,
						opt.value);
				ai.options[i] = null;
				i = i - 1;
			}
		}
	}

	function addAll() {
		var ai = document.getElementById("availableEmails");
		var si = document.getElementById("sendEmails");
		for (i = 0; i < ai.options.length; i++) {
			var opt = ai.options[i];
			si.options[si.options.length] = new Option(opt.innerHTML, opt.value);
		}
		ai.options.length = 0;
	}

	function removeItems() {
		var ai = document.getElementById("availableEmails");
		var si = document.getElementById("sendEmails");
		for (i = 0; i < si.options.length; i++) {
			if (si.options[i].selected) {
				var opt = si.options[i];
				ai.options[ai.options.length] = new Option(opt.innerHTML,
						opt.value);
				si.options[i] = null;
				i = i - 1;
			}
		}
		sortAvailable();
	}

	function removeAll() {
		var ai = document.getElementById("availableEmails");
		var si = document.getElementById("sendEmails");
		for (i = 0; i < si.options.length; i++) {
			var opt = si.options[i];
			ai.options[ai.options.length] = new Option(opt.innerHTML, opt.value);
		}
		si.options.length = 0;
		sortAvailable();
	}

	function moveUp() {
		var si = document.getElementById("availableEmails");
		var sel = si.selectedIndex;
		if (sel > 0) {
			var optHTML = si.options[sel].innerHTML;
			var optVal = si.options[sel].value;
			var opt1HTML = si.options[sel - 1].innerHTML;
			var opt1Val = si.options[sel - 1].value;
			si.options[sel] = new Option(opt1HTML, opt1Val);
			si.options[sel - 1] = new Option(optHTML, optVal);
			si.options.selectedIndex = sel - 1;
		}
		var si = document.getElementById("sendEmails");
		var sel = si.selectedIndex;
		if (sel > 0) {
			var optHTML = si.options[sel].innerHTML;
			var optVal = si.options[sel].value;
			var opt1HTML = si.options[sel - 1].innerHTML;
			var opt1Val = si.options[sel - 1].value;
			si.options[sel] = new Option(opt1HTML, opt1Val);
			si.options[sel - 1] = new Option(optHTML, optVal);
			si.options.selectedIndex = sel - 1;
		}
	}

	function moveDown() {
		var si = document.getElementById("availableEmails");
		var sel = si.selectedIndex;
		if (sel < si.options.length - 1) {
		//if (sel > 0) {			
			var optHTML = si.options[sel].innerHTML;
			var optVal = si.options[sel].value;
			var opt1HTML = si.options[sel + 1].innerHTML;
			var opt1Val = si.options[sel + 1].value;
			si.options[sel] = new Option(opt1HTML, opt1Val);
			si.options[sel + 1] = new Option(optHTML, optVal);
			si.options.selectedIndex = sel + 1;
		}
		var si = document.getElementById("sendEmails");
		var sel = si.selectedIndex;
		if (sel < si.options.length - 1) {
		//if (sel > 0) {	
			var optHTML = si.options[sel].innerHTML;
			var optVal = si.options[sel].value;
			var opt1HTML = si.options[sel + 1].innerHTML;
			var opt1Val = si.options[sel + 1].value;
			si.options[sel] = new Option(opt1HTML, opt1Val);
			si.options[sel + 1] = new Option(optHTML, optVal);
			si.options.selectedIndex = sel + 1;
		}
	}

	function sortAvailable() {
		var ai = document.getElementById("availableEmails");
		var tmp = "";
		for (i = 0; i < ai.options.length; i++) {
			if (tmp > "")
				tmp += ",";
			tmp += ai.options[i].innerHTML + "~" + ai.options[i].value;
		}
		var atmp = tmp.split(",")
		atmp = atmp.sort();
		ai.options.length = 0;
		for (i = 0; i < atmp.length; i++) {
			var opt = atmp[i].split("~");
			ai.options[i] = new Option(opt[0], opt[1]);
		}
	}

	function frmSubmit() {
		var si = document.getElementById("sendEmails");
//		for (i = 0; i < si.options.length; i++) {
//			si.options[i].selected = true;
//		}
		
//		document.getElementById("sendEmails").submit();
//		document.getElementById("sendE").submit();
	//	var si = document.getElementById("sendEmails");
	    var txt = "";
	    var i;
	    for (i = 0; i < si.length; i++) {
	        txt = txt + si.options[i].text+';';
	    }
	    document.getElementById("hiddenemail").value = txt;
	    return true;
	}
	
	function isValidEmail (emailAddress) {
        var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
        return pattern.test(emailAddress);
    }
	
	function addWritedAddress(val) {
		var ai = document.getElementById("typedAddress").value;
		var ai = ai.replace(",", " ");
		var ai = ai.replace(";", " ");
		var ai = ai.replace("  ", " ");
		var delims = " ";
		var arr = ai.split(delims);
		var si = document.getElementById("sendEmails");
		for (i = 0; i < arr.length; i++) {
	  		   if (!isValidEmail(arr[i]))
	  		       {
	                  alert(MesValidAddr);
	  		       }
	  		   else
	  			   {
				      si.options[si.options.length] = new Option(arr[i]);
				      document.getElementById("typedAddress").value=null;	
	  			   }
			}
	}
	
</script>
<style type="text/css">
.btn {
	width: 90px;
}
</style>
</head>
<body bgcolor="white">
	<!-- Here are all addresses matching your search critera: -->
	<div style="float: left; width: 270;">
		<p>Available Emails</p>
		<select name="availableEmails" id="availableEmails"
			style="width: 250; height: 275;" multiple="multiple">
			<c:set var="iteration" value="0"/>
			<c:forEach items="${getmail}" var="current">
				<c:set var="iteration" value="${iteration}+1"/>
				<option value="<c:out value="${iteration}" />"><c:out value="${current}" /></option>
			</c:forEach>
		</select>
	</div>
<form id="sendE" action="send" method="post" >	
<div 
	style="width: 100px; float: left;">
	    <p>  . </p>
		<input type="button" class="btn" value="Add" onclick="addItems();" />
		<input type="button" class="btn" value="Add All" onclick="addAll();" />
		<input type="button" class="btn" value="Remove" onclick="removeItems();" /> 
		<input type="button" class="btn" value="Remove All" onclick="removeAll();" /> 
		
		<!-- <input type="button" class="btn" value="Move Up" onclick="moveUp();" /> 
		<input type="button" class="btn" value="Move Down" onclick="moveDown();" /> -->
		
		<input type="submit" class="btn" value="Send" onclick="frmSubmit();" />
	</div>
	<input type="hidden" id="hiddenemail" name="hiddenemail" />

    <input type="hidden" id="table" name="table" value="${table}">	</form>

	<div style="float: left; width: 270;">		
		<p>Emails to send</p>
		<select name="sendEmails" id="sendEmails" style="width: 250; height: 200;"
			multiple="multiple">
		</select>
		<p> Enter e-mail address:</p> 
			<input type="text" name="typedAddress" id="typedAddress" style="width: 250;" value="" onchange="addWritedAddress(this.value)">	</div>
</body>
</html>
