<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<script type="text/javascript" src="js/editasset.js"></script>
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
	background-color: #4E7E6B;
}

table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}
</style>
</head>
<body onLoad="load()">
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
									Form Edit</h5>

								<form:form class="form-horizontal" action="/updateasset"
									modelAttribute="assetval" cssClass="float-label" id="trxForm"
									name="myform" method="POST" >
									<div class="form-group p-1">

										<div class="container" style="width: inherit;">
											<h4 style="text-align: right;" >
												Status:<b>${report.status}</b>
											</h4>
											<ul class="nav nav-tabs">
												<li class="active"><a data-toggle="tab" href="#home">Asset
														Request</a></li>
														<c:if test="${report.status=='Approved'}">
												<li><a data-toggle="tab" href="#menu1">Asset
														Details</a></li>
														
												<li><a data-toggle="tab" href="#menu2">Purchase
														Information</a></li>
												<li><a data-toggle="tab" href="#menu3">Location</a></li>
												</c:if>
												<li><a data-toggle="tab" href="#menu4">Remarks</a></li>

											</ul>
											<!---------------------------------------NAME---------------------------------------------  -->
											<div class="tab-content">
												<div id="home" class="tab-pane fade in active">
													<input type="hidden" value="${report.asset_id}"
														name="asset_id"> 
															<input type="hidden" value="${report.status}"
														name="status_id" id="statuid"> 
														<label
														class="control-label required"> Name </label> <input
														style="color: black" type="text" name="name"
														value="${report.name}" readonly="readonly"
														placeholder="Enter your Name" id="name"
														class="form-control">
													<div id="validName" class="text-danger" font-weight-bold></div>
													
													<label class="control-label required">
													</label> <input style="color: black" type="hidden"
														value="${report.email}" name="email" readonly="readonly"
														placeholder="enter email" id="emp_id"
														class="form-control">

													<div id="validEmployee ID" class="text-danger"
														font-weight-bold></div>

													<!-------------------------- EMPLOYEE ID------------------------------------ -->
													<label class="control-label required"> Employee ID
													</label> <input style="color: black" type="text"
														value="${report.eid}" name="eid" readonly="readonly"
														placeholder="Enter your Employee ID" id="emp_id"
														class="form-control">

													<div id="validEmployee ID" class="text-danger"
														font-weight-bold></div>

													<!-----------------------------------------------------CATEGORY---------------------------------------------  -->

													<label class="control-label required"> Category </label> <input
														style="color: black" readonly="readonly" type="text" name="category"
														maxlength="30" value="${report.category}"
														placeholder="Enter your Category " id="category"
														class="form-control">



													<!---------------------------Asset type------------------------------ -->
													<label class="control-label required"> Asset
														Request </label> <input style="color: red" readonly="readonly"
														type="text" value="${report.asset_request}"
														name="asset_request" readonly="readonly" id="emp_id"
														class="form-control">
													<p>
														<!-- <b>Asset Request</b> -->
													</p>
													<select style='display: none' class="form-control"
														id="assetstype" name="asset_request" multiple="true"
														disabled>
														<c:forEach items="${assetslist}" var="otherper">
															<option value="${otherper.assetstype}"
																<c:if test="${fn:containsIgnoreCase(selctedotherincall, otherper.assetstype) }">SELECTED</c:if>>${otherper.assetstype}</options>
														</c:forEach>
													</select>
												</div>
												
												
												<div id="menu1" class="tab-pane fade">
													<!--------------------------------------------MODEL NO-----------------------------------------------------------------------------  -->
													<table>

														<tr>

															<th >Asset Request</th>
															<th>Model No</th>
															<th>Serial No</th>
															<th>Condition</th>
															<th>Description</th>
														</tr>

														<c:forEach var="splt" items="${selctedotherincall}">
													
															<tr>
																	
																<td><input style="color: green" disabled
																	name="asset_request" style="width: 100px;"
																	value="${splt}" /></td>
																<td><input  name="model_no" style="width: 100px;" id=14_${splt}><div id=15_${splt} style="color:red"></div></td>
																<td><input name="serial_no" style="width: 100px;" id=16_${splt}><div id=17_${splt} style="color:red"></div></td>
																<td><input name="condition1" style="width: 100px;" id=18_${splt}><div id=19_${splt} style="color:red"></div></td>
																<td><input name="descriptions" style="width: 100px;" id=20_${splt}><div id=21_${splt} style="color:red"></div></td>
															</tr>
														</c:forEach>



													</table>
												</div>

												<!-------------------------------------------------------PURCHASE INFORMATION-----------------------------------------  -->
												<div id="menu2" class="tab-pane fade">
													<!-------------------------------------------------------DATE---------------------------------------------------------- -->
													<table>
														<tr>

															<th style="width: 80px;">Asset Request</th>
															<th style="width: 50px;">Date</th>
															<th style="width: 80px;">Supplier</th>
															<th style="width: 50px;">Warranty Expiration</th>
															<th style="width: 80px;">Unit price</th>
															<th style="width: 80px;">Quantity</th>
															<th style="width: 80px;">Value</th>
														
														</tr>
                                                          
														<c:forEach var="splt" items="${selctedotherincall}" >

															<tr>
                                                                     
																<td><input disabled name="asset_request"  id=2_${splt} style="width: 80px; color: green"  value="${splt}" /></td>
																<td><input name="date" type="date" id=11_${splt} style="width: 126px;">
																	<div id=12_${splt}  style="color:red"></div></td>
																<td><input name="supplier" id=3_${splt} style="width: 60px;"><div id=10_${splt} style="color:red"></div></td>
																<td><input name="warranty_expiration" type="date"  id=4_${splt}
																	style="width: 126px;"><div id=13_${splt} style="color:red"></div></td>
																<td><input name="unit_price" class="iput" id=5_${splt}
																	style="width: 60px;"><div id=8_${splt} style="color:red"></div></td>
																<td><input name="quantity" class="iput" id=6_${splt} 
																	oninput="calculate();" style="width: 60px;"><div id=9_${splt}  style="color:red"></td>
																<td><input readonly="readonly" name="value" id=7_${splt}
																	style="width: 60px;"></td>
															</tr>
														</c:forEach>

													</table>
												</div>


												<!-------------------------------------------------------LOCATION--------------------------------------------------------->

												<div id="menu3" class="tab-pane fade">
													<!-------------------------------------------------------DEPTH/AREA----------------------------------------------------------  -->

													<label class="control-label required"> Dept/Area </label> <input
														style="color: black" type="text" name="dept"
														maxlength="30" placeholder="Enter your Dept" id="dept"
														value="${report.dept}" class="form-control">
													<div id="validDept" class="text-danger" font-weight-bold></div>

													<!-----------------------------------------------DESK--------------------------------  -->

													<label class="control-label required"> Desk </label> <input
														style="color: black" type="text" name="desk"
														value="${report.desk}" placeholder="Enter your Desk"
														id="desk" class="form-control">

													<div id="validDesk" class="text-danger" font-weight-bold></div>


												</div>

												<!------------------------------------Remarks TAB---------------------------------------------------------  -->

												<div id="menu4" class="tab-pane fade">

													<!---------------------------Remarks------------------------------ -->
													<label class="control-label required"> Remarks </label>
													<textarea id="menu1" style="color: black" name="remarks" maxlength="30"
														placeholder="Enter the Remark" id="remarks"
														class="form-control">by ${report.email} on <%=new java.sql.Date( new java.util.Date().getTime() ).toLocalDate()%></textarea>
													<div id="validRemark" class="text-danger" font-weight-bold></div>
													<label class="control-label required"> History </label>
													<textarea style="color: black" id="menu1" name="remarks" maxlength="30"
														placeholder="Enter the Remark" id="remarks"
														class="form-control"><c:forEach var="splt" items="${fn:split(report.remarks,',')}">  -${splt}
