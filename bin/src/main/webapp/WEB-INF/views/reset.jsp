<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/css/topnav.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<title>Reset Password</title>
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="/js/Register.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="/js/reset.js"></script>
<script type="text/javascript" src="/js/reset1.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<style>
.fa
{
	position:absolute;
	right:22px;
	left:340px;
	transform:translate(0,-50%);
	cursor:pointer;
	font-size:20px;
	color:#7a797e;
	margin-top:-20px;
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
<ul class="topnav">
	 
	  
	   <li class="left"><a href="/home">Home</a></li> 
	    
	</ul>
<div class="space"></div>



<div if="{error != null}">
    <p class="text-danger">${error}</p>
</div>
<div if="{message != null}">
    <p class="text-warning">${message}</p>
</div>
      

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

								<h5 class="text-grey text-center mt-0 font-weight-bold">Forget Password</h5>
								
								<form action="/reset_password" method="POST" id="registration_form" novalidate>
								 	<input type="hidden" name="token" value="${token}" />
									<div class="form-group p-1">


<div class="border border-secondary rounded p-3">
   

<!-- --------------------------------------------------EMAIL---------------------------------------------------------------- -->

<!-- 
										<label class="control-label required"> Email </label> <input type="text" name="" maxlength="30" placeholder="Enter your Email" id="" class="form-control">
										<div id="validEmailId" class="text-danger" font-weight-bold></div>

 -->
<!-- ------------------------------------------------PASSWORD-------------------------------------------------------------------- -->
										<!-- <label class="control-label required"></label>  -->
										<div>
										<input type="text" name="password"  placeholder="Enter your new password" id="form_password"  onfocus="checklist()"
											class="form-control"><i class="fa fa-eye" aria-hidden="true" id="eye" onclick="toggle()" ></i>
										<div id="password_error_message" class="text-danger" font-weight-bold></div>
										</div>
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
										</br>
										<div>
										<input type="text" name="password"  placeholder="Confirm your new password" oninput="cheakPasswordMatch(this);"
											class="form-control" id="form_retype_password"><i class="fa fa-eye" aria-hidden="true" id="eye1" onclick="toggle1()" ></i>
										<div id="retype_password_error_message" class="text-danger" font-weight-bold></div>
										</div>
										
							
									</div>
								<br>
									
<!-- ------------------------------------------------SUBMIT-------------------------------------------------------------------- -->									
									<div class="row">
										<button value="submit" id="submit"
											class="btn btn-primary mx-auto">
											<span class="btn-text">Change Password</span> <span class="btn-text"></span>
											<div class="row">
											
											</div>
<!-- ------------------------------------------------FORGET PASSWORD-------------------------------------------------------------------- -->									
												</row> 		
												
												
											
											
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/animejs/3.2.1/anime.min.js"
		type="text/javascript">
	function checkPasswordMatch(fieldConfirmPassword) {
	    if (fieldConfirmPassword.value != $("#password").val()) {
	        fieldConfirmPassword.setCustomValidity("Passwords do not match!");
	    } else {
	        fieldConfirmPassword.setCustomValidity("");
	    }
	}
	</script>
	
</body>
</html>



<%-- 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div>
    <h2>Reset Your Password</h2>
</div>
         
<form action="/reset_password" method="post" style="max-width: 350px; margin: 0 auto;">
    <input type="hidden" name="token" value="${token}" />
<div class="border border-secondary rounded p-3">
    <div>
        <p>
            <input type="text" name="password" id="password" class="form-control"
              required autofocus placeholder="Enter your new password"  />
        </p>         
        <p>
            <input type="text" name="confirmpassword" class="form-control" 
            placeholder="Confirm your new password"
                required oninput="checkPasswordMatch(this);" />
        </p>         
        <p class="text-center">
            <input type="submit" value="Change Password" class="btn btn-primary" />
        </p>
    </div>
</div>
</form>
<script type="text/javascript">
function cheakPasswordMatch(fieldConfirmPassword){
	if(fieldConfirmPassword.value ! = $("#password").val()){
		fieldConfirmPassword.setCustomValidity("Password do not match!");
		}else{
			fieldConfirmPassword.setCustomValidity("");
			}
}
</script>

</body>
</html> --%>