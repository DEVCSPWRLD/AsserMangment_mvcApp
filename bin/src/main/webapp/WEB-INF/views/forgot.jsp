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

<title>Forget Password</title>
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="/js/Login.js"></script>
</head>
<body>

<ul class="topnav">
	 
	  
	   <li class="left"><a href="/home">Home</a></li> 
	    
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

								<h5 class="text-grey text-center mt-0 font-weight-bold">Forget Password</h5>
								<form action="/forgot_password" method="POST" id="forget" novalidate>
									<div class="form-group p-1">


<div class="border border-secondary rounded p-3">
    <div>
        <p>We will be sending a reset password link to your email.</p>
    </div>

<!-- --------------------------------------------------EMAIL---------------------------------------------------------------- -->


										<label class="control-label required"> Email </label> <input type="text" name="email" maxlength="30" placeholder="Enter your Email" id="" class="form-control">
										<div id="validEmailId" class="text-danger" font-weight-bold></div>

                                         <div if="{error != null}">
    <p class="text-danger">${error}</p>
</div>
<div if="{message != null}">
    <p class="text-warning">${message}</p>
</div>
      
<!-- ------------------------------------------------PASSWORD-------------------------------------------------------------------- -->
										<!-- <label class="control-label required"> Password </label> <input type="password" name="password"  placeholder="Enter your password" id="pass"
											class="form-control"><i class="fa fa-eye"
											aria-hidden="true" id="eye" onclick="toggle()"></i> </br>
										<div id="validPassword" class="text-danger" font-weight-bold>&nbsp</div>

									</div> -->
								<br>
									
<!-- ------------------------------------------------SUBMIT-------------------------------------------------------------------- -->									
									<div class="row">
										<button value="submit" id="submit"
											class="btn btn-primary mx-auto"
											;return false">
											<span class="btn-text">SEND</span> <span class="btn-text"></span>
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

	
	
</body>
</html>



<%-- 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<div>
    <h2>Forgot Password</h2>
</div>
<div if="{error != null}">
    <p class="text-danger">${error}</p>
</div>
<div if="{message != null}">
    <p class="text-warning">${message}</p>
</div>
       
         
<form action="/forgot_password" method="post" style="max-width: 420px; margin: 0 auto;">
<div class="border border-secondary rounded p-3">
    <div>
        <p>We will be sending a reset password link to your email.</p>
    </div>
    <div>
        <p>
            <input type="email" name="email" class="form-control" placeholder="Enter your e-mail" required autofocus/>
        </p>         
        <p class="text-center">
            <input type="submit" value="Send" class="btn btn-primary" />
        </p>
    </div>
</div>
</form>
</body>
 --%>