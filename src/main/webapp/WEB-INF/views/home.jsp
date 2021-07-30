<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HOME</title>
<link rel="stylesheet" href="/css/topnav.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>    

 

<style type="text/css">
#main-img {
  
  height: 635px;
  width:100%
} 

 

@media screen and (max-width: 767px) {   
    #main-img{
        background-image: url(/images/centroxy.png);
    } 
}

 

@media screen and (min-width: 768px) {      
    #main-img{      
        background-image: url(/images/centroxy.png);
    } 
} 
@media (min-width: 992px) {      
      #main-img{        
          background-image: url(/images/centroxy.png);
      } 
}
@media (min-width: 1200px) {    
     #main-img{         
         background-image: url(/images/centroxy.png);
     } 
}
</style>  
</head>

<body>

<ul class="topnav">
 
  <li class="right" class="form-popup"><a href="/login">SignIn</a></li>
  <li class="right"><a href="/register">SignUp</a></li>  
</ul>

<img src="/images/centroxy.png" class = "img-responsive" id="main-img">

</body>
</html> --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HOME</title>
<link rel="stylesheet" href="css/topnav.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>    

 

 

 

<style type="text/css">

 

#login-form {
    margin:3% auto;
    max-width:500px;
}

 

          
      #submit{width:20%;
      margin:0 auto;
                  padding: 3px;
                  text-align:center;
                   font-size: 2em;
                    border: 1px solid transparent;
                  text-decoration:none;
                  
      }
      
      .btn-lgn {
    text-align: center;
    
}
  .image{margin-left:20%}
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

 

 

 

<title>Login</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="/js/Login.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="js/login1.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

 

 

</style>

 

</head>

 


<body>
<ul class="topnav">

 

  <h1 class="center" style="text-align:center;color:white;padding:10px;">Asset Management Tool</h1>
</ul> 

 

<div class="container">
<div id="login-form">
<img class="image" src="images/centroxy2.jpg" >

 

<form>
<div class="col-md-12">
    <div class="form-group">

<h3 class="text-center" style="text-align: center;font-size: 30px;" >First time visitors Register here</h3>
<div class="btn-lgn">
<button value="submit" id="submit" class="btn btn-primary mx-auto"  onclick="main()">
<a href="register" style="color:white; text-decoration: none;" >Register</a>
</button>

</div>
</div>
<!-- <div class="form-group"><hr>
<h3 class="text-center" style="text-align: center;font-size: 30px;">Returning visitors Log In here</h3> -->

<h3 class="text-center" style="text-align: center;font-size: 30px;" >Returning visitors Log In here</h3><br>
<div class="btn-lgn">
<button value="submit" id="submit" class="btn btn-primary mx-auto" onclick="main()">
<a href="login" style="color:white;text-decoration:none;">LogIn</a>
</button>

<div class="row">
</div>
</div>
</div>
</form>
</div>
</div>
</body>
</html>