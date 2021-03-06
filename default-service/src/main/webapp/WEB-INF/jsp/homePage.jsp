<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
	
 <a href="/logout">Click here to logout</a>
 
 <!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}
.pulse{background:#57e200;
color:white !important;
-webkit-animation: pulse 5s infinite cubic-bezier(0.66, 0, 0, 1);
-moz-animation: pulse 5s infinite cubic-bezier(0.66, 0, 0, 1);
-ms-animation: pulse 5s infinite cubic-bezier(0.66, 0, 0, 1);
animation: pulse 5s infinite cubic-bezier(0.66, 0, 0, 1);
}
@-webkit-keyframes pulse {to {box-shadow: 0 0 0 15px rgba(232, 76, 61, 0);}}
@-moz-keyframes pulse {to {box-shadow: 0 0 0 15px rgba(232, 76, 61, 0);}}
@-ms-keyframes pulse {to {box-shadow: 0 0 0 15px rgba(232, 76, 61, 0);}}
@keyframes pulse {to {box-shadow: 0 0 0 15px rgba(232, 76, 61, 0);}}

/* Full-width input fields */
input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

/* Set a style for all buttons */
button {
		background-color: rgb(185 0 0);
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: rgb(0 188 212/ 52%);
}

/* Center the image and position the close button */
.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
	position: relative;
}

img.avatar {
	width: 40%;
	border-radius: 50%;
}

.container {
	padding: 16px;
}

span.psw {
	float: right;
	padding-top: 16px;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 8% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	border: 1px solid #888;
	width: 30%; /* Could be more or less, depending on screen size */
	
}

/* The Close Button (x) */
.close {
	position: absolute;
	right: 25px;
	top: 0;
	color: #000;
	font-size: 35px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: red;
	cursor: pointer;
}

/* Add Zoom Animation */
.animate {
	-webkit-animation: animatezoom 1s;
	animation: animatezoom 1s
}

@
-webkit-keyframes animatezoom {
	from {-webkit-transform: scale(0)
}

to {
	-webkit-transform: scale(1)
}

}
@
keyframes animatezoom {
	from {transform: scale(0)
}

to {
	transform: scale(1)
}

}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}
</style>
<script type="text/javascript">
var userName = "";
var isActive = false;
	$(document).ready(function() {
		console.log("Hello Mr.Noolee")
		userName = "${userName}";
		isActive = ("true"=="${isActive}");
		console.log("Current logged in user----> " + userName);
		if(isActive){
			$("#status").html('Status : <div class="pulse" style="'
			+"height: 15px;"
		    +"width: 10px;"
		    +"margin-left: 1%;"
		    +"margin-top: 0px;"
		    +"font-size: 4px;"
		    +"padding-left: 5px;"
		    +"line-height: 11px;"
		    +"border-radius: 50px;"
		    +"border: 1px solid #57e200;"
		    +"color: #57e200;"
		    +"display: inline-block;"
		    +"vertical-align: top;"
		    +"box-shadow: 0px 3px 12px 0px #57e200;"
		+"\"></div>")
		}else{
			$("#status").html('Status : <i class="pulse fa fa-circle" aria-hidden="true"'
					+'style="font-size: 15px; color: rgb(185 0 0);"></i>')
		}
		
	});
</script>
</head>
<body style = "background: #3c3c3c;">
	<form class="modal-content animate" action="login" method="post">
		<div class="imgcontainer">
			<i class="fa fa-user-circle-o" aria-hidden="true"
				style="font-size: 130px; color: rgb(185 0 0);"></i>
		</div>

		<div class="container">
			<div id = 'status' style = "width: 22%;margin: auto;">Status : </div>
			<h2 style = "text-decoration: underline; color : #3c3c3c; text-align:center;">Logged in User Details</h2>
				<br>
				<ul>
					<li>Username : ${userName}</li>
					<li>Has this user's password expired? : ${!hasPasswordExpired}</li>
				</ul>

		</div>
	</form>
</body>
</html>
 