</c:forEach></textarea>
													<div id="validName" class="text-danger" font-weight-bold></div>
												</div>


											</div>

										</div>
									</div>



									<!-- ------------------------------------------------SUBMIT---------------------------------------------------------------------->
									<!-- <div class="row">
										<button value="submit" id="submit"
											class="btn btn-primary mx-auto";returnfalse">
											<span class="btn-text">submit</span>
											<div class="row"></div>
										</button>
									</div> -->


									<div class="row">
										<c:if test="${report.status=='Sent To HR'}">
											<button value="Sent To Approver" name="status" id="submit"
												class="btn btn-primary mx-auto" >
												<span class="btn-text">Sent To Approver</span>
												<div class="row"></div>
											</button>
										</c:if>

										<!-- value="sent to approver" -->
										<c:if test="${report.status=='Sent To Approver'}">
											<button value="Approved" name="status" id="submit"
												class="btn btn-primary mx-auto"  >
												<span class="btn-text">Approved</span>
												<div class="row"></div>
											</button>
										</c:if>


										<c:if test="${report.status=='Approved'}">
											<button value="Sent To Requester" name="status" id="submit"
												class="btn btn-primary mx-auto"  >
												<span class="btn-text">Sent To Requester</span>
												<div class="row"></div>
											</button>
										</c:if>
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
		function calculate() {
			
			var btn = document.getElementsByClassName('iput');
			
				
			
			for ( i = 0; i < btn.length; i++)
				{
				
				if(document.getElementById('5_Mouse')!=null)
					{
					
					var myBox1 = document.getElementById('5_Mouse').value;
					var myBox2 = document.getElementById('6_Mouse').value;
					
					var myResult = myBox1 * myBox2;
					 document.getElementById('7_Mouse').value = myResult;
					}
			
				if(document.getElementById('5_Laptop')!=null)
				{
					

						
					var myBoxval1 = document.getElementById('5_Laptop').value;
					
					var myBoxval2 = document.getElementById('6_Laptop').value;

					var myResult1 = myBoxval1 * myBoxval2;
					
					document.getElementById('7_Laptop').value = myResult1;
					}
					
				if(document.getElementById('5_Keyboard')!=null)
				{
						var myBoxval3 = document.getElementById('5_Keyboard').value;
						var myBoxval4 = document.getElementById('6_Keyboard').value;

						var myResult2 = myBoxval3 * myBoxval4;
						
						document.getElementById('7_Keyboard').value = myResult2;
				}
				if(document.getElementById('5_Wire')!=null)
				{
						var myBoxval5 = document.getElementById('5_Wire').value;
						var myBoxval6 = document.getElementById('6_Wire').value;

						var myResult3 = myBoxval5 * myBoxval6;
						
						document.getElementById('7_Wire').value = myResult3;
				}
						
						
				}
			
		}


	</script>

	<script>
