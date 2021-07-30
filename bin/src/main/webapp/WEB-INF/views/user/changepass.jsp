<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
crossorigin="anonymous">
<script
src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
crossorigin="anonymous"></script>
<!-- <link rel="stylesheet" href="/css/style.css"> -->

<script type="text/javascript" src="js/Register.js"></script> 
<script type="text/javascript" src="/js/leftmenu.js"></script>
<link href="/css/leftmenu.css" rel="stylesheet" type="text/css">
<link href="/css/topnav.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="/js/changepass.js"></script>
<script type="text/javascript" src="/js/changepass1.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<style>
#eye {
color: black;
}

.card-header {
background-color: #4E7E6B;
border-radius: 0px !important;
margin: 0;
top-padding: 20px;
}

.editing {
position: absolute;
right: 22px;
transform: translate(0, -50%);
cursor: pointer;
font-size: 20px;
color: #7a797e;
margin-top: -17px;
}

#message {
display: none;
}

#message p {
font-size: 15px;
padding-left: 20px;
}

.color {
color: black;
}

.invalid {
color: red;
}

.valid {
color: green;
}

.card {
border-radius: 0px !important;
min-width: 400px;
min-height: 300px;
}

.btn-primary {
background-color: #4E7E6B;
}

.box {
            width: 20%;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.2);
            padding: 35px;
            border: 2px solid #fff;
            border-radius: 20px/50px;
            background-clip: padding-box;
            text-align: center;
          }
          .button {
            font-size: 1em;
            padding: 10px;
            color: #fff;
            border: 2px solid orange;
            border-radius: 20px/50px;
            text-decoration: none;
            cursor: pointer;
            transition: all 0.3s ease-out;
          }
          .button:hover {
            background: orange;
          }
          .overlay {
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            background: rgba(0, 0, 0, 0.7);
            transition: opacity 500ms;
            visibility: visible;
            opacity: 1;
          }
          .overlay:target {
            visibility: hidden;
            opacity: 0;
            display:none
          }
          .popup {
            margin: 70px auto;
            padding: 20px;
            background:white;
            border-radius: 5px;
             border: 2px solid green;
            width: 60%;
            
            position: relative;
            transition: all 5s ease-in-out;
          }
          .popup h2 {
            margin-top: 0;
            color: #333;
            font-family: Tahoma, Arial, sans-serif;
          }
          .popup .close {
            position: absolute;
            top: 1px;
            right: 4px;
            transition: all 200ms;
            font-size: 30px;
            font-weight: bold;
            text-decoration:center;
            color: #333;
          }
          .popup .close:hover {
            color: red;
          }
          .popup .content {
            max-height: 50%;
            overflow: auto;
          }
          .smile
          {
            top:48px;
            left:65px;
            
          }
</style>
<div class="space"></div>
<div class="col-md right">
<div class="container h-100">
<div class="row align-items-center h-100">
<div class="card shadow border-0 mx-auto">
<div class="card-header p-4"></div>
<div class="loader h-100">
<div class="dots" style="display: none; opacity: 0">
<div style="position: absolute; bottom: 35%; left: 30%;"
class="row justify-content-center">
<svg width="4em" height="4em" viewBox="0 0 16 16"
class="bi bi-dot" fill="#e8b513"
xmlns="http://www.w3.org/2000/svg"> <path
fill-rule="evenodd"
d="M8 9.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z" /> </svg>
<svg width="4em" height="4em" viewBox="0 0 16 16"
class="bi bi-dot" fill="#4181eb"
xmlns="http://www.w3.org/2000/svg"> <path
fill-rule="evenodd"
d="M8 9.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z" /> </svg>
<svg width="4em" height="4em" viewBox="0 0 16 16"
class="bi bi-dot" fill="#2ba34c"
xmlns="http://www.w3.org/2000/svg"> <path
fill-rule="evenodd"
d="M8 9.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z" /> </svg>
</div>
</div>
<c:if test = "${message3 != null}"> 
    <div id="popup1" class="overlay">
    <div class="popup" >
    <a class="close" href="#popup1">×</a>
    <div class="content">
    <h6 style="color:red"><b>${message3}</b><a class="close" href="#popup1">×</a></h6> 
    </div>
    </div>
    </div>
</c:if> 

<c:if test = "${message4 != null}"> 
    <div id="popup2" class="overlay1">
    <div class="popup1" >
    <a class="close" href="#popup2">×</a>
    <div class="content">
    <h6 style="color:green"><b>${message4}</b><a class="close" href="#popup2">×</a></h6> 
    </div>
    </div>
    </div>
</c:if> 
<div class="row">
<div class="card-body p-4">

<h5 class="text-grey text-center mt-0 font-weight-bold">Change
Password</h5>
<!-- <p class="text-center text-muted">Enter Your Details</p> -->
<form onsubmit="validateForm(event)" method="POST"
action="/user/changepass" id="registration_form" novalidate>


<div class="form-group p-1">


<!-- --------------------------------------------------PASSWORD---------------------------------------------------------------- -->
<label class="control-label required"> Old Password </label> <input
type="password" name="oldpassword" onblur="checklist();"
placeholder="Enter your password" id="form_password"
class="form-control"><i class="fa editing fa-eye"
aria-hidden="true" id="eye" onclick="toggle()"></i>
<div id="password_error_message" class="text-danger" font-weight-bold></div>


<!-- --------------------------------------------NEW PASSWORD---------------------------------------------------------------- -->
<label class="control-label required"> New Password </label> <input
type="password" name="newpassword" placeholder="New Password" 
id="form_Npassword" class="form-control"> <i
class="fa editing fa-eye" aria-hidden="true" id="eye1"
onclick="toggle1()"></i>
<div id="newpassword_error_message" class="text-danger" font-weight-bold></div>
<div id="message" >
Password must contain the following:
<p id="letter" class="color">
<b>Lowercase</b> letter
</p>
<p id="capital" class="color">
<b>Uppercase</b> letter
</p>
<p id="number" class="color">
<b>Number</b>
</p>
 <p id="special" class="color" >
 <b>Special character</b>
 </p>
<p id="length" class="color">
<b>Minimum</b> 8 Characters
</p>
</div>

<!-- --------------------------------------------CONFIRMED PASSWORD---------------------------------------------------------------- -->
<label class="control-label required"> Confirm
Password </label> <input type="password" name="confirmpassword"
placeholder="Confirm Password" id="form_Cpassword"
class="form-control"> <i class="fa editing  fa-eye"
aria-hidden="true" id="eye2" onclick="toggle2()"></i>
<div id="retype_password_error_message" class="text-danger" font-weight-bold></div>
<!-- ----------------------------------------------SUBMIT--------------------------------------------------------------- -->
<br>
<div class="row">
<button value="submit" id="submit"
class="btn btn-primary mx-auto ">
<span class="btn-text">Submit</span>
</button>
</div>
</row>
</div>
</form>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

