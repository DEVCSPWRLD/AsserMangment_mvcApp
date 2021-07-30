<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
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
          .confirm
          {
            width:370px;
          }
          .error_form
          {
            color:red;
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
          
        
</style>
<link rel="stylesheet" href="css/topnav.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet"
href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
crossorigin="anonymous">
<script
src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
crossorigin="anonymous"></script>

<title>Register</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="js/Register.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="js/registration.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<ul class="topnav">
 <li class="right" class="form-popup"><a href="login">Log In</a></li>
<!--  <li class="left"><a href="home">Home</a></li> -->
 <h1 class="center" style="text-align:center;color:white">Asset Management Tool</h1>
</ul>
<div class="space"></div>
<div class="col-md right">
<div class="container h-100">
<div class="row align-items-center h-100">
<div class="card shadow border-0 mx-auto">
<div class="card-header p-4">

</div>
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
<div class="row">
<div class="card-body p-4">
<h5 class="text-grey text-center mt-0 font-weight-bold">Sign Up</h5>
<form onsubmit="validateForm(event)"  method="POST" action="save" id="registration_form" novalidate>

<!-- -------------------------------------------------Type Of User---------------------------------------------------------------- -->


<input type="hidden" id="user" name="typeofuser" value="USER" /> 



<!-- --------------------------------------------------NAME---------------------------------------------------------------- -->
<div class="form-group p-1">
<div >
<label class="control-label required">
FULL NAME
</label></br>
<input type="text" id="form_fname" name="fullname" required="" placeholder="Enter Your Name" style="width:370px;">
<div class="error_form" id="fname_error_message" style="color:red;"></div>
</div>
<!-- --------------------------------------------------EMPLOYEE ID---------------------------------------------------------------- -->
<div>
                   <label class="control-label required" >
EMPLOYEE ID
</label></br> 
<input type="text" id="form_sname" name="eid" required="" placeholder="Enter Employee Id" style="width:370px;">
<div class="error_form" id="sname_error_message" style="color:red;"></div>
</div>
<!-- --------------------------------------------------DESIGNATION---------------------------------------------------------------- -->
<div>
                   <label class="control-label required" >
DESIGNATION
</label></br> 
<input type="text" id="form_deg" name="desig" required="" placeholder="Enter Your Designation" style="width:370px;">
<div class="error_form" id="deg_error_message" style="color:red;"></div>
</div>
<!-- --------------------------------------------------EMAIL ID---------------------------------------------------------------- -->
<div>
                  <label class="control-label required">EMAIL ID</label></br>
<input type="email" id="form_email" name="email" required="" placeholder="Enter Email Id" onblur="checklist()" style="width:370px;">
<div class="error_form" id="email_error_message" style="color:red;"></div>
</div>
 <c:if test = "${message2 != null}"> 
    <div id="popup1" class="overlay" >
    <div class="popup" >
    <a class="close" href="#popup1">×</a>
    <div class="content">
    <h6 style="color:red"><b>${message2}</b><a class="close" href="#popup1">×</a></h6> 
    </div>
    </div>
    </div>
</c:if>

<!-- --------------------------------------------------PASSWORD---------------------------------------------------------------- -->
<div>
                <label class="control-label required">PASSWORD</label> </br>
                <input type="password" id="form_password" name="password" required="" placeholder="Enter Password" style="width:370px;"onclick="show()">
                <i class="fa fa-eye" aria-hidden="true" id="eye" onclick="toggle()" ></i>
<div class="error_form" id="password_error_message" style="color:red;"></div>
</div>
<div id="message" >
<p  style="float:center;">
Password must contain the following:
</p>
<p id="letter" class="color" style="text-align:center;">
<b>Lowercase</b> letter
</p>
<p id="capital" class="color" style="float:right;">
<b>Uppercase</b> letter
</p>
 <p id="special" class="color" >
 <b>Special character</b>
 </p>
 <p id="length" class="color" style="float:right;">
<b>Minimum</b> 8 Characters
</p>
 <p id="number" class="color" >
<b>Number</b>
</p>
</div>
<!-- --------------------------------------------CONFIRMED PASSWORD---------------------------------------------------------------- -->
<!-- <input type="password" name="Cpassword"  placeholder="Confirm Password" id="Cpass" style="display:none"
class="form-control"><i class="fa fa-eye" aria-hidden="true" id="eye1"style="display:none" onclick="toggle1()" ></i>
<div id="ChangePassword" style="display:none" class="text-danger" font-weight-bold></div>
</div> -->
<div>
                  <label class="control-label required" style="display:none;" id="form_retype_text">CONFIRMED PASSWORD</label> 
<input type="password" id="form_retype_password" name="" required="" style="display:none;" 
placeholder="Enter Confirm Password" class="confirm">
<i class="fa hide fa-eye" aria-hidden="true" id="eye1" style="display:none;" onclick="toggle1()" ></i>
<div class="error_form" style="display:none;" id="retype_password_error_message" ></div>
</div>
<!-- --------------------------------------------ROLE---------------------------------------------------------------- -->
<label>

</label> <input type="hidden" name="role" value="ROLE_USER" id="role" 
class="form-control">

<!-- ----------------------------------------------SUBMIT--------------------------------------------------------------- -->
<div class="row">
<button value="submit" href="/login.jsp" id="submit" 
class="btn btn-primary mx-auto">
<span class="btn-text">Register</span>
</button>
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