$
		(function() {

			$("#validDept").hide();
			$("#validDesk").hide();
			$("#validRemark").hide();
			$("#8_Mouse").hide();
			$("#9_Mouse").hide();
			$("#8_Keyborad").hide();
			$("#9_Keyborad").hide();
			$("#8_Laptop").hide();
			$("#9_Laptop").hide();
			$("#8_Wire").hide();
			$("#9_Wire").hide();
			$("#10_Mouse").hide();
			$("#10_Keyborad").hide();
			$("#10_Laptop").hide();
			$("#10_Wire").hide();
			$("#12_Mouse").hide();
			$("#15_Mouse").hide();
			$("#17_Mouse").hide();
			$("#19_Mouse").hide();
			$("#21_Mouse").hide();
			$("#15_Keyborad").hide();
			$("#17_Keyborad").hide();
			$("#19_Keyborad").hide();
			$("#21_Keyborad").hide();
			$("#15_Laptop").hide();
			$("#17_Laptop").hide();
			$("#19_Laptop").hide();
			$("#21_Laptop").hide();
			$("#15_Wire").hide();
			$("#17_Wire").hide();
			$("#19_Wire").hide();
			$("#21_Wire").hide();
			$("#13_Mouse").hide();
			$("#13_Keyboard").hide();
			$("#13_Laptop").hide();
			$("#13_Wire").hide();
			var error_fname = false;
			var error_deptdesk = false;
			var error_remark = false;
			var error_price = false;
			var error_quantity = false;
			var error_supplier = false;
			var error_date = false;
			var error_model = false;
			var error_serial = false;
			var error_condition = false;
			var error_description = false;
			var error_warrentyexpiration = false;
			$("#dept").focusout(function() {
				check_fname();
			});
			$("#desk").focusout(function() {
				check_dept();
			});
			$("#remarks").focusout(function() {
				check_remark();
			});
			$("#5_Mouse").focusout(function() {
				check_price();
			});
			$("#6_Mouse").focusout(function() {
				check_quantity();
			});
			$("#5_Keyboard").focusout(function() {
				check_pricekey();
			});
			$("#6_Keyboard").focusout(function() {
				check_quantitykey();
			});
			$("#5_Laptop").focusout(function() {
				check_priceLap();
			});
			$("#6_Laptop").focusout(function() {
				check_quantityLap();
			});
			$("#5_Wire").focusout(function() {
				check_priceWire();
			});
			$("#6_Wire").focusout(function() {
				check_quantityWire();
			});
			$("#3_Mouse").focusout(function() {
				check_suppliermouse();
			});
			$("#3_Keyboard").focusout(function() {
				check_supplierkey();
			});
			$("#3_Laptop").focusout(function() {
				check_supplierLap();
			});
			$("#3_Wire").focusout(function() {
				check_supplierwire();
			});
			$("#11_Mouse").focusout(function() {
				check_dateMouse();
			});
			$("#11_Keyboard").focusout(function() {
				check_dateKey();
			});
			$("#11_Laptop").focusout(function() {
				check_dateLap();
			});
			$("#11_Wire").focusout(function() {
				check_dateWire();
			});
			$("#14_Mouse").focusout(function() {
				check_modelMouse();
			});
			$("#16_Mouse").focusout(function() {
				check_serialmouse();
			});
			$("#18_Mouse").focusout(function() {
				check_conditionmouse();
			});
			$("#20_Mouse").focusout(function() {
				check_descriptionmouse();
			});
			$("#14_Keyboard").focusout(function() {
				check_modelkeyboard();
			});
			$("#16_Keyboard").focusout(function() {
				check_serialkeyboard();
			});
			$("#18_Keyboard").focusout(function() {
				check_conditionkeyboard();
			});
			$("#20_Keyboard").focusout(function() {
				check_descriptionkeyboard();
			});
			$("#14_Laptop").focusout(function() {
				check_modelLaptop();
			});
			$("#16_Laptop").focusout(function() {
				check_serialLaptop();
			});
			$("#18_Laptop").focusout(function() {
				check_conditionLaptop();
			});
			$("#20_Laptop").focusout(function() {
				check_descriptionLaptop();
			});
			$("#14_Wire").focusout(function() {
				check_modelWire();
			});
			$("#16_Wire").focusout(function() {
				check_serialWire();
			});
			$("#18_Wire").focusout(function() {
				check_conditionWire();
			});
			$("#20_Wire").focusout(function() {
				check_descriptionWire();
			});
			$("#4_Mouse").focusout(function() {
				check_warrentyExpirationMouse();
			});
			$("#4_Keyboard").focusout(function() {
				check_warrentyExpirationKey();
			});
			$("#4_Laptop").focusout(function() {
				check_warrentyExpirationLap();
			});
			$("#4_Wire").focusout(function() {
				check_warrentyExpirationWire();
			});
			function check_fname() {

				var fname = $("#dept").val();
				if (fname !== '') {
					$("#validDept").hide();

				} else {
					if (fname === '') {
						$("#validDept").html("Enter Dept/Area");
						$("#validDept").show();

						error_fname = true;
					} else {
						$("#validDept").show();

						error_fname = true;
					}
				}
			}

			function check_dept() {

				var fname = $("#desk").val();
				if (fname !== '') {
					$("#validDesk").hide();

				} else {
					if (fname === '') {
						$("#validDesk").html("Enter Desk");
						$("#validDesk").show();

						error_deptdesk = true;
					} else {
						$("#validDept").show();

						error_deptdesk = true;
					}
				}
			}
			function check_remark() {

				var fname = $("#remarks").val();
				if (fname !== '') {
					$("#validRemark").hide();

				} else {
					if (fname === '') {
						$("#validRemark").html("Enter Remarks");
						$("#validRemark").show();

						error_remark = true;
					} else {

						$("#validRemark").show();

						error_remark = true;
					}

				}
			}
			function check_price() {

				var fname = $("#5_Mouse").val();
				if (fname !== '') {
					$("#8_Mouse").hide();

				} else {
					if (fname === '') {
						$("#8_Mouse").html("Enter Price");
						$("#8_Mouse").show();

						error_price = true;
					}

				}
			}

			function check_priceWire() {

				var fname = $("#5_Wire").val();
				if (fname !== '') {
					$("#8_Wire").hide();

				} else {
					if (fname === '') {
						$("#8_Wire").html("Enter Price");
						$("#8_Wire").show();

						error_price = true;
					}

				}
			}
			function check_quantity() {

				var fname = $("#6_Mouse").val();
				if (fname !== '') {
					$("#9_Mouse").hide();

				} else {
					if (fname === '') {
						$("#9_Mouse").html("Enter Quantity");
						$("#9_Mouse").show();

						error_quantity = true;
					}

				}
			}

			function check_pricekey() {

				var fname = $("#5_Keyboard").val();
				if (fname !== '') {
					$("#8_Keyboard").hide();

				} else {
					if (fname === '') {
						$("#8_Keyboard").html("Enter Price");
						$("#8_Keyboard").show();

						error_price = true;
					}

				}
			}

			function check_quantitykey() {

				var fname = $("#6_Keyboard").val();
				if (fname !== '') {
					$("#9_Keyboard").hide();

				} else {
					if (fname === '') {
						$("#9_Keyboard").html("Enter Quantity");
						$("#9_Keyboard").show();

						error_quantity = true;
					}

				}
			}
			function check_priceLap() {

				var fname = $("#5_Laptop").val();
				if (fname !== '') {
					$("#8_Laptop").hide();

				} else {
					if (fname === '') {
						$("#8_Laptop").html("Enter Price");
						$("#8_Laptop").show();

						error_price = true;
					}

				}
			}
			function check_quantityLap() {

				var fname = $("#6_Laptop").val();
				if (fname !== '') {
					$("#9_Laptop").hide();

				} else {
					if (fname === '') {
						$("#9_Laptop").html("Enter Quantity");
						$("#9_Laptop").show();

						error_quantity = true;
					}

				}
			}
			function check_quantityWire() {

				var fname = $("#6_Wire").val();
				if (fname !== '') {
					$("#9_Wire").hide();

				} else {
					if (fname === '') {
						$("#9_Wire").html("Enter Quantity");
						$("#9_Wire").show();

						error_quantity = true;
					}

				}
			}

			function check_suppliermouse() {

				var fname = $("#3_Mouse").val();
				if (fname !== '') {
					$("#10_Mouse").hide();

				} else {
					if (fname === '') {
						$("#10_Mouse").html("Enter Supplier");
						$("#10_Mouse").show();

						error_supplier = true;
					}

				}
			}
			function check_supplierkey() {

				var fname = $("#3_Keyboard").val();
				if (fname !== '') {
					$("#10_Keyboard").hide();

				} else {
					if (fname === '') {
						$("#10_Keyboard").html("Enter Supplier");
						$("#10_Keyboard").show();

						error_supplier = true;
					}

				}
			}

			function check_supplierLap() {

				var fname = $("#3_Laptop").val();
				if (fname !== '') {
					$("#10_Laptop").hide();

				} else {
					if (fname === '') {
						$("#10_Laptop").html("Enter Supplier");
						$("#10_Laptop").show();

						error_supplier = true;
					}

				}
			}
			function check_supplierwire() {

				var fname = $("#3_Wire").val();
				if (fname !== '') {
					$("#10_Wire").hide();

				} else {
					if (fname === '') {
						$("#10_Wire").html("Enter Supplier");
						$("#10_Wire").show();

						error_supplier = true;
					}

				}
			}

			function check_dateMouse() {

				var fname = $("#11_Mouse").val();
				if (fname !== '') {
					$("#12_Mouse").hide();

				} else {
					if (fname === '') {
						$("#12_Mouse").html("Enter Date");
						$("#12_Mouse").show();

						error_date = true;
					}

				}
			}

			function check_dateKey() {

				var fname = $("#11_Keyboard").val();
				if (fname !== '') {
					$("#12_Keyboard").hide();

				} else {
					if (fname === '') {
						$("#12_Keyboard").html("Enter Date");
						$("#12_Keyboard").show();

						error_date = true;
					}

				}
			}

			function check_dateLap() {

				var fname = $("#11_Laptop").val();
				if (fname !== '') {
					$("#12_Laptop").hide();

				} else {
					if (fname === '') {
						$("#12_Laptop").html("Enter Date");
						$("#12_Laptop").show();

						error_date = true;
					}

				}
			}

			function check_dateWire() {

				var fname = $("#11_Wire").val();
				if (fname !== '') {
					$("#12_Wire").hide();

				} else {
					if (fname === '') {
						$("#12_Wire").html("Enter Date");
						$("#12_Wire").show();

						error_date = true;
					}

				}
			}

			function check_modelMouse() {

				var fname = $("#14_Mouse").val();
				if (fname !== '') {
					$("#15_Mouse").hide();

				} else {
					if (fname === '') {
						$("#15_Mouse").html("Enter Model No.");
						$("#15_Mouse").show();

						error_model = true;
					}

				}
			}

			function check_serialmouse() {

				var fname = $("#16_Mouse").val();
				if (fname !== '') {
					$("#17_Mouse").hide();

				} else {
					if (fname === '') {
						$("#17_Mouse").html("Enter Serial No.");
						$("#17_Mouse").show();

						error_serial = true;
					}

				}
			}

			function check_conditionmouse() {

				var fname = $("#18_Mouse").val();
				if (fname !== '') {
					$("#19_Mouse").hide();

				} else {
					if (fname === '') {
						$("#19_Mouse").html("Enter Condition");
						$("#19_Mouse").show();

						error_condition = true;
					}

				}
			}
			function check_descriptionmouse() {

				var fname = $("#20_Mouse").val();
				if (fname !== '') {
					$("#21_Mouse").hide();

				} else {
					if (fname === '') {
						$("#21_Mouse").html("Enter Descriptions");
						$("#21_Mouse").show();

						error_description = true;
					}

				}
			}

			function check_modelkeyboard() {

				var fname = $("#14_Keyboard").val();
				if (fname !== '') {
					$("#15_Keyboard").hide();

				} else {
					if (fname === '') {
						$("#15_Keyboard").html("Enter Model No.");
						$("#15_Keyboard").show();

						error_model = true;
					}

				}
			}

			function check_serialkeyboard() {

				var fname = $("#16_Keyboard").val();
				if (fname !== '') {
					$("#17_Keyboard").hide();

				} else {
					if (fname === '') {
						$("#17_Keyboard").html("Enter Serial No.");
						$("#17_Keyboard").show();

						error_serial = true;
					}

				}
			}

			function check_conditionkeyboard() {

				var fname = $("#18_Keyboard").val();
				if (fname !== '') {
					$("#19_Keyboard").hide();

				} else {
					if (fname === '') {
						$("#19_Keyboard").html("Enter Condition");
						$("#19_Keyboard").show();

						error_condition = true;
					}

				}
			}

			function check_descriptionkeyboard() {

				var fname = $("#20_Keyboard").val();
				if (fname !== '') {
					$("#21_Keyboard").hide();

				} else {
					if (fname === '') {
						$("#21_Keyboard").html("Enter Descriptions");
						$("#21_Keyboard").show();

						error_description = true;
					}

				}
			}
			function check_modelLaptop() {

				var fname = $("#14_Laptop").val();
				if (fname !== '') {
					$("#15_Laptop").hide();

				} else {
					if (fname === '') {
						$("#15_Laptop").html("Enter Model No.");
						$("#15_Laptop").show();

						error_model = true;
					}

				}
			}
			function check_serialLaptop() {

				var fname = $("#16_Laptop").val();
				if (fname !== '') {
					$("#17_Laptop").hide();

				} else {
					if (fname === '') {
						$("#17_Laptop").html("Enter Serial No.");
						$("#17_Laptop").show();

						var error_serial = true;
					}

				}
			}
			function check_conditionLaptop() {

				var fname = $("#18_Laptop").val();
				if (fname !== '') {
					$("#19_Laptop").hide();

				} else {
					if (fname === '') {
						$("#19_Laptop").html("Enter Condition");
						$("#19_Laptop").show();

						var error_condition = true;
					}

				}
			}
			function check_descriptionLaptop() {

				var fname = $("#20_Laptop").val();
				if (fname !== '') {
					$("#21_Laptop").hide();

				} else {
					if (fname === '') {
						$("#21_Laptop").html("Enter Descriptions");
						$("#21_Laptop").show();

						var error_description = true;
					}

				}
			}
			function check_modelWire() {

				var fname = $("#14_Wire").val();
				if (fname !== '') {
					$("#15_Wire").hide();

				} else {
					if (fname === '') {
						$("#15_Wire").html("Enter Model No.");
						$("#15_Wire").show();

						error_model = true;
					}

				}
			}
			function check_serialWire() {

				var fname = $("#16_Wire").val();
				if (fname !== '') {
					$("#17_Wire").hide();

				} else {
					if (fname === '') {
						$("#17_Wire").html("Enter Serial No.");
						$("#17_Wire").show();

						var error_serial = true;
					}

				}
			}
			function check_conditionWire() {

				var fname = $("#18_Wire").val();
				if (fname !== '') {
					$("#19_Wire").hide();

				} else {
					if (fname === '') {
						$("#19_Wire").html("Enter Warrenty Expiration");
						$("#19_Wire").show();

						var error_condition = true;
					}

				}
			}
			function check_descriptionWire() {

				var fname = $("#20_Wire").val();
				if (fname !== '') {
					$("#21_Wire").hide();

				} else {
					if (fname === '') {
						$("#21_Wire").html("Enter Warrenty Expiration");
						$("#21_Wire").show();

						var error_description = true;
					}

				}
			}
			function check_warrentyExpirationMouse() {

				var fname = $("#4_Mouse").val();
				if (fname !== '') {
					$("#13_Mouse").hide();

				} else {
					if (fname === '') {
						$("#13_Mouse").html("Enter Warrenty Expiration");
						$("#13_Mouse").show();

						error_warrentyexpiration = true;
					}

				}
			}

			function check_warrentyExpirationKey() {

				var fname = $("#4_Keyboard").val();
				if (fname !== '') {
					$("#13_Keyboard").hide();

				} else {
					if (fname === '') {
						$("#13_Keyboard").html("Enter Warrenty Expiration");
						$("#13_Keyboard").show();

						error_warrentyexpiration = true;
					}

				}
			}

			function check_warrentyExpirationLap() {

				var fname = $("#4_Laptop").val();
				if (fname !== '') {
					$("#13_Laptop").hide();

				} else {
					if (fname === '') {
						$("#13_Laptop").html("Enter Warrenty Expiration");
						$("#13_Laptop").show();

						error_warrentyexpiration = true;
					}

				}
			}

			function check_warrentyExpirationWire() {

				var fname = $("#4_Wire").val();
				if (fname !== '') {
					$("#13_Wire").hide();

				} else {
					if (fname === '') {
						$("#13_Wire").html("Enter Warrenty Expiration");
						$("#13_Wire").show();

						error_warrentyexpiration = true;
					}

				}
			}
			$("#trxForm").submit(
					function() {
					var statuid= $("#statuid").val();
					  if(statuid == 'Approved') {
						error_fname = false;
						error_deptdesk = false;
						error_remark = false;
						error_price = false;
						error_quantity = false;
						error_supplier = false;
						error_date = false;
						error_model = false;
						error_serial = false;
						error_condition = false;
						error_description = false;
						error_model = false;
						error_warrentyexpiration = false;
         
						check_fname();
						check_dept();
						check_remark();
						check_price();
						check_quantity();
						check_pricekey();
						check_quantitykey();
						check_priceLap();
						check_quantityLap();
						check_priceWire();
						check_quantityWire();
						check_dateMouse();
						check_dateKey();
						check_dateLap();
						check_dateWire();
						check_suppliermouse();
						check_supplierkey();
						check_supplierLap();
						check_supplierwire();
						check_modelMouse();
						check_serialmouse();
						check_conditionmouse();
						check_descriptionmouse();
						check_modelkeyboard();
						check_serialkeyboard();
						check_conditionkeyboard();
						check_descriptionkeyboard();
						check_modelLaptop();
						check_serialLaptop();
						check_conditionLaptop();
						check_descriptionLaptop();
						check_modelWire();
						check_serialWire();
						check_conditionWire();
						check_descriptionWire();
						check_warrentyExpirationMouse();
						check_warrentyExpirationKey();
						check_warrentyExpirationLap();
						check_warrentyExpirationWire();
					
						if (error_fname === false && error_deptdesk == false
								&& error_remark == false
								&& error_price === false
								&& error_quantity === false
								&& error_supplier === false
								&& error_date === false
								&& error_model === false
								&& error_serial === false
								&& error_condition === false
								&& error_description === false
								&& error_warrentyexpiration === false) {

							return true;
						} else {
							swal("Sorry!", "Please Fill The Form Correctly",
									"error");
							return false;
						}
	}
					});
		});
	</script>

</body>
</html>