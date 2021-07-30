<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<style>
.done {
    margin-right: 0px !important;
}

button[type="button"]
{
    width:120px;
    height:60px;
    margin-left:35px;
    display:block;
    background-color:gray;
    color:white;
    border: none;
    outline:none;
    float:right;
}
.dashboard{
padding: 18px 16px;
}
.popover{width:100%;
background-color: #4E7E6B;
}

#btn{
background-color: transparent;
}
/*  a:link {
  
  background-color:#4E7E6B;
  text-decoration: none;
}  */

html, body {
height: 100%;
font-family: 'Nunito', sans-serif;
margin: 0px;
} 

ul.topnav {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #4E7E6B;
}

 

ul.topnav li {float: left;}

 

ul.topnav li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 20px;
   
}

 
/* ul.topnav li a:hover:not(.active) {background-color: #111; } */

 

ul.topnav li a.active {background-color: red;}

 

ul.topnav li.right {float: right;}
ul topnav li.right {background-color:green}

 //leftmenu
 body {margin: 0;
font-family: "Lato", sans-serif;}
.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #4E7E6B;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 20px;
  color: white;
  display: column;
  transition: 0.3s;
}
.fa{
margin-left:2rem

}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}


.fa-registered
{
color: white;
}
.fa-thumb-tack
{
	color: white;
}
.fa-flag-checkered
{
	color: white;
}
.fa-key
{
	color: white;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
.img__wrap:hover .img__description {
  visibility: visible;
  opacity: 1;
}
.img__description
{
color: white;
visibility: hidden;

}

</style> 
</head>

<body>

    <ul class="topnav">
        <li class="left">
        <img src="../images/centroxyLogo.png" class ="img-responsive" id="img" style="height: 50px; margin-left: 2px; margin-top: 2px">
        
            <div class="center"
                style="font-size: 30px; color: white; cursor: pointer; width: 40px; margin-top: 10px; margin-left: 40px;"
                onclick="openNav()">&#9776;</div>
        </li>

 
        <c:if test="${role !='USER'}">
            <li><a class="dashboard" href="../admin/dashboard">DashBoard</a></li>
        </c:if>

 
        <c:if test="${role =='USER'}">
            <li><a class="dashboard" href="../user/openinfo">DashBoard</a></li>
        </c:if>
   <%--  <div class="right">
    <button type="button"
  data-toggle="popover" 
  data-html="true"
  data-placement="bottom" style="background-color:transparent;"
   data-content=" <br> <li class="right1" style="color:white;"> ${empid}</li><br><br><a  href='/logout'>Logout</a>">
   
            <li class="right" style=" margin-right: 10px; padding-top: 5px;" >${name} </li></button>
             --%>
            
            <li class="right" style="margin-top: 17px; margin-right: 20px; font-size:15px;">
				
				
				 
					      <button type="button" style=" outline:none;"  id="btn" class="" data-toggle="popover"  data-html="true" data-placement="bottom" data-content="
<a ><c:out value=" ${empid}"/></a><a href='../logout' ><c:out value="Logout"/></a>"/>${name}</button>
				
                </li>
            
            
            
           <li class="right" style="margin-top: 17px;">
				
				
				<c:if test="${role =='ADMIN'}">
				<div class="img__wrap">
                          <button type="button" style=" outline:none;" id="btn" class="fa fa-bell" data-toggle="popover" 0 name="notification" data-html="true" data-placement="bottom"  data-content="<c:forEach items="${assetId}" var="report" varStatus="status">
<a href='../admin/editasset?id=${report.asset_id}&bid=btn'><c:out value="${report.getEid()}"/></a></c:forEach>"/><span class="badge badge-light">${num}</span>
<div id="btn3"></div>
</button>

		<c:if test="${num ==0}">
 <p class="img__description" ></p>
 </c:if>

 <c:if test="${num >0}">
 <p class="img__description" >New Asset Request  </p>
 </c:if>
</div>
                </c:if>
                <c:if test="${role =='HR'}">
                <div class="img__wrap">
                          <button type="button" style=" outline:none;" id="btn" class="fa fa-bell" data-toggle="popover" 0 name="notification" data-html="true" data-placement="bottom"  data-content="<c:forEach items="${pendingforhr}" var="report" varStatus="status">
<a href='../admin/editasset?id=${report.asset_id}&bid=btn1'><c:out value="${report.getEid()}"/></a></c:forEach>"/><span class="badge badge-light">${num1}</span>
<div id="btn3"></div>
</button>

 

        <c:if test="${num1 ==0}">
 <p class="img__description" ></p>
 </c:if>

 

 <c:if test="${num1 >0}">
 <p class="img__description" >New Asset Request  </p>
 </c:if>
</div>
                </c:if>
                </li>
      
                             
                         <script>
                        $(document).ready(function() {
                            $('[data-toggle="popover"]').popover();
                        });

                        $(document).ready(function() {
                            $('[data-trigger="dismiss"]').dismiss();
                        });
                        if (!localStorage.getItem("reload")) {
                            /* set reload to true and then reload the page */
                            localStorage.setItem("reload", "true");
                            location.reload();
                        }
                        /* after reloading remove "reload" from localStorage */
                        else {
                            localStorage.removeItem("reload");
                            // localStorage.clear(); // or clear it, instead
                        }
                    </script>

        <div style="color: red"></div>
        <h1 class="center" style="text-align: center; color: white">Asset Management Tool</h1>
        <h1 class="center" style="text-align: center; color: white"><% session.getAttribute("report"); %></h1>
    </ul>
</body>
</html>

 

 
