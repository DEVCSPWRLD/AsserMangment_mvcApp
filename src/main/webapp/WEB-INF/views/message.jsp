<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

<title>Notice</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="js/Login.js"></script>
</head>
<body>

<ul class="topnav">
	 
	   <li class="right" class="form-popup"><a href="login">Login</a></li>
	 <!--   <li class="left"><a href="/home">Home</a></li>  -->
	    
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
							<div class="container-fluid"> 
		<div class="text-center">
			<h2>${title}</h2>
			<h4>${message}</h2>
			
		</div>
							
							

								<!-- <h5 class="text-grey text-center mt-0 font-weight-bold">Forget Password</h5>
								<form action="/forgot_password" method="POST" id="forget" novalidate>
									<div class="form-group p-1">


<div class="border border-secondary rounded p-3">
  
--------------------------------------------------EMAIL----------------------------------------------------------------


										<label class="control-label required"> Email </label> <input type="text" name="email" maxlength="30" placeholder="Enter your Email" id="" class="form-control">
										<div id="validEmailId" class="text-danger" font-weight-bold></div>


------------------------------------------------PASSWORD--------------------------------------------------------------------
										<label class="control-label required"> Password </label> <input type="password" name="password"  placeholder="Enter your password" id="pass"
											class="form-control"><i class="fa fa-eye"
											aria-hidden="true" id="eye" onclick="toggle()"></i> </br>
										<div id="validPassword" class="text-danger" font-weight-bold>&nbsp</div>

									</div>
								<br>
									
------------------------------------------------SUBMIT--------------------------------------------------------------------									
									<div class="row">
										<button value="submit" id="submit"
											class="btn btn-primary mx-auto"
											;return false">
											<span class="btn-text">SEND</span> <span class="btn-text"></span>
											<div class="row">
											
											</div>
------------------------------------------------FORGET PASSWORD--------------------------------------------------------------------									
												</row> 		
												
												
											
											
								</form> -->
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

	
	
</body>
</html>