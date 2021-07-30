<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

 <link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<title>Inventory</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <script type="text/javascript" src="js/Login.js"></script> -->
<!-- <script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
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
 
.popover{width:100%;
background-color: #4E7E6B;
color: white;
}
.card-header {
	background-color: #4E7E6B;
	border-radius: 0px !important;
	margin: 0;
	top-padding: 20px;
} 

.btn-primary {
	color: #fff;
	background-color: #4E7E6B;
	border-color: #2e6da4;
}

#eye{
 position: absolute;
 left: 330px;
 cursor: pointer;
 transform: translate(0,-170%);

 

}
#eye1{
 position: absolute;
 left: 330px;
 cursor: pointer;
 transform: translate(0,-170%);
}
</style>
</head>
<body>
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
							</div>
						</div>

						<div class="row">
							<div class="card-body" style="width: 25vw;">
								<h4 class="text-grey text-center mt-0 font-weight-bold">Sign Up</h4>
								<form:form class="form-horizontal" action="../save"
                                     cssClass="float-label" id="trxForm"
                                    name="myform" method="POST"
                                    onsubmit="return  Validate()">
									
									<div class="form-group p-1">   


										<div class="container" style="width: inherit;">
											

												<!-- -------------------------------------------------Type Of User---------------------------------------------------------------- -->


														<input type="hidden" id="user" name="typeofuser" value="USER" /> 



												<!-- --------------------------------------------------NAME---------------------------------------------------------------- -->
												<div class="form-group p-1">
												
												<label class="control-label required">Full Name</label></br>
												<input type="text" id="form_fname" name="fullname" required="" placeholder="Enter Your Name" class="form-control" >
												<div class="error_form" id="fname_error_message" style="color:red;"></div>
												
												<!-- --------------------------------------------------EMPLOYEE ID---------------------------------------------------------------- -->
												<div>
												<label class="control-label required" >Employee ID</label></br> 
												<input type="text" id="form_sname" name="eid" required="" placeholder="Enter Your Employee Id" class="form-control" >
												<div class="error_form" id="sname_error_message" style="color:red;"></div>
												</div>
												
												<!-- --------------------------------------------------DESIGNATION---------------------------------------------------------------- -->
												<div><label class="control-label required" >Designation</label></br> 
												<input type="text" id="form_deg" name="desig" required="" placeholder="Enter Your Designation" class="form-control" >
												<div class="error_form" id="deg_error_message" style="color:red;"></div>
												</div>
												<!-- --------------------------------------------------REPORTING MANAGER---------------------------------------------------------------- -->
												<div><label class="control-label required" >Reporting Manager Email ID</label></br> 
												<input type="text" id="form_rm" name="reportingmanager" required="" placeholder="Enter Your Reporting Manager's Email" class="form-control">
												<div class="error_form" id="rm_error_message" style="color:red;"></div>
												</div>
												<!-- --------------------------------------------------EMAIL ID---------------------------------------------------------------- -->
												<div><label class="control-label required">Email ID</label></br>
												<input type="email" id="form_email" name="email" required="" placeholder="Enter Your Email Id" onblur="checklist()" class="form-control">
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
												<div> <label class="control-label required">Password</label> </br>
												 <input type="password" id="form_password" name="password" required="" placeholder="Enter Password" class="form-control" onclick="show()">
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
												<!-- --------------------------------------------------CONFIRMED PASSWORD---------------------------------------------------------------- -->
												<div> <label class="control-label required">Confirm Password</label> </br>
												 <input type="password" id="form_retype_password" name="cpassword" required="" placeholder="Enter Confirm Password" class="form-control" onclick="show()">
												<i class="fa fa-eye" aria-hidden="true" id="eye1" onclick="toggle1()" ></i>
												<div class="error_form" id="retype_password_error_message" style="color:red;"></div>
												</div>
												<label>
												<!-- ------------------------------------------------ROLE---------------------------------------------------------------- -->
												</label> <input type="hidden" name="role" value="ROLE_USER" id="role" 
												class="form-control">

												<!-- ------------------------------------------------SUBMIT-------------------------------------->
												<br>
												<div class="container" >
                                     		   	<div class="row">
                                     			 <div class="col-md-4">
    											<div class="btn-group">	
												<div class="row">
													<button value="submit" id="submit"
														class="btn btn-primary mr-2 ml-4">
														<span class="btn-text">Save</span>
														<div class="row"></div>
													</button>
													<button value="submit" id="submit"
														class="btn btn-primary mr-2 ml-4">
														<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/dashboard">Cancel</a></span>
														<div class="row"></div>
													</button>
												</div>
											</div>
										</div>
									</div>
									</div>
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
$(function() {

    $("#fname_error_message").hide();
    $("#sname_error_message").hide();
     $("#deg_error_message").hide(); 
     $("rm_error_message").hide(); 
    $("#email_error_message").hide();
    $("#password_error_message").hide();
    $("#retype_password_error_message").hide();

    var error_fname = false;
    var error_sname = false;
    var error_deg = false;
    var error_rm = false;
    var error_email = false;
    var error_password = false;
    var error_retype_password = false;

    $("#form_fname").focusout(function(){
       check_fname();
    });
    $("#form_sname").focusout(function() {
       check_sname();
    });
    $("#form_deg").focusout(function() {
       check_deg();
    });
    $("#form_rm").focusout(function() {
       check_rm();
    });
    
    $("#form_email").focusout(function() {
       check_email();
    });
    $("#form_password").focusout(function() {
       check_password();
    });
    $("#form_retype_password").focusout(function() {
       check_retype_password();
    });

    function check_fname() {
       var pattern = /^[a-zA-Z ]+$/;
       var fname = $("#form_fname").val();
       if (pattern.test(fname) && fname !== '') {
          $("#fname_error_message").hide();
          $("#form_fname").css("border-bottom","3px solid #34F458");
       } else 
         {
            if(fname === '')
             {
                 $("#fname_error_message").html("**Enter Your Name**");
                 $("#fname_error_message").show();
                 $("#form_fname").css("border-bottom","3px solid #F90A0A");
                 error_fname = true;
              }
          else
          {
               	$("#fname_error_message").html("**Name Should Contain Characters Only**");
                     $("#fname_error_message").show();
                    $("#form_fname").css("border-bottom","3px solid #F90A0A");
                     error_fname = true;
            }
          
       }
    }

    function check_sname() {
       var pattern =/^[A-Za-z0-9]+$/;
       var sname = $("#form_sname").val()
        if(sname==='')
       {
             $("#sname_error_message").html("**Enter Employee ID**");
             $("#sname_error_message").show();
             $("#form_sname").css("border-bottom","3px solid #F90A0A");
             error_fname = true;
       }
       if (pattern.test(sname) ) {
          $("#sname_error_message").hide();
          $("#form_sname").css("border-bottom","3px solid #34F458");
       } 
      if(sname!==''&& !pattern.test(sname))
        {
          $("#sname_error_message").html("**Invalid Employee ID**");
          $("#sname_error_message").show();
          $("#form_sname").css("border-bottom","3px solid #F90A0A");
          error_fname = true;
       }
    }
     function check_deg() {
       var pattern = /^[a-zA-Z ]+$/;
       var deg = $("#form_deg").val();
       if (pattern.test(deg) && deg !== '') {
          $("#deg_error_message").hide();
          $("#form_deg").css("border-bottom","3px solid #34F458");
       } else 
         {
            if(deg === '')
             {
                 $("#deg_error_message").html("**Enter Your Designation**");
                 $("#deg_error_message").show();
                 $("#form_deg").css("border-bottom","3px solid #F90A0A");
                 error_deg = true;
              }
          else
          {
               	$("#deg_error_message").html("**Designation Should Contain Characters Only**");
                     $("#deg_error_message").show();
                    $("#form_deg").css("border-bottom","3px solid #F90A0A");
                     error_deg = true;
            }
          
       }
    } 
   function check_rm(){
       var pattern = /^[a-z0-9_]+@[a-z0-9-]+(?:\.[a-z0-9-]+)*$/;
       var rm = $("#form_rm").val();
       if (pattern.test(rm) && rm !== '') {
          $("#rm_error_message").hide();
          $("#form_rm").css("border-bottom","3px solid #34F458");
       } else 
         {
            if(rm === '')
             {
                 $("#rm_error_message").html("**Enter Email Of Reporting Manager**");
                 $("#rm_error_message").show();
                 $("#form_rm").css("border-bottom","3px solid #F90A0A");
                 error_rm = true;
              }
          else
          {
               	$("#rm_error_message").html("**Invalid Email**");
                     $("#rm_error_message").show();
                    $("#form_rm").css("border-bottom","3px solid #F90A0A");
                     error_rm = true;
            }
          
       }
    } 
     
     
      function check_password(){
       var pattern =/^(?=^.{8,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]/;
       var password = $("#form_password").val();
      
       /* if(password=='')
       {
alert(password);
             $("#password_error_message").html("**Enter Password **");
             $("#password_error_message").show();
             $("#form_password").css("border","3px solid #F90A0A");
             error_fname = true;
alert(password);
       }*/
       
      if(!pattern.test(password) || password == '') {

 if(password=='')
       {

             $("#password_error_message").html("**Enter Password **");
             $("#password_error_message").show();
             $("#form_password").css("border-bottom","3px solid #F90A0A");
             error_fname = true;
       }
       else
{
 $("#password_error_message").html("**Invalid Password**");
          $("#password_error_message").show();
          $("#form_password").css("border-bottom","3px solid #F90A0A");
          error_fname = true;
       }
}


        
       if (pattern.test(password) && password !== '') {
          $("#password_error_message").hide();
          $("#form_password").css("border-bottom","3px solid #34F458");
       } 
    }
     
    

    function check_retype_password() {
       var password = $("#form_password").val();
       var retype_password = $("#form_retype_password").val();
       if (password !== retype_password) 
       {
           /*if( retype_password==='')
            { 
             $("#retype_password_error_message").html("**Enter Confirm Password **");
             $("#retype_password_error_message").show();
             $("#form_retype_password").css("border","3px solid #F90A0A");
             error_retype_password = true;
          }
        */
                $("#retype_password_error_message").html("** Passwords Did Not Match**");
             $("#retype_password_error_message").show();
             $("#form_retype_password").css("border-bottom","3px solid #F90A0A");
             error_retype_password = true;
           
         
       } else {
          $("#retype_password_error_message").hide();
          $("#form_retype_password").css("border-bottom","3px solid #34F458");
       }
    }

    function check_email() 
      {
       var pattern =/^[a-z0-9_]+@[a-z0-9-]+(?:\.[a-z0-9-]+)*$/;
       var email = $("#form_email").val();
       
       if (pattern.test(email) && email !== '') {
          $("#email_error_message").hide();
          $("#form_email").css("border-bottom","3px solid #34F458");
       } else 
         {
          if(email=='')
         {

          $("#email_error_message").html("**Enter  Email**");
          $("#email_error_message").show();
          $("#form_email").css("border-bottom","3px solid #F90A0A");
          error_email = true;
          }
       
         else
        {
           $("#email_error_message").html("**Invalid Email**");
          $("#email_error_message").show();
          $("#form_email").css("border-bottom","3px solid #F90A0A");
          error_email = true;
        }
    }
}

    $("#registration_form").submit(function() {
       error_fname = false;
       error_sname = false;
       error_email = false;
       error_deg=false;
       error_rm=false;
       error_password = false;
       error_retype_password = false;

       check_fname();
       check_sname();
       check_email();
       check_deg();
       check_rm();
       check_password();
       check_retype_password();

       if (error_fname === false && error_sname === false && error_email === false &&  error_deg===false &&  error_rm===false && error_password === false && error_retype_password === false) {
          
          return true;
       } else {
         swal("Sorry!", "Please Fill The Form Correctly", "error");
          return false;
       }


    });
 });

</script>


<script type="text/javascript">
//eye
var state= false;
	function toggle()
	{
	  if(state)
	    {
		document.getElementById("form_password").setAttribute("type","password");
		document.getElementById("eye").style.color='#7a797e';
		state = false;
	     }
	     else{
		document.getElementById("form_password").setAttribute("type","text");
		document.getElementById("eye").style.color='#5887ef';
		state = true;
	     }
	}
	
	var state= false;
	function toggle1(){
	    if(state)
	    
	    {
		document.getElementById("form_retype_password").setAttribute("type","password");
		document.getElementById("eye1").style.color='#7a797e';
		state = false;
	     }
	     else{
		document.getElementById("form_retype_password").setAttribute("type","text");
		document.getElementById("eye1").style.color='#5887ef';
		state = true;
	     }
	}
//confirmpassword
function show()
{
   document.getElementById('eye1').style="display:block";
    document.getElementById('retype_password_error_message').style="display:block";
   document.getElementById('form_retype_password').style="display:block";
   document.getElementById('form_retype_text').style="display:block";
    
}

function checklist(){
 
var myInput=document.getElementById("form_password");
var letter=document.getElementById("letter");
var capital=document.getElementById("capital");
var number=document.getElementById("number");
var special1=document.getElementById("special");
var length=document.getElementById("length");
myInput.onfocus=function()
{
   document.getElementById("message").style.display="block";
  }
myInput.onblur=function()
{
   document.getElementById("message").style.display="none";
  }
myInput.onkeyup=function()
{
    var lowercase=/[a-z]/g;
    if(myInput.value.match(lowercase))
        {
        letter.classList.remove("invalid");
        letter.classList.add("valid");
    }
    else
        {
        letter.classList.remove("valid");
        letter.classList.add("invalid");
        }
    var uppercase=/[A-Z]/g;
    if(myInput.value.match(uppercase))
        {
        capital.classList.remove("invalid");
        capital.classList.add("valid");
    }
    else
        {
        capital.classList.remove("valid");
        capital.classList.add("invalid");
        }
    var numbers=/[0-9]/g;
    if(myInput.value.match(numbers))
        {
        number.classList.remove("invalid");
        number.classList.add("valid");
    }
    else
        {
        number.classList.remove("valid");
        number.classList.add("invalid");
        }
     var special=/(?=.*[ -\/:-@\[-\`{-~]{1,})/g;
    if(myInput.value.match(special))
        {
        special1.classList.remove("invalid");
        special1.classList.add("valid");
    }
    else
        {
        special1.classList.remove("valid");
        special1.classList.add("invalid");
        }

 

    if(myInput.value.length>=8)
    {
        length.classList.remove("invalid");
        length.classList.add("valid");
}
else
    {
    length.classList.remove("valid");
    length.classList.add("invalid");
    }
    
}

}


</script>
</body>
</html>