 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
  <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
  <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/topnav.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
	
	
<!-- 	/////////////////////////////////////////////////////////////////////////////// -->
	
	
	
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>Login</title>
<!-- <link rel="stylesheet" href="../css/style.css"> -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="../js/Login.js"></script>

<style>

.popover{width:100%;
background-color: #4E7E6B;
color: white;
}
.card-header {
background-color:#4E7E6B;
border-radius: 0px !important;
margin: 0;
top-padding:20px;
}
.card {
border-radius: 0px !important;
min-width: 400px;
min-height: 300px;
}
.btn-primary {
    color: #fff;
    background-color:#4E7E6B ;
    border-color: #2e6da4;
}

</style>
</head>
<body onLoad="load()">
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
						
							<div class="card-body" style="width:55vw;">

								<h5 class="text-grey text-center mt-0 font-weight-bold">Asset Track
									</h5>
								<form:form class="form-horizontal" action="/user/openinfo" cssClass="float-label"  id="trxForm" name="myform" method = "POST">
									<div class="form-group p-1">
									
	
 
 
  <div class="container" style="width:inherit;" >
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">Asset Request</a></li>
     <li><a data-toggle="tab" href="#menu1">Remarks</a></li>
    <!-- <li><a data-toggle="tab" href="#menu2">purchase Information</a></li>
    <li><a data-toggle="tab" href="#menu3">Quality Value</a></li>
     <li><a data-toggle="tab" href="#menu4">location</a></li> -->
    
  </ul>
  <!-------------------------------EMPLOYEE REQUEST TAB---------------------------------------------------------  -->
  
										

 												 <div class="tab-content">
												<div id="home" class="tab-pane fade in active">
													<input type="hidden" value="${asset_inventory.assetid}"
														name="asset_id ">
														
														<label class="control-label required">Asset Req No.</label> <input style="color: black"
														type="text" name="Asset Req No." readonly="readonly" value="${uniqueid}" maxlength="30"
														placeholder="Enter your Name" id="Asset Req No."
														class="form-control">
													<div id="validName" class="text-danger" font-weight-bold></div>
													<!---------------------------------------NAME---------------------------------------------  -->
													<label class="control-label required"> Name </label> <input style="color: black"
														type="text" name="name" readonly="readonly" value="${fullname}" maxlength="30"
														placeholder="Enter your Name" id="name"
														class="form-control">
													<div id="validName" class="text-danger" font-weight-bold></div>



													<!-------------------------- EMPLOYEE ID------------------------------------ -->
													<label class="control-label required"> Employee ID
													</label> <input style="color: black" type="text" name="eid" value="${eid}"readonly="readonly"
														placeholder="Enter your Employee ID" id="eid"
														class="form-control">

													<div id="validEmployee ID" class="text-danger"
														font-weight-bold></div>





													<!-----------------------------------------------------CATEGORY---------------------------------------------  -->

													<label class="control-label required"> Category </label> <input style="color: black"
														type="text" name="category" maxlength="30" value="${category}"
														placeholder="Enter your Category " readonly="readonly"
														id="category" class="form-control">






													<!---------------------------Asset Type------------------------------ -->
													<label class="control-label required"> Asset Type </label>
													<input style="color: black" type="text" name="assetrequest" readonly="readonly"
													value="${assetrequest}"
														placeholder="Enter your Asset Request" id="assetrequest"
														class="form-control">

													<div id="validEmail ID" class="text-danger"
														font-weight-bold></div>
												</div>




												<!-------------------------------Remarks TAB---------------------------------------------------------  -->

												<div id="menu1" class="tab-pane fade">

													<!---------------------------Remarks------------------------------ -->
													<label class="control-label required"> Remarks </label>
													<textarea style="color: black" id="menu1" name="remarks" maxlength="30"
														placeholder="Enter the Remark" id="name" readonly="readonly"
														 class="form-control"><c:forEach var="splt" items="${fn:split(remarks,',')}"> -${splt} 
</c:forEach></textarea>
													<div id="validName" class="text-danger" font-weight-bold></div>
													
													
												</div>
												
												<button value="submit" id="submit" class="btn btn-primary mx-auto">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../user/openinfo">Close</a></span>
<div class="row"></div></button>  
												
									
												 
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

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/animejs/3.2.1/anime.min.js"
		type="text/javascript"></script>

	
</body>
</html> 
