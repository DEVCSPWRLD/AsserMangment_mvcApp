<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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


<!-- 	/////////////////////////////////////////////////////////////////////////////// -->



<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>Login</title>
<!-- <link rel="stylesheet" href="/css/style.css"> -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="js/Login.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="js/asset.js"></script>
<style>
.card-header {
	background-color: #4E7E6B;
	border-radius: 0px !important;
	margin: 0;
	top-padding: 20px;
}

.card {
	border-radius: 0px !important;
	min-width: 400px;
	min-height: 300px;
}

.btn-primary {
	color: #fff;
	background-color: #4E7E6B;
	border-color: #2e6da4;
}
</style>
</head>
<body >
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

						<div class="row">
							<div class="card-body" style="width: 55vw;">
								<h5 class="text-grey text-center mt-0 font-weight-bold">Asset
									Form</h5>
								<form:form class="form-horizontal" action="/updateassetbyuser"
									modelAttribute="reportval" cssClass="float-label" id="trxForm"
									name="myform" method="POST" onsubmit="return  Validate()">
									<div class="form-group p-1">


										<div class="container" style="width: inherit;">
											<ul class="nav nav-tabs">
												<li class="active"><a data-toggle="tab" href="#home">Asset
														Request</a></li>
												<li><a data-toggle="tab" href="#menu1">Remarks</a></li>
											</ul>


											<!-------------------------------Asset Id----------------------------------------------------------->
											<div class="tab-content">
												<div id="home" class="tab-pane fade in active">
													<input type="text" value="${assetid}"
														name="asset_id "> 
														
														
											<!-------------------------------Asset Req No.----------------------------------------------------------->
													<label class="control-label required"> Asset Req
														No. </label> <input style="color: black" type="text"value="${uniqueid}"
														name="unique_id" readonly="readonly" maxlength="30"
														id="unique_id" class="form-control">
														
													<!---------------------------------------NAME---------------------------------------------  -->
													<label class="control-label required"> Name </label> <input
														style="color: black" type="text" name="name"
														value="${name}" readonly="readonly" maxlength="30"
														id="name" class="form-control">
													<div id="validName" class="text-danger" font-weight-bold></div>


													<!-------------------------- EMPLOYEE ID------------------------------------ -->
													<label class="control-label required"> Employee ID</label>
													<input style="color: black" type="text" name="eid"
														value="${employeeid}" readonly="readonly" id="eid"
														class="form-control">
													<div id="validEmployee ID" class="text-danger"
														font-weight-bold></div>



													<!-------------------------- EMAIL------------------------------------ -->
													<label class="control-label required"> Email ID </label> <input
														style="color: black" type="text" name="email"
														value="${email}" readonly="readonly" id="email"
														class="form-control">
													<div id="validEmail ID" class="text-danger"
														font-weight-bold></div>


													<!-----------------------------------------------------CATEGORY---------------------------------------------  -->
													<!-- <label class="control-label required"> Category </label> <select
														style="color: black" id="category" name="category"
														class="form-control">
														<option value="">Select</option>
														<option value="Hardware">Hardware</option>
														<option value="Software">Software</option>
													</select>
													<div id="validCat" class="text-danger" font-weight-bold></div> -->

										<label class="control-label required"> Category </label>
										<select id="category" name="category" class="form-control">
										<option value="${category}" >${category}</option>
										<option value="hardware">Hardware</option>
										<option value="software">Software</option>
										</select>


													<!---------------------------Asset type------------------------------ -->
													<p>
														<b>Asset Request</b>
													</p>
													<div>
														<c:forEach var="assetslist" items="${assetslist}">
														<input type="checkbox" class="gender" id="assetslist" value="${assetslist}"
																name="asset_request" style="width: 100px;" /><%-- <c:if test="${fn:containsIgnoreCase(selctedotherincall, assetslist) }">selected</c:if>>${assetslist} --%>${assetslist}<br>													
														</c:forEach>
														
													</div>
													<span id="textspan" style="color:red"></span>

												</div>


												<!-------------------------------Remarks TAB---------------------------------------------------------  -->
												<div id="menu1" class="tab-pane fade">


													<!---------------------------Remarks------------------------------ -->
													<label class="control-label required"> Remarks </label>
													<textarea style="color: black" id="remarks" name="remarks" value=""
													 class="form-control">${remarks}</textarea>
													<div id="validRemarks" class="text-danger" font-weight-bold></div>
												</div>


												<!-- ------------------------------------------------SUBMIT--------------------------------------------------------------------				 -->
												<div class="row">
													<button value="submit" id="submit"
														class="btn btn-primary mx-auto"
														;onclick="Validate(); returnfalse">
														<span class="btn-text">Update</span>
														<div class="row"></div>
													</button>
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
	<!-- <script type="text/javascript">
	
    function load(){
           if (${selctedotherincall})
           {
               $( "#assetslist").prop('selected', true).val();
              
           }
           else
           {
               $( "#assetslist").prop('selected', false).val();
              
           }
         }
   </script> -->

<script>
     $(document).ready(function(){
            $(".gender").click(function(){
            $("#textspan").html('');
        });
        });

 

             function Validate(theform) {
                var bool = true;

 

                    var checkedCount = $('input[class="gender"]:checked').length;
                    if (checkedCount == 0) {
                        $("#textspan").html('Select Your Assets');
                        bool = false;
                    }
                    if(checkedCount >= 1) 
                    {
                        $("#textspan").html('');
                        bool = true;
                    }
                    return bool;                                   
            }    
</script>
<script type="text/javascript">
$(function() {
    $("#validCat").hide();
    $("#validRemarks").hide();
    var error_fname = false;
    var error_remarks = false;
    $("#category").focusout(function(){
       check_fname();
    });
    $("#remarks").focusout(function(){
        check_remark();
     });
 function check_fname() {  
       var fname = $("#category").val();
       if (fname !== '') {
          $("#validCat").hide();
         
       } else 
         {
            if(fname === '')
             {
                 $("#validCat").html("**Enter Category**");
                 $("#validCat").show();
                
                 error_fname = true;
              }
          else
          {
               
                     $("#validCat").show();
                    $("#category").css("border","3px solid #F90A0A");
                     error_fname = true;
            }
          
       }
    }
    function check_remark() {
        
        var remark = $("#remarks").val();
             if(remark === '')
              {
                  $("#validRemarks").html("**Enter Remarks**");
                  $("#validRemarks").show();
                
                  error_remarks = true;
               }
           else
           {      if(remark !== '')
                
                      $("#validRemarks").hide();
                                      
             }      
     }
    $("#trxForm").submit(function() {
       error_fname = false;
       error_remarks = false;     
       check_fname();
       check_remark();   
       if (error_fname === false && error_remarks == false) {      
          return true;
       } else {
         swal("Sorry!", "Please Fill The Form Correctly", "error");
          return false;
       }

    });
 });
 </script>
	
</body>
</html>