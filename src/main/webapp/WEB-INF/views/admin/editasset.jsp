 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="width=device-width;text/html; charset=ISO-8859-1">
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


<!-- <link rel="stylesheet" href="/css/style.css"> -->
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <script type="text/javascript" src="js/Login.js"></script> -->
<!-- <script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<title>Login</title>
<!-- <script type="text/javascript" src="js/editasset.js"></script> -->
<link rel="stylesheet" href="../css/topnav.css">
<style>
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
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #f2f2f2;
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
<div style="position: absolute; bottom: 35%; left: 30%;" class="row justify-content-center">
<svg width="4em" height="4em" viewBox="0 0 16 16" class="bi bi-dot" fill="#e8b513" xmlns="http://www.w3.org/2000/svg"> 
<path fill-rule="evenodd" d="M8 9.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z" /> </svg>
<svg width="4em" height="4em" viewBox="0 0 16 16" class="bi bi-dot" fill="#4181eb" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" d="M8 9.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z" /> </svg>
<svg width="4em" height="4em" viewBox="0 0 16 16" class="bi bi-dot" fill="#2ba34c" xmlns="http://www.w3.org/2000/svg"> 
<path fill-rule="evenodd" d="M8 9.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z" /> </svg>
</div>
</div>



<div class="row">
<div class="card-body" style="width: 55vw;">
<form:form class="form-horizontal" action="../updateasset" modelAttribute="assetval" cssClass="float-label" id="trxForm" name="myform" method="POST" >
<div class="form-group p-1">

<div class="container" style="width: inherit;">
<h4 style="text-align: right;">
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
<c:if test="${report.status=='Sent To Requester'}"><c:if test="${role=='USER'}">
<li><a data-toggle="tab" href="#menu1">Asset
Details</a></li>

<!-- <li><a data-toggle="tab" href="#menu2">Purchase
Information</a></li> -->
<li><a data-toggle="tab" href="#menu3">Location</a></li>
</c:if></c:if>
<c:if test="${report.status=='Closed'}"><c:if test="${role=='USER'}">
<li><a data-toggle="tab" href="#menu1">Asset
Details</a></li>

<!-- <li><a data-toggle="tab" href="#menu2">Purchase
Information</a></li> -->
<li><a data-toggle="tab" href="#menu3">Location</a></li>
</c:if></c:if>
<c:if test="${report.status=='Sent To Requester'}"><c:if test="${role!='USER'}">
<li><a data-toggle="tab" href="#menu1">Asset
Details</a></li>

<li><a data-toggle="tab" href="#menu2">Purchase
Information</a></li>
<li><a data-toggle="tab" href="#menu3">Location</a></li>
</c:if></c:if>
<c:if test="${report.status=='Closed'}"><c:if test="${role!='USER'}">
<li><a data-toggle="tab" href="#menu1">Asset
Details</a></li>

<li><a data-toggle="tab" href="#menu2">Purchase
Information</a></li>
<li><a data-toggle="tab" href="#menu3">Location</a></li>
</c:if></c:if>

<c:if test="${report.status=='Partially Closed'}"><c:if test="${role!='USER'}">
<li><a data-toggle="tab" href="#menu1">Asset Details</a></li>
<li><a data-toggle="tab" href="#menu2">Purchase
Information</a></li>
<li><a data-toggle="tab" href="#menu3">Location</a></li>
</c:if></c:if>

<c:if test="${report.status=='Finally Closed'}">
<li><a data-toggle="tab" href="#menu1">Asset
Details</a></li>

<li><a data-toggle="tab" href="#menu2">Purchase
Information</a></li>
<li><a data-toggle="tab" href="#menu3">Location</a></li>
</c:if>
<c:if test="${report.status=='partially select'}">
<li><a data-toggle="tab" href="#menu1">Asset
Details</a></li>

<li><a data-toggle="tab" href="#menu2">Purchase
Information</a></li>
<li><a data-toggle="tab" href="#menu3">Location</a></li>
</c:if>
<c:if test="${report.status=='Partially update'}">
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
<input type="hidden"
value="${report.status}" name="statusid" id="statuid">
<label class="control-label required"> Name </label> <input
style="color: black" type="text" name="name"
value="${report.name}" readonly="readonly"
placeholder="Enter your Name" id="name"
class="form-control">
<div id="validName" class="text-danger" font-weight-bold></div>

<label class="control-label required"> </label> <input
style="color: black" type="hidden" value="${report.email}"
name="email" readonly="readonly" placeholder="enter email"
id="emp_id" class="form-control">

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
<c:if test="${report.status!='Return by HR'}">
 <c:if test="${report.status!='Return By Reporting Manager'}">
<label class="control-label required"> Category </label> <input
style="color: black" readonly="readonly" type="text"
name="category" maxlength="30" value="${report.category}"
placeholder="Enter your Category " id="category"
class="form-control">



<!---------------------------Asset type------------------------------ -->
<label class="control-label required"> Asset
Request </label> <input style="color: red" readonly="readonly"
type="text" value="${report.asset_request}"
name="asset_request" readonly="readonly" id="emp_id"
class="form-control">
<%-- <p>
<!-- <b>Asset Request</b> -->
</p>
<select style='display: none' class="form-control"
id="assetstype" name="asset_request" multiple="true"
readonly="readonly">
<c:forEach items="${assetslist}" var="otherper">
<option value="${otherper.assetstype}"
<c:if test="${fn:containsIgnoreCase(selctedotherincall, otherper.assetstype) }">SELECTED</c:if>>${otherper.assetstype}</options>
</c:forEach>
</select> --%>
</c:if>
</c:if>


<c:if test="${report.status=='Return By Reporting Manager'}">
<label class="control-label required"> Category </label>
<select id="category" name="category" class="form-control">
<option value="${report.category}" >${report.category}</option>
<option value="hardware">Hardware</option>
<option value="software">Software</option>
</select>


<!---------------------------Asset type------------------------------ -->
<p>
<b>Asset Request</b>
</p>
<div>
<c:forEach var="userDetails" items="${userDetails}">
                                                        <input type="checkbox" class="gender" id="assetslist" value="${userDetails}"
                                                                name="asset_request" style="width: 100px;"
                                                 <c:if test="${fn:containsIgnoreCase(report.asset_request,userDetails)}">checked </c:if>/>${userDetails}
                                                <br>                                                   
                                                        </c:forEach>
</div>
<span id="textspan" style="color:red"></span>

</c:if>



<c:if test="${report.status=='Return by HR'}">
<label class="control-label required"> Category </label>
<select id="category" name="category" class="form-control">
<option value="${report.category}" >${report.category}</option>
<option value="hardware">Hardware</option>
<option value="software">Software</option>
</select>


<!---------------------------Asset type------------------------------ -->
<p>
<b>Asset Request</b>
</p>
<div>
<c:forEach var="userDetails" items="${userDetails}">
                                                        <input type="checkbox" class="gender" id="assetslist" value="${userDetails}"
                                                                name="asset_request" style="width: 100px;"
                                                 <c:if test="${fn:containsIgnoreCase(report.asset_request,userDetails)}">checked </c:if>/>${userDetails}
                                                <br>                                                   
                                                        </c:forEach>
</div>
<span id="textspan" style="color:red"></span>

</c:if>
</div>


<div id="menu1" class="tab-pane fade">
<!--------------------------------------------MODEL NO-----------------------------------------------------------------------------  -->
<div style="overflow-x:auto;">
<input id="sts" type="hidden" >
                                                    <input id="sws" type="hidden"   value="Not available">
<table>

<tr>

<th>Asset Request</th>
<th>Brand Name</th>
<th>Model Name</th>  
<th>Tag No</th>                  
<th>Serial No</th>
<th>Condition</th>
<th>Description</th>
<th>Information</th>
</tr>
<c:if test="${report.status=='Approved'}"> 
<c:forEach var="splt" items="${selctedotherincall}">
<tr>

<td><input disabled class="form-control" style="color: green" name="asset_request" style="width: 100px;" id=90_${splt} value="${splt}" /></td>
<td><select name="supplier" class="form-control" style="width: 120px;" id=3_${splt} onchange="getsection(this);" >
<option value=" ">Select</option>
<c:forEach var="device" items="${device}">
<option value="${device}">${device}</option>      
</c:forEach>
</select><div id=10_${splt} style="color: red"></div></td>
<td><select value="${splt1.model_no}" name="model_no" class="form-control" style="width: 120px;" id=14_${splt} onchange="gettag(this);">
<option value="">Select</option>
</select><div id=15_${splt} style="color: red"></div></td>
<!-- <td><input class="form-control"    name="tag" style="width: 100px;"
id=80_${splt}>
<div id=81_${splt} style="color: red"></div></td> -->

<td><select value="${splt1.tag}" name="tag" class="form-control" style="width: 120px;" id=80_${splt} onchange="getsectionmodel(this);">
<option value="">Select</option>
</select><div id=81_${splt} style="color: red"></div></td>

<td><input class="form-control" value="${splt1.serial_no}" name="serial_no" style="width: 100px;" id=16_${splt}><div id=17_${splt} style="color: red"></div></td>


<td><input class="form-control"    name="condition1" style="width: 100px;"
id=18_${splt}>
<div id=19_${splt} style="color: red"></div></td>
<td><input class="form-control"     name="descriptions"
style="width: 100px;" id=20_${splt}>
<div id=21_${splt} style="color: red"></div></td>
<td><select class="form-control" oninput="check();" onclick="checkinfo();" id=30_${splt} name="information" style="width: 100px;">
              <option value="">Select</option>
<option value="Available">Available</option>
<option value="Not available">Not available</option>
</select>
<div id=31_${splt} style="color: red"></div></td>
</tr>
</c:forEach>
</c:if>
<c:if test="${report.status=='Sent To Requester'}"> 
<%-- <c:if test="${role !='HR'}"> --%>
<c:forEach var="splt1" items="${reportchild}">
<tr>

<td><input class="form-control" style="color: green" disabled
name="asset_request" style="width: 100px;"
value="${splt1.asset_request}" /></td>

<td><input readonly="readonly" class="form-control" value="${splt1.supplier}"
name="supplier" id=3_${splt1.asset_request} style="width: 60px;">
<div id=10_${splt1.asset_request} style="color: red"></div></td>
<td><input readonly="readonly" class="form-control" value="${splt1.model_no}"
name="model_no" style="width: 100px;" id=14_${splt1.asset_request}>
<div id=15_${splt1.asset_request} style="color: red"></div></td>
<td><input readonly="readonly" class="form-control" value="${splt1.serial_no}"
name="serial_no" style="width: 100px;" id=16_${splt1.asset_request}>
<div id=17_${splt1.asset_request} style="color: red"></div></td>
<td><input readonly="readonly" class="form-control" value="${splt1.tag}"
name="tag" style="width: 100px;" id=80_${splt1.asset_request}>
<div id=81_${splt1.asset_request} style="color: red"></div></td>
<td><input readonly="readonly" class="form-control" value="${splt1.condition1}"
name="condition1" style="width: 100px;" id=18_${splt1.asset_request}>
<div id=19_${splt1.asset_request} style="color: red"></div></td>
<td><input readonly="readonly" class="form-control" value="${splt1.descriptions}"
name="descriptions" style="width: 100px;"
id=20_${splt1.asset_request}>
<div id=21_${splt1.asset_request} style="color: red"></div></td>
 <td><input readonly="readonly" class="form-control" value="${splt1.information}"
                                                                        name="information" style="width: 100px;"
                                                                        id=30_${splt1.asset_request}>
                                                                    <div id=31_${splt1.asset_request} style="color: red"></div></td>
</tr>
</c:forEach>
</c:if>
<c:if test="${report.status=='Closed'}"> 
<%-- <c:if test="${role !='HR'}"> --%>
<c:forEach var="splt1" items="${reportchild}">
<tr>

<td><input class="form-control" style="color: green" disabled
name="asset_request" style="width: 100px;"
value="${splt1.asset_request}" /></td>

<td><input readonly="readonly" class="form-control" value="${splt1.supplier}"
name="supplier" id=3_${splt1.asset_request} style="width: 60px;">
<div id=10_${splt1.asset_request} style="color: red"></div></td>
<td><input readonly="readonly" class="form-control" value="${splt1.model_no}"
name="model_no" style="width: 100px;" id=14_${splt1.asset_request}>
<div id=15_${splt1.asset_request} style="color: red"></div></td>
<td><input readonly="readonly" class="form-control" value="${splt1.tag}"
name="tag" style="width: 100px;" id=80_${splt1.asset_request}>
<div id=81_${splt1.asset_request} style="color: red"></div></td>
<td><input readonly="readonly" class="form-control" value="${splt1.serial_no}"
name="serial_no" style="width: 100px;" id=16_${splt1.asset_request}>
<div id=17_${splt1.asset_request} style="color: red"></div></td>
<td><input readonly="readonly" class="form-control" value="${splt1.condition1}"
name="condition1" style="width: 100px;" id=18_${splt1.asset_request}>
<div id=19_${splt1.asset_request} style="color: red"></div></td>
<td><input readonly="readonly" class="form-control" value="${splt1.descriptions}"
name="descriptions" style="width: 100px;"
id=20_${splt1.asset_request}>
<div id=21_${splt1.asset_request} style="color: red"></div></td>
 <td><input readonly="readonly" class="form-control" value="${splt1.information}"
                                                                        name="information" style="width: 100px;"
                                                                        id=30_${splt1.asset_request}>
                                                                    <div id=31_${splt1.asset_request} style="color: red"></div></td>
</tr>
</c:forEach>
</c:if>

<c:if test="${report.status=='Partially Closed'}"> 
<%-- <c:if test="${role !='HR'}"> --%>
<c:forEach var="splt1" items="${reportchild}">
<tr>
<td><input class="form-control" style="color: green" disabled
name="asset_request" style="width: 100px;"
value="${splt1.asset_request}" /></td>
<td><input readonly="readonly" class="form-control" value="${splt1.supplier}"
name="supplier" id=3_${splt1.asset_request} style="width: 60px;">
<div id=10_${splt1.asset_request} style="color: red"></div></td>
<td><input readonly="readonly" class="form-control" value="${splt1.model_no}"
name="model_no" style="width: 100px;" id=14_${splt1.asset_request}>
<div id=15_${splt1.asset_request} style="color: red"></div></td>
<td><input readonly="readonly" class="form-control" value="${splt1.tag}"
name="tag" style="width: 100px;" id=80_${splt1.asset_request}>
<div id=81_${splt1.asset_request} style="color: red"></div></td>

<td><input readonly="readonly" class="form-control" value="${splt1.serial_no}"
name="serial_no" style="width: 100px;" id=16_${splt1.asset_request}>
<div id=17_${splt1.asset_request} style="color: red"></div></td>

<td><input readonly="readonly" class="form-control" value="${splt1.condition1}"
name="condition1" style="width: 100px;" id=18_${splt1.asset_request}>
<div id=19_${splt1.asset_request} style="color: red"></div></td>
<td><input readonly="readonly" class="form-control" value="${splt1.descriptions}"
name="descriptions" style="width: 100px;"
id=20_${splt1.asset_request}>
<div id=21_${splt1.asset_request} style="color: red"></div></td>
 <td><input readonly="readonly" class="form-control" value="${splt1.information}"
                                                                        name="information" style="width: 100px;"
                                                                        id=30_${splt1.asset_request}>
                                                                    <div id=31_${splt1.asset_request} style="color: red"></div></td>
</tr>
</c:forEach>
</c:if>


<c:if test="${report.status=='Finally Closed'}"> 
<%-- <c:if test="${role !='HR'}"> --%>
<c:forEach var="splt1" items="${reportchild}">
<tr>

<td><input class="form-control" style="color: green" disabled
name="asset_request" style="width: 100px;"
value="${splt1.asset_request}" /></td>

<td><input readonly="readonly" class="form-control" value="${splt1.supplier}"
name="supplier" id=3_${splt1.asset_request} style="width: 60px;">
<div id=10_${splt1.asset_request} style="color: red"></div></td>
<td><input readonly="readonly" class="form-control" value="${splt1.model_no}"
name="model_no" style="width: 100px;" id=14_${splt1.asset_request}>
<div id=15_${splt1.asset_request} style="color: red"></div></td>
<td><input readonly="readonly" class="form-control" value="${splt1.tag}"
name="tag" style="width: 100px;" id=80_${splt1.asset_request}>
<div id=81_${splt1.asset_request} style="color: red"></div></td>
<td><input readonly="readonly" class="form-control" value="${splt1.serial_no}"
name="serial_no" style="width: 100px;" id=16_${splt1.asset_request}>
<div id=17_${splt1.asset_request} style="color: red"></div></td>
<td><input readonly="readonly" class="form-control" value="${splt1.condition1}"
name="condition1" style="width: 100px;" id=18_${splt1.asset_request}>
<div id=19_${splt1.asset_request} style="color: red"></div></td>
<td><input readonly="readonly" class="form-control" value="${splt1.descriptions}"
name="descriptions" style="width: 100px;"
id=20_${splt1.asset_request}>
<div id=21_${splt1.asset_request} style="color: red"></div></td>
 <td><input readonly="readonly" class="form-control" value="${splt1.information}"
                                                                        name="information" style="width: 100px;"
                                                                        id=30_${splt1.asset_request}>
                                                                    <div id=31_${splt1.asset_request} style="color: red"></div></td>
</tr>
</c:forEach>
</c:if>
<c:if test="${report.status=='partially select'}"> 
<c:forEach var="splt1" items="${reportchild}">
<tr>

<td><input class="form-control" style="color: green" disabled name="asset_request" style="width: 100px;" value="${splt1.asset_request}" id=90_${splt1.asset_request} /></td>
<td><select name="supplier" class="form-control" style="width: 120px;" id=3_${splt1.asset_request} onchange="getsection(this);">
<option value="${splt1.supplier}">${splt1.supplier}</option>
<!-- <option value=" ">Select</option> -->
<c:forEach var="device" items="${device}">
<option value="${device}">${device}</option>      
</c:forEach></select><div id=10_${splt1.asset_request} style="color: red"></div></td>   
<td><select name="model_no" class="form-control" style="width: 120px;" id=14_${splt1.asset_request} onchange="gettag(this);">
<option value="${splt1.model_no}">${splt1.model_no}</option></select><div id=15_${splt1.asset_request} style="color: red"></div></td>
<%-- <td><input  class="form-control" value="${splt1.tag}"
name="tag" style="width: 100px;" id=80_${splt1.asset_request}>
<div id=81_${splt1.asset_request} style="color: red"></div></td> --%>

<td><select name="tag" class="form-control" style="width: 120px;" id=80_${splt1.asset_request} onchange="getsectionmodel(this);" >
<option value="${splt1.tag}">${splt1.tag}</option></select><div id=81_${splt1.asset_request} style="color: red"></div></td>

<td><input  class="form-control" value="${splt1.serial_no}"
name="serial_no" style="width: 100px;" id=16_${splt1.asset_request}>
<div id=17_${splt1.asset_request} style="color: red"></div></td>

<td><input  class="form-control" value="${splt1.condition1}"
name="condition1" style="width: 100px;" id=18_${splt1.asset_request}>
<div id=19_${splt1.asset_request} style="color: red"></div></td>
<td><input  class="form-control" value="${splt1.descriptions}"
name="descriptions" style="width: 100px;"
id=20_${splt1.asset_request}>
<div id=21_${splt1.asset_request} style="color: red"></div></td>
 <td><select class="form-control" oninput="check();" onclick="checkinfo();"  id=30_${splt1.asset_request} name="information" style="width: 100px;">
              <option value="${splt1.information}">${splt1.information}</option>
<option value="Available">Available</option>
<option value="Not available">Not available</option>
</select>
<div id=31_${splt1.asset_request} style="color: red"></div>
</tr> 
<tr>

</tr>
</c:forEach>
</c:if>
<c:if test="${report.status=='Partially update'}"> 
<c:forEach var="splt1" items="${reportchild}">
<tr>

<td><input class="form-control" style="color: green" disabled name="asset_request" style="width: 100px;" value="${splt1.asset_request}" id=90_${splt1.asset_request} /></td>
<td><select name="supplier" class="form-control" style="width: 120px;" id=3_${splt1.asset_request} onchange="getsection(this);">
<option value="${splt1.supplier}">${splt1.supplier}</option>
<!-- <option value=" ">Select</option> -->
<c:forEach var="device" items="${device}">
<option value="${device}">${device}</option>      
</c:forEach></select><div id=10_${splt1.asset_request} style="color: red"></div></td>
<td><select name="model_no" class="form-control" style="width: 120px;" id=14_${splt1.asset_request} onchange="gettag(this);">
<option value="${splt1.model_no}">${splt1.model_no}</option></select>
<div id=15_${splt1.asset_request} style="color: red"></div></td>

<%-- <td><input  class="form-control" value="${splt1.tag}"
name="tag" style="width: 100px;" id=80_${splt1.asset_request}>
<div id=81_${splt1.asset_request} style="color: red"></div></td> --%>

<td><select name="tag" class="form-control" style="width: 120px;" id=80_${splt1.asset_request} onchange="getsectionmodel(this);">
<option value="${splt1.tag}">${splt1.tag}</option></select>
<div id=81_${splt1.asset_request} style="color: red"></div></td>


<td><input  class="form-control" value="${splt1.serial_no}"
name="serial_no" style="width: 100px;" id=16_${splt1.asset_request}>
<div id=17_${splt1.asset_request} style="color: red"></div></td>


<td><input  class="form-control" value="${splt1.condition1}"
name="condition1" style="width: 100px;" id=18_${splt1.asset_request}>
<div id=19_${splt1.asset_request} style="color: red"></div></td>
<td><input  class="form-control" value="${splt1.descriptions}"
name="descriptions" style="width: 100px;"
id=20_${splt1.asset_request}>
<div id=21_${splt1.asset_request} style="color: red"></div></td>
 <td><select class="form-control" oninput="check();"  onclick="checkinfo();" id=30_${splt1.asset_request} name="information" style="width: 100px;">
              <option  value="${splt1.information}">${splt1.information}</option>
<option value="Available">Available</option>
<option value="Not available">Not available</option>
</select>
<div id=31_${splt1.asset_request} style="color: red"></div>
</tr> 
<tr>

</tr>
</c:forEach>
</c:if>

</table>
</div>
</div>

<!-------------------------------------------------------PURCHASE INFORMATION-----------------------------------------  -->
<div id="menu2" class="tab-pane fade">
<!-------------------------------------------------------DATE---------------------------------------------------------- -->
<div style="overflow-x:auto;">
<table>
<tr>

<th style="width: 80px;">Asset Request</th>
<th style="width: 50px;">Procurement Date</th>

<th style="width: 80px;">Issue Date</th>
<th style="width: 50px;">Warranty Expiration</th>
<th style="width: 80px;">Return Date</th>
<th style="width: 80px;">Unit price</th>
<th style="width: 80px;">Quantity</th>
<th style="width: 80px;">Value</th>

</tr>




<c:if test="${report.status=='Approved'}">
<c:forEach var="splt" items="${selctedotherincall}">

<tr>

<td><input disabled class="form-control" value="${splt}"
name="asset_request" id=2_${splt}
style="width: 80px; color: green" value="${splt}" /></td>
<td><input class="form-control" name="date"    type="date" id=11_${splt}
style="width: 120px;">
<div id=12_${splt} style="color: red"></div></td>
<td><input class="form-control"    name="issue_date" type="date" id=32_${splt}
style="width: 120px;">
<div id=33_${splt} style="color: red"></div></td></td>
<td><input class="form-control"    name="warranty_expiration" type="date" id=4_${splt} style="width: 120px;">
<div id=13_${splt} style="color: red"></div></td>
<td><input class="form-control" readonly="readonly"   name="return_date" type="date" id=34_${splt}
style="width: 120px;">
<div id=35_${splt} style="color: red"></div></td></td>
<td><input class="form-control"  name="unit_price" class="iput"
id=5_${splt} style="width: 60px;">
<div id=8_${splt} style="color: red"></div></td>
<td><input class="form-control"   name="quantity"
id=6_${splt} oninput="calculate();"
style="width: 60px;">
<div id=9_${splt} style="color: red"></td>
<td><input class="form-control"  readonly="readonly"  name="value"
id=7_${splt} style="width: 60px;"></td>
</tr>
</c:forEach>
</c:if>
<c:if test="${report.status=='Sent To Requester'}"> 
<%-- <c:if test="${role !='HR'}"> --%>
<c:forEach var="splt1" items="${reportchild}">
<tr>

<td><input disabled class="form-control" value="${splt1.asset_request}"
name="asset_request" id=2_${splt1.asset_request}
style="width: 80px; color: green" value="${splt}" /></td>
<td><input readonly="readonly" class="form-control" value="${splt1.date}"
name="date"  id=11_${splt1.asset_request}
style="width: 126px;">
<div id=12_${splt} style="color: red"></div></td>

<td><input readonly="readonly" class="form-control" name="issue_date"  value="${splt1.issue_date}" id=32_${splt}
style="width: 120px;">
<div id=33_${splt1.asset_request} style="color: red"></div></td>
<td><input readonly="readonly" class="form-control"
value="${splt1.warranty_expiration}"
name="warranty_expiration"  id=4_${splt}
style="width: 126px;"> 
<div id=13_${splt1.asset_request} style="color: red"></div></td>
<td><input class="form-control" type="date" name="return_date" value="${splt1.return_date}" id=34_${splt}
style="width: 120px;">
<div id=35_${splt1.asset_request} style="color: red"></div></td></td>
<td><input readonly="readonly" class="form-control" value="${splt1.unit_price}"
name="unit_price" class="iput" id=5_${splt1.asset_request}
style="width: 60px;">
<div id=8_${splt} style="color: red"></div></td>
<td><input readonly="readonly" class="form-control" value="${splt1.quantity}"
name="quantity" class="iput" id=6_${splt}
oninput="calculate();" style="width: 60px;">
<div id=9_${splt} style="color: red"></td>
<td><input readonly="readonly" class="form-control" value="${splt1.value}"
name="value" id=7_${splt} style="width: 60px;"></td>
</tr>
</c:forEach>
</c:if>
<c:if test="${report.status=='Closed'}"> 
<%-- <c:if test="${role !='HR'}"> --%>
<c:forEach var="splt1" items="${reportchild}">
<tr>

<td><input disabled class="form-control" value="${splt1.asset_request}"
name="asset_request" id=2_${splt1.asset_request}
style="width: 80px; color: green" value="${splt1.asset_request}" /></td>
<td><input readonly="readonly" class="form-control" value="${splt1.date}"
name="date"  id=11_${splt1.asset_request}
style="width: 126px;">
<div id=12_${splt1.asset_request} style="color: red"></div></td>

<td><input readonly="readonly" class="form-control" name="issue_date"  value="${splt1.issue_date}" id=32_${splt1.asset_request}
style="width: 120px;">
<div id=33_${splt1.asset_request} style="color: red"></div></td></td>
<td><input readonly="readonly" class="form-control"
value="${splt1.warranty_expiration}"
name="warranty_expiration"  id=4_${splt1.asset_request}
style="width: 126px;"> 
<div id=13_${splt1.asset_request} style="color: red"></div></td>
<%-- <td><input class="form-control" name="return_date" type="date" value="${splt1.return_date}" id=34_${splt1.asset_request}
style="width: 120px;">
<div id=35_${splt1.asset_request} style="color: red"></div></td></td> --%>
<c:if test="${splt1.return_date>'2020-01-23'}">
<td><input class="form-control" name="return_date" type="date" id=34_${splt1.asset_request}
style="width: 120px;">
<div id=35_${splt1.asset_request} style="color: red"></div></td></td></c:if>
<c:if test="${splt1.return_date=='2020-01-23'}">
<td><input  type="date"  class="form-control" value=""
name="return_date"  id=70_${splt1.asset_request}
style="width: 126px;">
<div id=71_${splt1.asset_request} style="color: red"></div></td></c:if>
<td><input readonly="readonly" class="form-control" value="${splt1.unit_price}"
name="unit_price" class="iput" id=5_${splt1.asset_request}
style="width: 60px;">
<div id=8_${splt1.asset_request} style="color: red"></div></td>
<td><input readonly="readonly" class="form-control" value="${splt1.quantity}"
name="quantity" class="iput" id=6_${splt1.asset_request}
oninput="calculate();" style="width: 60px;">
<div id=9_${splt1.asset_request} style="color: red"></td>
<td><input readonly="readonly" class="form-control" value="${splt1.value}"
name="value" id=7_${splt1.asset_request} style="width: 60px;"></td>
</tr>
</c:forEach>
</c:if>

<c:if test="${report.status=='Partially Closed'}"> 
<%-- <c:if test="${role !='HR'}"> --%>
<c:forEach var="splt1" items="${reportchild}">
<tr>
<td><input disabled class="form-control" value="${splt1.asset_request}"
name="asset_request" id=2_${splt1.asset_request}
style="width: 80px; color: green" value="${splt}" /></td>
<td><input readonly="readonly" class="form-control" value="${splt1.date}"
name="date"  id=11_${splt1.asset_request}
style="width: 126px;">
<div id=12_${splt1.asset_request} style="color: red"></div></td>
<td><input readonly="readonly" class="form-control" name="issue_date"  value="${splt1.issue_date}" id=32_${splt1.asset_request}
style="width: 120px;">
<div id=33_${splt} style="color: red"></div></td></td>
<td><input readonly="readonly" class="form-control"
value="${splt1.warranty_expiration}"
name="warranty_expiration"  id=4_${splt1.asset_request}
style="width: 126px;"> 
<div id=13_${splt1.asset_request} style="color: red"></div></td>
<%--  <td><input class="form-control" type="date" name="return_date" value="${splt1.return_date}" id=34_${splt1.asset_request}
style="width: 120px;">
<div id=35_${splt1.asset_request} style="color: red"></div></td></td>
 --%>
<c:if test="${splt1.return_date>'2020-01-23'}">
<td><input class="form-control" name="return_date" type="date" id=34_${splt1.asset_request}
style="width: 120px;" value="${splt1.return_date}">
<div id=35_${splt1.asset_request} style="color: red"></div></td></td></c:if>
<c:if test="${splt1.return_date=='2020-01-23'}">
<td><input  type="date"  class="form-control" value=""
name="return_date"  id=34_${splt1.asset_request}
style="width: 126px;">
<div id=35_${splt1.asset_request} style="color: red"></div></td></c:if>
<td><input readonly="readonly" class="form-control" value="${splt1.unit_price}"
name="unit_price" class="iput" id=5_${splt1.asset_request}
style="width: 60px;">
<div id=8_${splt1.asset_request} style="color: red"></div></td>
<td><input readonly="readonly" class="form-control" value="${splt1.quantity}"
name="quantity" class="iput" id=6_${splt1.asset_request}
oninput="calculate();" style="width: 60px;">
<div id=9_${splt} style="color: red"></td>
<td><input readonly="readonly" class="form-control" value="${splt1.value}"
name="value" id=7_${splt1.asset_request} style="width: 60px;"></td>
</tr>
</c:forEach>
</c:if>

<c:if test="${report.status=='Finally Closed'}"> 
<%-- <c:if test="${role !='HR'}"> --%>
<c:forEach var="splt1" items="${reportchild}">
<tr>

<td><input disabled class="form-control" value="${splt1.asset_request}"
name="asset_request" id=2_${splt1.asset_request}
style="width: 80px; color: green" value="${splt}" /></td>
<td><input readonly="readonly" class="form-control" value="${splt1.date}"
name="date"  id=11_${splt1.asset_request}
style="width: 126px;">
<div id=12_${splt1.asset_request} style="color: red"></div></td>

<td><input readonly="readonly" class="form-control" name="issue_date"  value="${splt1.issue_date}" id=32_${splt1.asset_request}
style="width: 120px;">
<div id=33_${splt} style="color: red"></div></td></td>
<td><input readonly="readonly" class="form-control"
value="${splt1.warranty_expiration}"
name="warranty_expiration"  id=4_${splt1.asset_request}
style="width: 126px;"> 
<div id=13_${splt1.asset_request} style="color: red"></div></td>
<%--  <td><input class="form-control" type="date" name="return_date" value="${splt1.return_date}" id=34_${splt1.asset_request}
style="width: 120px;">
<div id=35_${splt1.asset_request} style="color: red"></div></td></td>
 --%>


<c:if test="${splt1.return_date>'2020-01-23'}">
<td><input class="form-control" name="return_date" readonly="readonly" id=34_${splt1.asset_request}
style="width: 120px;" value="${splt1.return_date}">
<div id=35_${splt1.asset_request} style="color: red"></div></td></td></c:if>
<c:if test="${splt1.return_date=='2020-01-23'}">
<td><input  readonly="readonly"  class="form-control" value=""
name="return_date"  id=34_${splt1.asset_request}
style="width: 126px;">
<div id=35_${splt1.asset_request} style="color: red"></div></td></c:if>


<td><input readonly="readonly" class="form-control" value="${splt1.unit_price}"
name="unit_price" class="iput" id=5_${splt1.asset_request}
style="width: 60px;">
<div id=8_${splt1.asset_request} style="color: red"></div></td>
<td><input readonly="readonly" class="form-control" value="${splt1.quantity}"
name="quantity" class="iput" id=6_${splt1.asset_request}
oninput="calculate();" style="width: 60px;">
<div id=9_${splt} style="color: red"></td>
<td><input readonly="readonly" class="form-control" value="${splt1.value}"
name="value" id=7_${splt1.asset_request} style="width: 60px;"></td>
</tr>
</c:forEach>
</c:if>
<c:if test="${report.status=='partially select'}">

<c:forEach var="splt1" items="${reportchild}">
<tr>

<td><input disabled class="form-control" value="${splt1.asset_request}"
name="asset_request" id=2_${splt1.asset_request}
style="width: 80px; color: green" value="${splt}" /></td>
<c:if test="${splt1.date>'2020-01-23'}">
<td><input class="form-control" name="date" type="date" id=11_${splt1.asset_request} value="${splt1.date}"
style="width: 120px;">
<div id=12_${splt1.asset_request} style="color: red"></div></td></c:if>
<c:if test="${splt1.date=='2020-01-23'}">
<td><input  type="date" class="form-control" 
name="date"  id=11_${splt1.asset_request} value=""
style="width: 126px;">
<div id=12_${splt1.asset_request} style="color: red"></div></td></c:if>

<c:if test="${splt1.issue_date>'2020-01-23'}">
<td><input class="form-control"  name="issue_date" type="date" id=32_${splt1.asset_request} value="${splt1.issue_date}"
style="width: 120px;">
<div id=33_${splt1.asset_request} style="color: red"></div></td></td></c:if>
<c:if test="${splt1.issue_date=='2020-01-23'}">
<td><input  type="date" class="form-control" 
name="issue_date"  id=32_${splt1.asset_request}
style="width: 126px;">
<div id=33_${splt1.asset_request} style="color: red"></div></td></c:if>
<c:if test="${splt1.warranty_expiration>'2020-01-23'}">
                                                                <td><input class="form-control" value="${splt1.warranty_expiration}" name="warranty_expiration" type="date" id=4_${splt1.asset_request}
                                                                        style="width: 120px;">
                                                                    <div id=13_${splt1.asset_request} style="color: red"></div></td></c:if>
                                                                    
<c:if test="${splt1.warranty_expiration=='2020-01-23'}">
                                                                    <td><input class="form-control" name="warranty_expiration" type="date" id=4_${splt1.asset_request}
                                                                        style="width: 120px;">
                                                                    <div id=13_${splt1.asset_request} style="color: red"></div></td></c:if>
<c:if test="${splt1.return_date>'2020-01-23'}">
<td><input class="form-control" readonly="readonly"  name="return_date" type="date" id=34_${splt1.asset_request}
style="width: 120px;">
<div id=35_${splt1.asset_request} style="color: red"></div></td></td></c:if>
<c:if test="${splt1.return_date=='2020-01-23'}">
<td><input  type="date"  readonly="readonly" class="form-control" value=""
name="return_date"  id=70_${splt1.asset_request}
style="width: 126px;">
<div id=71_${splt1.asset_request} style="color: red"></div></td></c:if>
<td><input class="form-control" value="${splt1.unit_price}" name="unit_price" class="iput"
id=5_${splt1.asset_request} style="width: 60px;">
<div id=8_${splt1.asset_request} style="color: red"></div></td>
<td><input class="form-control" value="${splt1.quantity}"  name="quantity"
id=6_${splt1.asset_request} oninput="calculate();"
style="width: 60px;">
<div id=9_${splt1.asset_request} style="color: red"></td>
<td><input class="form-control" value="${splt1.value}"  readonly="readonly" name="value"
id=7_${splt1.asset_request} style="width: 60px;"></td>
</tr>
</c:forEach>
</c:if>
<c:if test="${report.status=='Partially update'}">

<c:forEach var="splt1" items="${reportchild}">
<tr>

<td><input disabled class="form-control" value="${splt1.asset_request}"
name="asset_request" id=2_${splt1.asset_request}
style="width: 80px; color: green"  /></td>
<c:if test="${splt1.date>'2020-01-23'}">
<td><input class="form-control" name="date"  id=11_${splt1.asset_request} value="${splt1.date}"
style="width: 120px;">
<div id=12_${splt1.asset_request} style="color: red"></div></td></c:if>
<c:if test="${splt1.date=='2020-01-23'}">
<td><input  type="date" class="form-control" value=""
name="date"  id=11_${splt1.asset_request}
style="width: 126px;">
<div id=12_${splt1.asset_request} style="color: red"></div></td></c:if>

<c:if test="${splt1.issue_date>'2020-01-23'}">
<td><input class="form-control"  value="${splt1.issue_date}"  name="issue_date" type="date" id=32_${splt1.asset_request}
style="width: 120px;">
<div id=33_${splt1.asset_request} style="color: red"></div></td></td></c:if>
<c:if test="${splt1.issue_date=='2020-01-23'}">
<td><input  type="date" class="form-control" value=""
name="issue_date"  id=32_${splt1.asset_request}
style="width: 126px;">
<div id=33_${splt1.asset_request} style="color: red"></div></td></c:if>
<c:if test="${splt1.warranty_expiration>'2020-01-23'}">
                                                                    <td><input class="form-control" value="${splt1.warranty_expiration}" name="warranty_expiration" type="date" id=4_${splt1.asset_request}
                                                                        style="width: 120px;">
                                                                    <div id=13_${splt1.asset_request} style="color: red"></div></td></c:if>
                                                                    
<c:if test="${splt1.warranty_expiration=='2020-01-23'}">
                                                                    <td><input class="form-control" name="warranty_expiration" type="date" id=4_${splt1.asset_request}
                                                                        style="width: 120px;">
                                                                    <div id=13_${splt1.asset_request} style="color: red"></div></td></c:if>
<c:if test="${splt1.return_date>'2020-01-23'}">
<td><input class="form-control" readonly="readonly"  name="return_date" type="date" id=34_${splt1.asset_request}
style="width: 120px;">
<div id=35_${splt1.asset_request} style="color: red"></div></td></td></c:if>
<c:if test="${splt1.return_date=='2020-01-23'}">
<td><input  type="date" readonly="readonly" class="form-control" value=""
name="return_date"  id=64_${splt1.asset_request}
style="width: 126px;">
<div id=65_${splt1.asset_request} style="color: red"></div></td></c:if>
<td><input class="form-control" value="${splt1.unit_price}" name="unit_price" class="iput"
id=5_${splt1.asset_request} style="width: 60px;">
<div id=8_${splt1.asset_request} style="color: red"></div></td>
<td><input class="form-control" value="${splt1.quantity}"  name="quantity"
id=6_${splt1.asset_request} oninput="calculate();"
style="width: 60px;">
<div id=9_${splt1.asset_request} style="color: red"></td>
<td><input class="form-control" value="${splt1.value}"  readonly="readonly" name="value"
id=7_${splt1.asset_request} style="width: 60px;"></td>
</tr>
</c:forEach>
</c:if>

</table>
</div>
</div>


<!-------------------------------------------------------LOCATION--------------------------------------------------------->

<div id="menu3" class="tab-pane fade">
<!-------------------------------------------------------DEPT/AREA----------------------------------------------------------  -->
<c:if test="${report.status=='Sent To Requester'}">

<label class="control-label required"> Dept/Area </label>
<input style="color: black" type="text" name="dept"
readonly="readonly" maxlength="30"
placeholder="Enter your Dept" id="dept"
value="${report.dept}" class="form-control">
<div id="validDept" class="text-danger" font-weight-bold></div>

<label class="control-label required"> Desk No. </label>
<input style="color: black" type="text" name="desk"
readonly="readonly" value="${report.desk}"
placeholder="Enter your Desk" id="desk"
class="form-control">

<div id="validDesk" class="text-danger" font-weight-bold></div>
</c:if>


<c:if test="${report.status !='Sent To Requester'}">

<label class="control-label required"> Dept/Area </label>
<input style="color: black" type="text" name="dept"
maxlength="30" placeholder="Enter your Dept" id="dept"
value="${report.dept}" class="form-control">
<div id="validDept" class="text-danger" font-weight-bold></div>

<label class="control-label required"> Desk No. </label>
<input style="color: black" type="text" name="desk"
value="${report.desk}" placeholder="Enter your Desk No."
id="desk" class="form-control">

<div id="validDesk" class="text-danger" font-weight-bold></div>
</c:if>
</div>
<!------------------------------------Remarks TAB---------------------------------------------------------  -->

<div id="menu4" class="tab-pane fade">


<!---------------------------Remarks------------------------------ -->
<label class="control-label required"> Remarks </label>
<textarea style="color: black" name="remarks"
maxlength="30" placeholder="Enter the Remark"
id="remarks" class="form-control"></textarea>
<div id="validRemarks" class="text-danger" font-weight-bold></div>




<label class="control-label required"> History </label>
<textarea readonly="readonly" style="color: black" id="menu1"
name="history" id="remarks" class="form-control" value="">${report.remarks}<%-- <c:forEach var="splt" 
                                                        items="${fn:split(report.remarks,',')}">${splt}
</c:forEach >--%></textarea>
<div id="validName" class="text-danger" font-weight-bold></div>



<!-- <label class="control-label required"> History </label> 
<input style="color: black" type="hidden" name="history"
value="${report.remarks}" 
id="remarks" class="form-control">

<div id="validDesk" class="text-danger" font-weight-bold></div>-->

</div>

</div>
</div>
</br>
<!-- ----------------------------------BUTTON---------------------------------------------- -->
<div class="container" >
<div class="row">
<div class="col-md-10">
<div class="btn-group"> 
<c:if test="${role =='HR'}">
<%-- <c:if test="${flag ==0}"> --%>

<c:if test="${report.status=='Approved'}">
<button value="Sent To Requester" name="status" id="flagg" class="btn btn-primary mx-auto" >
<span class="btn-text">Sent To Requester</span>
<div class="row"></div></button>

<button value="partially select" name="status" id="not" class="btn btn-primary mr-2 ml-2"  onclick="checkinfoapproved();">
<span class="btn-text">Partially Select</span>
<div class="row"></div></button>

<button value="Rejected by HR" name="status" id="" class="btn btn-primary mr-2 ml-2" >
<span class="btn-text">Reject</span>
<div class="row"></div></button>

<button   id="submit" value="Sent To HR(ON HOLD)" name="status" class="btn btn-primary mr-2">
<span class="btn-text">On Hold</span>
<div class="row"></div></button>

<button  id="submit" value="Return by HR" name="status" class="btn btn-primary mr-2">
<span class="btn-text">Return</span>
<div class="row"></div></button>   

<button value="submit" id="submit" class="btn btn-primary mr-2 ">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>
<!-- <button value="submit" id="submit" class="btn btn-primary mx-auto">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button> -->
</c:if>

<c:if test="${report.status=='Sent To Requester'}">
<button value="Finally Closed" name="status" id="flagg" class="btn btn-primary mx-auto" >
<span class="btn-text">Finally Closed</span>
<div class="row"></div></button>

<button value="submit" id="submit" class="btn btn-primary mr-2 ml-4">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>
</c:if>

<c:if test="${report.status=='Sent To HR(ON HOLD)'}">
<button id="submit" value="Approved" name="status" class="btn btn-primary mx-auto">                                          
<span class="btn-text">Active</span>
<div class="row"></div></button>

<c:if test="${report.status=='Sent To HR(ON HOLD)'}">
<button value="submit" id="" class="btn btn-primary mr-2 ml-4">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>
</c:if>

                                     
</c:if>

 <%-- <c:if test="${report.status=='Sent To HR'}">
<button value="Pending To Approver" name="status" id="submit" class="btn btn-primary mr-2 ml-4" >
<span class="btn-text">Sent To Approver</span>
<div class="row"></div></button>

<button value="Rejected by HR" name="status" id="submit" class="btn btn-primary mr-2" >
<span class="btn-text">Reject</span>
<div class="row"></div></button>

<button   id="submit" value="Sent To HR(ON HOLD)" name="status" class="btn btn-primary mr-2">
<span class="btn-text">On Hold</span>
<div class="row"></div></button>

<button  id="submit" value="Return by HR" name="status" class="btn btn-primary mr-2">
<span class="btn-text">Return</span>
<div class="row"></div></button>   

<button value="submit" id="submit" class="btn btn-primary mr-2">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>
</c:if>  --%>
<%-- <c:if test="${report.status=='Return By Approver'}">
<button   id="submit" value="Pending To Approver" name="status" class="btn btn-primary mr-2">                                           
<span class="btn-text">Sent To Approver</span>
<div class="row"></div></button>     

<button   id="submit" value="Sent To HR(ON HOLD)" name="status" class="btn btn-primary mr-2">
<span class="btn-text">On Hold</span>
<div class="row"></div></button>
 
<button value="Rejected by HR" name="status" id="submit" class="btn btn-primary mr-2" >
<span class="btn-text">Reject</span>
<div class="row"></div></button>  

<button   id="submit" value="Return by HR" name="status" class="btn btn-primary mr-2">  
<span class="btn-text">Return</span>
<div class="row"></div></button>   
 
<button value="submit" id="submit" class="btn btn-primary mr-2">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>                             
</c:if>  --%>

<c:if test="${report.status=='partially select'}">
<button value="Closed" name="status" id="flagg" class="btn btn-primary mx-auto" >
<span class="btn-text">Sent To Requester</span>
<div class="row"></div></button>

<button value="Partially update" name="status" id="not" class="btn btn-primary mr-2 ml-4" onclick="checkinfoAvailable();">
<span class="btn-text">Partially Select</span>
<div class="row"></div></button>
<button value="submit" id="submit" class="btn btn-primary mr-2 ml-4">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>
</c:if>

<c:if test="${report.status=='Partially update'}">
<button value="Closed" name="status" id="flagg" class="btn btn-primary mx-auto" onclick="checkinfoAvailableforupadate();">
<span class="btn-text">Sent To Requester</span>
<div class="row"></div></button>

<button value="Partially update" name="status" id="not" class="btn btn-primary mr-2 ml-4" onclick="checkinfoAvailableforupadate();">
<span class="btn-text">Partially Select</span>
<div class="row"></div></button>

<button value="submit" id="submit" class="btn btn-primary mr-2 ml-4">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>
</c:if>

<c:if test="${report.status=='Closed'}">
<button value="Partially Closed" name="status" id="flagg" class="btn btn-primary mx-auto" >
<span class="btn-text">Partially Closed</span>
<div class="row"></div></button>

<button value="Finally Closed" name="status" id="flagg" class="btn btn-primary mr-2 ml-4" >
<span class="btn-text">Finally Closed</span>
<div class="row"></div></button>

 

<button value="submit" id="submit" class="btn btn-primary mr-2 ml-4">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>
</c:if>

 

<c:if test="${report.status=='Partially Closed'}"> 

<button value="Partially Closed" name="status" id="flagg" class="btn btn-primary mx-auto" >
<span class="btn-text">Partially Closed</span>
<div class="row"></div></button>

<button value="Finally Closed" name="status" id="flagg" class="btn btn-primary mr-2 ml-4" >
<span class="btn-text">Finally Closed</span>
<div class="row"></div></button> 

<button value="submit" id="submit" class="btn btn-primary mr-2 ml-4">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>
</c:if>

</c:if>  



<c:if test="${role =='USER'}"> 
<c:if test="${report.status=='Return by HR'}">
<button  id="submit" class="btn btn-primary mx-auto" value="Sent To Reporting Manager" name="status">
<span class="btn-text">Update</span>
<div class="row"></div></button>

<button value="submit" id="submit" class="btn btn-primary mr-2 ml-4">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../user/openinfo">Cancel</a></span>
<div class="row"></div></button>
</c:if>


<c:if test="${report.status=='Return By Reporting Manager'}">
<button  id="submit" class="btn btn-primary mx-auto" value="Sent To Reporting Manager" name="status">
<span class="btn-text">Update</span>
<div class="row"></div></button>

<button value="submit" id="submit" class="btn btn-primary mr-2 ml-4">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../user/openinfo">Cancel</a></span>
<div class="row"></div></button>
</c:if>




<c:if test="${report.status=='Sent To Requester'}">
<button value="submit" id="" class="btn btn-primary mx-auto">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../user/openinfo">Close</a></span>
<div class="row"></div></button>
</c:if>

<c:if test="${report.status=='Closed'}">
<button value="submit" id="" class="btn btn-primary mx-auto">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../user/openinfo">Close</a></span>
<div class="row"></div></button>
</c:if>


</c:if>


<c:if test="${role=='ADMIN'}">
<c:if test="${report.status=='Sent To Reporting Manager'}">
<button value="Approved" name="status" id="submit" class="btn btn-primary ml-4 mr-2"  >
<span class="btn-text">Approved</span>
<div class="row"></div></button> 

<button value="Reject by Reporting Manager" name="status" id="submit" class="btn btn-primary mr-2"  >
<span class="btn-text">Reject</span>
<div class="row"></div></button>

<button id="submit" value="Pending To Reporting Manager(ON HOLD)" name="status" class="btn btn-primary mr-2">                                             
<span class="btn-text">On Hold</span>
<div class="row"></div></button>  


<button   id="submit" value="Return By Reporting Manager" name="status" class="btn btn-primary mr-2">  
<span class="btn-text">Return</span>
<div class="row"></div></button>
  
<button value="submit" id="submit" class="btn btn-primary mr-2">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>   
 </c:if>
 
<c:if test="${report.status=='Pending To Reporting Manager(ON HOLD)'}">
<button  id="submit" value="Sent To Reporting Manager" name="status" class="btn btn-primary mr-2">                                            
<span class="btn-text">Active</span>
<div class="row"></div> </button>                                    
 

<button value="submit" id="submit" class="btn btn-primary mr-2">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>                                    
</c:if>  
</c:if>
</div>
</div>
</div>
</div>
<div class="row"> 
<c:if test="${role =='HR'}"> 
<%-- <c:if test="${report.status=='Pending To Approver'}">
<button value="submit" id="" class="btn btn-primary mx-auto">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>                             
</c:if>  --%>




<c:if test="${report.status=='Pending To Reporting Manager(ON HOLD)'}">
<button value="submit" id="submit" class="btn btn-primary mx-auto">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>
</c:if>


<c:if test="${report.status=='Sent To Reporting Manager'}">
<button value="submit" id="submit" class="btn btn-primary mx-auto">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>
</c:if>


<c:if test="${report.status=='Return by HR'}">
<button value="submit" id="" class="btn btn-primary mx-auto">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>                             
</c:if>

<c:if test="${report.status=='Rejected by HR'}">
<button value="submit" id="" class="btn btn-primary mx-auto">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>
</c:if>

<c:if test="${report.status=='Reject by Reporting Manager'}">
<button value="submit" id="" class="btn btn-primary mx-auto">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>
</c:if>


<c:if test="${report.status=='Return By Reporting Manager'}">
<button value="submit" id="" class="btn btn-primary mx-auto">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>
</c:if>


<c:if test="${report.status=='Finally Closed'}">
<button value="submit" id="" class="btn btn-primary mx-auto">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>
</c:if>

<%-- <c:if test="${report.status=='Reject by Approver'}">
<button value="submit" id="" class="btn btn-primary mx-auto">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>                             
</c:if> --%>
</c:if>

<c:if test="${role =='ADMIN'}"> 
<%-- <c:if test="${report.status=='Return By Approver'}">
<button value="submit" id="" class="btn btn-primary mx-auto">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>
</c:if>
 --%>
<c:if test="${report.status=='Rejected by HR'}">
<button value="submit" id="" class="btn btn-primary mx-auto">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>
</c:if>


<c:if test="${report.status=='Sent To Requester'}">
<button value="submit" id="" class="btn btn-primary mx-auto">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>
</c:if>


<c:if test="${report.status=='Reject by Reporting Manager'}">
<button value="submit" id="" class="btn btn-primary mx-auto">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>
</c:if>


<c:if test="${report.status=='Return By Reporting Manager'}">
<button value="submit" id="" class="btn btn-primary mx-auto">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>
</c:if>

<c:if test="${report.status=='Return by HR'}">
<button value="submit" id="" class="btn btn-primary mx-auto">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>
</c:if>

<c:if test="${report.status=='Finally Closed'}">
<button value="submit" id="" class="btn btn-primary mx-auto">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>
</c:if>

<c:if test="${report.status=='partially select'}">
<button value="submit" id="" class="btn btn-primary mx-auto">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>
</c:if>

<%-- <c:if test="${report.status=='Reject by Approver'}">
<button value="submit" id="" class="btn btn-primary mx-auto">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>
</c:if> --%>

<c:if test="${report.status=='Approved'}">
<button value="submit" id="" class="btn btn-primary mx-auto">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>
</c:if>

<c:if test="${report.status=='Partially update'}">
<button value="submit" id="" class="btn btn-primary mx-auto">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>
</c:if>

<c:if test="${report.status=='Closed'}">
<button value="submit" id="" class="btn btn-primary mx-auto">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>
</c:if>


<c:if test="${report.status=='Sent To HR(ON HOLD)'}">
<button value="submit" id="" class="btn btn-primary mx-auto">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>
</c:if>

<c:if test="${report.status=='Partially Closed'}">
<button value="submit" id="" class="btn btn-primary mx-auto">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Close</a></span>
<div class="row"></div></button>
</c:if>
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

 <!--  <script>
function calculate() {

var btn = document.getElementsByClassName('form-control');

for (i = 0; i < btn.length; i++) {

if (document.getElementById('5_Mouse') != null) {

var myBox1 = document.getElementById('5_Mouse').value;
var myBox2 = document.getElementById('6_Mouse').value;

var myResult = myBox1 * myBox2;
document.getElementById('7_Mouse').value = myResult;
}

if (document.getElementById('5_Laptop') != null) {

var myBoxval1 = document.getElementById('5_Laptop').value;

var myBoxval2 = document.getElementById('6_Laptop').value;

var myResult1 = myBoxval1 * myBoxval2;

document.getElementById('7_Laptop').value = myResult1;
}

if (document.getElementById('5_Keyboard') != null) {
var myBoxval3 = document.getElementById('5_Keyboard').value;
var myBoxval4 = document.getElementById('6_Keyboard').value;

var myResult2 = myBoxval3 * myBoxval4;

document.getElementById('7_Keyboard').value = myResult2;
}
if (document.getElementById('5_Wire') != null) {
var myBoxval5 = document.getElementById('5_Wire').value;
var myBoxval6 = document.getElementById('6_Wire').value;

var myResult3 = myBoxval5 * myBoxval6;

document.getElementById('7_Wire').value = myResult3;
}
if (document.getElementById('5_Monitor') != null) {
var myBoxval5 = document.getElementById('5_Monitor').value;
var myBoxval6 = document.getElementById('6_Monitor').value;

var myResult3 = myBoxval5 * myBoxval6;

document.getElementById('7_Monitor').value = myResult3;
}
}

}
</script>

<script>
$(function() {

$("#validDept").hide();
$("#validDesk").hide();
$("#validRemarks").hide();
$("#8_Mouse").hide();
$("#9_Mouse").hide();
$("#8_Keyborad").hide();
$("#9_Keyborad").hide();
$("#8_Laptop").hide();
$("#9_Laptop").hide();
$("#8_Wire").hide();
$("#9_Wire").hide();

$("#8_Monitor").hide();
$("#9_Monitor").hide();
$("#10_Mouse").hide();
$("#10_Keyborad").hide();
$("#10_Laptop").hide();
$("#10_Wire").hide();
$("#10_Monitor").hide();
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



$("#15_Monitor").hide();
$("#17_Monitor").hide();
$("#19_Monitor").hide();
$("#21_Monitor").hide();

$("#13_Mouse").hide();
$("#13_Keyboard").hide();
$("#13_Laptop").hide();
$("#13_Wire").hide();
$("#13_Monitor").hide();
$("#31_Mouse").hide();
$("#31_Keyboard").hide();
$("#31_Laptop").hide();
$("#31_Wire").hide();
$("#31_Monitor").hide();

$("#33_Mouse").hide();
$("#33_Keyboard").hide();
$("#33_Laptop").hide();
$("#33_Wire").hide();
$("#33_Monitor").hide();

            $("#81_Mouse").hide();
$("#81_Keyboard").hide();
$("#81_Laptop").hide();
$("#81_Wire").hide();
$("#81_Monitor").hide();
var error_fname = false;
var error_deptdesk = false;
var error_remarks = false;
var error_price = false;
var error_quantity = false;
var error_supplier = false;
var error_date = false;
var error_model = false;
var error_serial = false;
var error_condition = false;
var error_description = false;
var error_warrentyexpiration = false;
var error_information=false;
var error_issuedate=false;
var error_tag=false;

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
$("#5_Monitor").focusout(function() {
check_priceMonitor();
});
$("#6_Monitor").focusout(function() {
check_quantityMonitor();
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
$("#3_Monitor").focusout(function() {
check_supplierMonitor();
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
$("#11_Monitor").focusout(function() {
check_dateMonitor();
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


$("#14_Monitor").focusout(function() {
check_modelMonitor();
});
$("#16_Monitor").focusout(function() {
check_serialMonitor();
});
$("#18_Monitor").focusout(function() {
check_conditionMonitor();
});
$("#20_Monitor").focusout(function() {
check_descriptionMonitor();
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
$("#4_Monitor").focusout(function() {
check_warrentyExpirationMonitor();
});
           


$("#30_Mouse").focusout(function() {
check_informationMouse();
});
$("#30_Keyboard").focusout(function() {
check_informationKeyboard();
});
$("#30_Laptop").focusout(function() {
check_informationLaptop();
});

$("#30_Wire").focusout(function() {
check_informationWire();
});
$("#30_Monitor").focusout(function() {
check_informationMonitor();
});



$("#32_Mouse").focusout(function() {
check_issuedateMouse();
});

$("#32_Keyboard").focusout(function() {
check_issuedateKeyboard();
});
$("#32_Laptop").focusout(function() {
check_issuedateLaptop();
});
$("#32_Wire").focusout(function() {
check_issuedateWire();
});
$("#32_Monitor").focusout(function() {
check_issuedateMonitor();
});



$("#80_Mouse").focusout(function() {
check_tagMouse();
});
$("#80_Keyboard").focusout(function() {
check_tagKeyboard();
});
$("#80_Laptop").focusout(function() {
check_tagLaptop();
});
$("#80_Wire").focusout(function() {
check_tagWire();
});
$("#80_Monitor").focusout(function() {
check_tagMonitor();
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

var remark = $("#remarks").val();
if (remark === '') {
$("#validRemarks").html("**Enter Remarks**");
$("#validRemarks").show();

error_remarks = true;
} else {
if (remark !== '')

$("#validRemarks").hide();

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


function check_priceMonitor() {

var fname = $("#5_Monitor").val();
if (fname !== '') {
$("#8_Monitor").hide();

} else {
if (fname === '') {
$("#8_Monitor").html("Enter Price");
$("#8_Monitor").show();

error_price = true;
}

}
}
function check_quantityMonitor() {

var fname = $("#6_Monitor").val();
if (fname !== '') {
$("#9_Monitor").hide();

} else {
if (fname === '') {
$("#9_Monitor").html("Enter Quantity");
$("#9_Monitor").show();

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


function check_supplierMonitor() {

var fname = $("#3_Monitor").val();
if (fname !== '') {
$("#10_Monitor").hide();

} else {
if (fname === '') {
$("#10_Monitor").html("Enter Supplier");
$("#10_Monitor").show();

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
if (fname !== '') 
  {
$("#12_Wire").hide();
 
} 
else {
if (fname === '') {
$("#12_Wire").html("Enter Date");
$("#12_Wire").show();

error_date = true;
}

}
}



function check_dateMonitor() {

var fname = $("#11_Monitor").val();
if (fname !== '') 
  {
$("#12_Monitor").hide();
 
} 
else {
if (fname === '') {
$("#12_Monitor").html("Enter Date");
$("#12_Monitor").show();

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





function check_modelMonitor() {

var fname = $("#14_Monitor").val();
if (fname !== '') {
$("#15_Monitor").hide();

} else {
if (fname === '') {
$("#15_Monitor").html("Enter Model No.");
$("#15_Monitor").show();

error_model = true;
}

}
}

function check_serialMonitor() {

var fname = $("#16_Monitor").val();
if (fname !== '') {
$("#17_Monitor").hide();

} else {
if (fname === '') {
$("#17_Monitor").html("Enter Serial No.");
$("#17_Monitor").show();

error_serial = true;
}

}
}

function check_conditionMonitor() {

var fname = $("#18_Monitor").val();
if (fname !== '') {
$("#19_Monitor").hide();

} else {
if (fname === '') {
$("#19_Monitor").html("Enter Condition");
$("#19_Monitor").show();

error_condition = true;
}

}
}
function check_descriptionMonitor() {

var fname = $("#20_Monitor").val();
if (fname !== '') {
$("#21_Monitor").hide();

} else {
if (fname === '') {
$("#21_Monitor").html("Enter Descriptions");
$("#21_Monitor").show();

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
$("#19_Wire").html("Enter Condition");
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
$("#21_Wire").html("Enter Description");
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



function check_warrentyExpirationMonitor() {

var fname = $("#4_Monitor").val();
if (fname !== '') {
$("#13_Monitor").hide();

} else {
if (fname === '') {
$("#13_Monitor").html("Enter Warrenty Expiration");
$("#13_Monitor").show();

error_warrentyexpiration = true;
}

}
}
function check_informationMouse() {

var fname = $("#30_Mouse").val();

                
                
if (fname !== '') {
$("#31_Mouse").hide();

} else {
if (fname === '') {
$("#31_Mouse").html("Enter information");
$("#31_Mouse").show();

error_information = true;
}

}
} 



function check_informationLaptop() {

var fname = $("#30_Laptop").val();

                
if (fname !== '') {
$("#31_Laptop").hide();

} else {
if (fname === '') {
$("#31_Laptop").html("Enter information");
$("#31_Laptop").show();

error_information = true;
}

}
} 

function check_informationKeyboard() {

var fname = $("#30_Keyboard").val();

               
                
if (fname !== '') {
$("#31_Keyboard").hide();

} else {
if (fname === '') {
$("#31_Keyboard").html("Enter information");
$("#31_Keyboard").show();

error_information = true;
}

}
} 

function check_informationWire() {

var fname = $("#30_Wire").val();

                
                 
if (fname !== '') {
$("#31_Wire").hide();

} else {
if (fname === '') {
$("#31_Wire").html("Enter information");
$("#31_Wire").show();

error_information = true;
}

}
}


function check_informationMonitor() {

var fname = $("#30_Monitor").val();

                

if (fname !== '') {
$("#31_Monitor").hide();

} else {
if (fname === '') {
$("#31_Monitor").html("Enter information");
$("#31_Monitor").show();

error_information = true;
}

}
}





function check_issuedateMouse() {

var fname = $("#32_Mouse").val();
if (fname !== '') {
$("#33_Mouse").hide();

} else {
if (fname === '') {
$("#33_Mouse").html("Enter issuedate");
$("#33_Mouse").show();

error_issuedate = true;
}

}
}

function check_issuedateKeyboard() {

var fname = $("#32_Keyboard").val();
if (fname !== '') {
$("#33_Keyboard").hide();

} else {
if (fname === '') {
$("#33_Keyboard").html("Enter issuedate");
$("#33_Keyboard").show();

error_issuedate = true;
}

}
}
function check_issuedateLaptop() {

var fname = $("#32_Laptop").val();
if (fname !== '') {
$("#33_Laptop").hide();

} else {
if (fname === '') {
$("#33_Laptop").html("Enter issuedate");
$("#33_Laptop").show();

error_issuedate = true;
}

}
}
function check_issuedateWire() {

var fname = $("#32_Wire").val();
if (fname !== '') {
$("#33_Wire").hide();

} else {
if (fname === '') {
$("#33_Wire").html("Enter issuedate");
$("#33_Wire").show();

error_issuedate = true;
}

}
}

function check_issuedateMonitor() {

var fname = $("#32_Monitor").val();
if (fname !== '') {
$("#33_Monitor").hide();

} else {
if (fname === '') {
$("#33_Monitor").html("Enter issuedate");
$("#33_Monitor").show();

error_issuedate = true;
}

}
}


function check_tagMouse() {

var fname = $("#80_Mouse").val();

                
                
if (fname !== '') {
$("#81_Mouse").hide();

} else {
if (fname === '') {
$("#81_Mouse").html("Enter Tag Name");
$("#81_Mouse").show();

error_tag = true;
}

}
} 



function check_tagLaptop() {

var fname = $("#80_Laptop").val();

                
if (fname !== '') {
$("#81_Laptop").hide();

} else {
if (fname === '') {
$("#81_Laptop").html("Enter Tag Name");
$("#81_Laptop").show();

error_tag = true;
}

}
} 

function check_tagKeyboard() {

var fname = $("#80_Keyboard").val();

               
                
if (fname !== '') {
$("#81_Keyboard").hide();

} else {
if (fname === '') {
$("#81_Keyboard").html("Enter Tag Name");
$("#81_Keyboard").show();

error_tag = true;
}

}
} 

function check_tagWire() {

var fname = $("#80_Wire").val();

                
                 
if (fname !== '') {
$("#81_Wire").hide();

} else {
if (fname === '') {
$("#81_Wire").html("Enter Tag Name");
$("#81_Wire").show();

error_tag = true;
}

}
}


function check_tagMonitor() {

var fname = $("#80_Monitor").val();

                

if (fname !== '') {
$("#81_Monitor").hide();

} else {
if (fname === '') {
$("#81_Monitor").html("Enter Tag Name");
$("#81_Monitor").show();

error_tag = true;
}

}
}




$("#trxForm").submit(
function() {
var statuid = $("#statuid").val();
var mouseval = $("#30_Mouse").val();
var Laptopval = $("#30_Laptop").val();
var Keyboardval = $("#30_Keyboard").val();
var Wireval = $("#30_Wire").val();
var Monitorval = $("#30_Monitor").val();
if ((mouseval == 'Not available'|| Laptopval == 'Not available'|| Keyboardval == 'Not available'|| Wireval == 'Not available' || Monitorval == 'Not available'  ) && statuid == 'Approved') {
error_remarks = false;

check_remark();
if (error_remarks == false) {

return true;
} else {
swal("Sorry!",
"Please Fill The Form Correctly",
"error");
return false;
}
}



 
 
else if ( statuid == 'Approved' ) {
error_fname = false;
error_deptdesk = false;
error_remarks = false;
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
error_information = false;
error_issuedate=false;
error_tag=false;
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


check_priceMonitor();
check_quantityMonitor();

check_dateMouse();
check_dateKey();
check_dateLap();
check_dateWire();
check_dateMonitor();
check_suppliermouse();
check_supplierkey();
check_supplierLap();
check_supplierwire();
check_supplierMonitor();
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
                          
check_modelMonitor();
check_serialMonitor();
check_conditionMonitor();
check_descriptionMonitor();
check_warrentyExpirationMouse();
check_warrentyExpirationKey();
check_warrentyExpirationLap();
check_warrentyExpirationWire();
check_warrentyExpirationMonitor();
check_informationMouse();
check_informationLaptop();
check_informationKeyboard();
check_informationWire();
check_informationMonitor();

check_issuedateMouse();
check_issuedateKeyboard();
check_issuedateLaptop();
/* check_issuedateWire(); */
check_issuedateWire();
check_issuedateMonitor();


check_tagMouse();
check_tagKeyboard();
check_tagLaptop();
check_tagWire();
check_tagMonitor();
if (error_fname === false
&& error_deptdesk == false
&& error_remarks == false
&& error_price === false
&& error_quantity === false
&& error_supplier === false
&& error_date === false
&& error_model === false
&& error_serial === false
&& error_condition === false
&& error_description === false
&& error_warrentyexpiration === false
&& error_information === false
&&  error_issuedate === false
&&  error_tag === false) {

return true;
} else {
swal("Sorry!",
"Please Fill The Form Correctly",
"error");
return false;
}
}




if (statuid != 'Approved') {
error_remarks = false;

check_remark();
if (error_remarks == false) {

return true;
} else {
swal("Sorry!",
"Please Fill The Form Correctly",
"error");
return false;
}
}
});
});

function check(){
var flag=0;
var mouseval = $("#30_Mouse").val();
var Laptopval = $("#30_Laptop").val();
var Keyboardval = $("#30_Keyboard").val();
var Wireval = $("#30_Wire").val();
var Monitorval = $("#30_Monitor").val();
var isavailable = $("#sts").val();
if (mouseval == 'Not available'|| Laptopval == 'Not available'|| Keyboardval == 'Not available'|| Wireval == 'Not available' || Monitorval == 'Not available' ) 
{
flag=1;
$("#sts").val('Not available');

if(flag==1)
{
$("#flagg").hide();
$("#not").show(); 
}
} 
else if(mouseval == 'Available'|| Laptopval == 'Available'|| Keyboardval == 'Available'|| Wireval == 'Available' || Monitorval ==  'Available')
{
flag=0;
$("#sts").val('Available');
if(flag==0)
{
$("#flagg").show();
$("#not").hide(); 
}
}

return flag;
}




 function checkinfo(){
var mouseval = $("#30_Mouse").val();
var Laptopval = $("#30_Laptop").val();
var Keyboardval = $("#30_Keyboard").val();
var Wireval = $("#30_Wire").val();
var Monitorval = $("#30_Monitor").val();
var isavailable = $("#sws").val();


       if(mouseval  == isavailable)
           {
      $("#14_Mouse").attr('readonly', 'readonly');
    
$("#16_Mouse").attr('readonly', 'readonly');

$("#18_Mouse").attr('readonly', 'readonly');
$("#20_Mouse").attr('readonly', 'readonly');
$("#11_Mouse").attr('readonly', 'readonly');

$("#3_Mouse").attr('readonly', 'readonly');
  $("#32_Mouse").attr('readonly', 'readonly');
$("#4_Mouse").attr('readonly', 'readonly');

$("#80_Mouse").attr('readonly', 'readonly');

/* $("#60_Mouse").attr('readonly', 'readonly');
$("#62_Mouse").attr('readonly', 'readonly'); */
/* $("#66_Mouse").attr('readonly', 'readonly');
$("#68_Mouse").attr('readonly', 'readonly'); */


$("#5_Mouse").attr('readonly', 'readonly');

$("#6_Mouse").attr('readonly', 'readonly');

           }

       if(Laptopval  == isavailable)
       {
  $("#14_Laptop").attr('readonly', 'readonly');

       $("#16_Laptop").attr('readonly', 'readonly');


$("#18_Laptop").attr('readonly', 'readonly');
  

$("#20_Laptop").attr('readonly', 'readonly');
 
$("#11_Laptop").attr('readonly', 'readonly');

$("#3_Laptop").attr('readonly', 'readonly');

  $("#32_Laptop").attr('readonly', 'readonly');


$("#4_Laptop").attr('readonly', 'readonly');

$("#80_Laptop").attr('readonly', 'readonly');

/* $("#60_Laptop").attr('readonly', 'readonly');


$("#62_Laptop").attr('readonly', 'readonly'); */

/* $("#66_Laptop").attr('readonly', 'readonly');


$("#68_Laptop").attr('readonly', 'readonly');
 */


$("#5_Laptop").attr('readonly', 'readonly');
$("#6_Laptop").attr('readonly', 'readonly');

} 



       if(Keyboardval  == isavailable)
       {
  $("#14_Keyboard").attr('readonly', 'readonly');
       

       $("#16_Keyboard").attr('readonly', 'readonly');
  
$("#18_Keyboard").attr('readonly', 'readonly');
  
$("#20_Keyboard").attr('readonly', 'readonly');
    
$("#11_Keyboard").attr('readonly', 'readonly');

$("#3_Keyboard").attr('readonly', 'readonly');

  $("#32_Keyboard").attr('readonly', 'readonly');


$("#4_Keyboard").attr('readonly', 'readonly');

$("#80_Keyboard").attr('readonly', 'readonly');

/*  $("#60_Keyboard").attr('readonly', 'readonly');


$("#62_Keyboard").attr('readonly', 'readonly'); */


/* $("#66_Keyboard").attr('readonly', 'readonly');


$("#68_Keyboard").attr('readonly', 'readonly');
 */
$("#5_Keyboard").attr('readonly', 'readonly');

$("#6_Keyboard").attr('readonly', 'readonly');

} 



       if(Wireval  == isavailable)
       {
  $("#14_Wire").attr('readonly', 'readonly');
       

       $("#16_Wire").attr('readonly', 'readonly');
 

$("#18_Wire").attr('readonly', 'readonly');
  
$("#20_Wire").attr('readonly', 'readonly');

$("#11_Wire").attr('readonly', 'readonly');


$("#3_Wire").attr('readonly', 'readonly');

  $("#32_Wire").attr('readonly', 'readonly');


$("#4_Wire").attr('readonly', 'readonly');

$("#80_Wire").attr('readonly', 'readonly');

/*  $("#60_Wire").attr('readonly', 'readonly');


$("#62_Wire").attr('readonly', 'readonly'); */

/*  $("#66_Wire").attr('readonly', 'readonly');


$("#68_Wire").attr('readonly', 'readonly');
 */

$("#5_Wire").attr('readonly', 'readonly');

$("#6_Wire").attr('readonly', 'readonly');
}  




       if(Monitorval  == isavailable)
       {
  $("#14_Monitor").attr('readonly', 'readonly');

$("#16_Monitor").attr('readonly', 'readonly');


$("#18_Monitor").attr('readonly', 'readonly');

$("#20_Monitor").attr('readonly', 'readonly');

$("#11_Monitor").attr('readonly', 'readonly');


$("#3_Monitor").attr('readonly', 'readonly');
  $("#32_Monitor").attr('readonly', 'readonly');
$("#4_Monitor").attr('readonly', 'readonly');

$("#80_Monitor").attr('readonly', 'readonly');

/*  $("#60_Monitor").attr('readonly', 'readonly');
$("#62_Monitor").attr('readonly', 'readonly');
 */


/* $("#66_Monitor").attr('readonly', 'readonly');
$("#68_Monitor").attr('readonly', 'readonly');
*/

$("#5_Monitor").attr('readonly', 'readonly');


$("#6_Monitor").attr('readonly', 'readonly');

       } 


         if(mouseval  != isavailable)
       {
  $("#14_Mouse").removeAttr("readonly");
  $("#15_Mouse").html("");
$("#15_Mouse").show(); 



$("#16_Mouse").removeAttr("readonly");
    $("#17_Mouse").html("");
$("#17_Mouse").show();

$("#18_Mouse").removeAttr("readonly");
      $("#19_Mouse").html("");
$("#19_Mouse").show();

$("#20_Mouse").removeAttr("readonly");
    $("#21_Mouse").html("");
$("#21_Mouse").show();
$("#11_Mouse").removeAttr("readonly");
   $("#12_Mouse").html("");
$("#12_Mouse").show();

$("#3_Mouse").removeAttr("readonly");
   $("#10_Mouse").html("");
   $("#10_Mouse").show();

  $("#32_Mouse").removeAttr("readonly");
 $("#33_Mouse").html("");
$("#33_Mouse").show();

$("#80_Mouse").removeAttr("readonly");
 $("#81_Mouse").html("");
$("#81_Mouse").show();
$("#4_Mouse").removeAttr("readonly");
$("#13_Mouse").html("");
$("#13_Mouse").show();

/*  $("#60_Mouse").removeAttr("readonly");
 $("#61_Mouse").html("");
$("#61_Mouse").show();

$("#62_Mouse").removeAttr("readonly");
$("#63_Mouse").html("");
$("#63_Mouse").show(); */

/* $("#66_Mouse").removeAttr("readonly"); */
/*  $("#67_Mouse").html("");
$("#67_Mouse").show(); */

/* $("#68_Mouse").removeAttr("readonly"); */
/* $("#69_Mouse").html("");
$("#69_Mouse").show();  */

$("#5_Mouse").removeAttr("readonly");
 $("#8_Mouse").html("");
$("#8_Mouse").show();

$("#6_Mouse").removeAttr("readonly");
$("#9_Mouse").html("");
$("#9_Mouse").show();
       }






        if(Laptopval  != isavailable)
        {
    $("#14_Laptop").removeAttr("readonly");
    $("#15_Laptop").html("");
  $("#15_Laptop").show(); 



  $("#16_Laptop").removeAttr("readonly");
    $("#17_Laptop").html("");
  $("#17_Laptop").show();

  $("#18_Laptop").removeAttr("readonly");
      $("#19_Laptop").html("");
  $("#19_Laptop").show();

  $("#20_Laptop").removeAttr("readonly");
      $("#21_Laptop").html("");
  $("#21_Laptop").show();
  
  $("#11_Laptop").removeAttr("readonly");
     $("#12_Laptop").html("");
  $("#12_Laptop").show();

  $("#3_Laptop").removeAttr("readonly");
     $("#10_Laptop").html("");
     $("#10_Laptop").show();

    $("#32_Laptop").removeAttr("readonly");
   $("#33_Laptop").html("");
  $("#33_Laptop").show();


  $("#80_Laptop").removeAttr("readonly");
 $("#81_Laptop").html("");
$("#81_Laptop").show();

  $("#4_Laptop").removeAttr("readonly");
  $("#13_Laptop").html("");
  $("#13_Laptop").show();




  /* $("#60_Laptop").removeAttr("readonly");
 $("#61_Laptop").html("");
$("#61_Laptop").show();

$("#62_Laptop").removeAttr("readonly");
$("#63_Laptop").html("");
$("#63_Laptop").show(); */




/* $("#66_Laptop").removeAttr("readonly");
 $("#67_Laptop").html("");
$("#67_Laptop").show();

$("#68_Laptop").removeAttr("readonly");
$("#69_Laptop").html("");
$("#69_Laptop").show();
 */
  $("#5_Laptop").removeAttr("readonly");
   $("#8_Laptop").html("");
  $("#8_Laptop").show();

  $("#6_Laptop").removeAttr("readonly");
  $("#9_Laptop").html("");
  $("#9_Laptop").show();
  
        }




        if(Keyboardval  != isavailable)
        {
    $("#14_Keyboard").removeAttr("readonly");
    $("#15_Keyboard").html("");
  $("#15_Keyboard").show(); 



  $("#16_Keyboard").removeAttr("readonly");
    $("#17_Keyboard").html("");
  $("#17_Keyboard").show();

  $("#18_Keyboard").removeAttr("readonly");
      $("#19_Keyboard").html("");
  $("#19_Keyboard").show();

  $("#20_Keyboard").removeAttr("readonly");
      $("#21_Keyboard").html("");
  $("#21_Keyboard").show();
  
  $("#11_Keyboard").removeAttr("readonly");
     $("#12_Keyboard").html("");
  $("#12_Keyboard").show();

  $("#3_Keyboard").removeAttr("readonly");
     $("#10_Keyboard").html("");
     $("#10_Keyboard").show();

    $("#32_Keyboard").removeAttr("readonly");
   $("#33_Keyboard").html("");
  $("#33_Keyboard").show();


  $("#80_Keyboard").removeAttr("readonly");
 $("#81_Keyboard").html("");
$("#81_Keyboard").show();

  $("#4_Keyboard").removeAttr("readonly");
  $("#13_Keyboard").html("");
  $("#13_Keyboard").show();




  /*  $("#60_Keyboard").removeAttr("readonly");
 $("#61_Keyboard").html("");
$("#61_Keyboard").show();

$("#62_Keyboard").removeAttr("readonly");
$("#63_Keyboard").html("");
$("#63_Keyboard").show(); */


/* $("#66_Keyboard").removeAttr("readonly");
 $("#67_Keyboard").html("");
$("#67_Keyboard").show();

$("#68_Keyboard").removeAttr("readonly");
$("#69_Keyboard").html("");
$("#69_Keyboard").show(); */


  $("#5_Keyboard").removeAttr("readonly");
   $("#8_Keyboard").html("");
  $("#8_Keyboard").show();

  $("#6_Keyboard").removeAttr("readonly");
  $("#9_Keyboard").html("");
  $("#9_Keyboard").show();
  
        }



        if(Wireval  != isavailable)
        {
    $("#14_Wire").removeAttr("readonly");
    $("#15_Wire").html("");
  $("#15_Wire").show(); 



  $("#16_Wire").removeAttr("readonly");
    $("#17_Wire").html("");
  $("#17_Wire").show();

  $("#18_Wire").removeAttr("readonly");
      $("#19_Wire").html("");
  $("#19_Wire").show();

  $("#20_Wire").removeAttr("readonly");
      $("#21_Wire").html("");
  $("#21_Wire").show();
  
  $("#11_Wire").removeAttr("readonly");
     $("#12_Wire").html("");
  $("#12_Wire").show();

  $("#3_Wire").removeAttr("readonly");
     $("#10_Wire").html("");
     $("#10_Wire").show();

    $("#32_Wire").removeAttr("readonly");
   $("#33_Wire").html("");
  $("#33_Wire").show();


  $("#80_Wire").removeAttr("readonly");
 $("#81_Wire").html("");
$("#81_Wire").show();

  $("#4_Wire").removeAttr("readonly");
  $("#13_Wire").html("");
  $("#13_Wire").show();



/* 
  $("#60_Wire").removeAttr("readonly");
 $("#61_Wire").html("");
$("#61_Wire").show();

$("#62_Wire").removeAttr("readonly");
$("#63_Wire").html("");
$("#63_Wire").show(); */


 /* $("#66_Wire").removeAttr("readonly"); */
/*   $("#67_Wire").html("");
$("#67_Wire").show(); */

/* $("#68_Wire").removeAttr("readonly"); */
/* $("#69_Wire").html("");
$("#69_Wire").show();  */


  $("#5_Wire").removeAttr("readonly");
   $("#8_Wire").html("");
  $("#8_Wire").show();

  $("#6_Wire").removeAttr("readonly");
  $("#9_Wire").html("");
  $("#9_Wire").show();
  
        }





         if(Monitorval  != isavailable)
        {
    $("#14_Monitor").removeAttr("readonly");
    $("#15_Monitor").html("");
  $("#15_Monitor").show(); 



  $("#16_Monitor").removeAttr("readonly");
    $("#17_Monitor").html("");
  $("#17_Monitor").show();

  $("#18_Monitor").removeAttr("readonly");
      $("#19_Monitor").html("");
  $("#19_Monitor").show();

  $("#20_Monitor").removeAttr("readonly");
      $("#21_Monitor").html("");
  $("#21_Monitor").show();
  
  $("#11_Monitor").removeAttr("readonly");
     $("#12_Monitor").html("");
  $("#12_Monitor").show();

  $("#3_Monitor").removeAttr("readonly");
     $("#10_Monitor").html("");
     $("#10_Monitor").show();

    $("#32_Monitor").removeAttr("readonly");
   $("#33_Monitor").html("");
  $("#33_Monitor").show();



  $("#80_Monitor").removeAttr("readonly");
 $("#81_Monitor").html("");
$("#81_Monitor").show();
  $("#4_Monitor").removeAttr("readonly");
  $("#13_Monitor").html("");
  $("#13_Monitor").show();



  /*  $("#60_Monitor").removeAttr("readonly");
 $("#61_Monitor").html("");
$("#61_Monitor").show();

$("#62_Monitor").removeAttr("readonly");
$("#63_Monitor").html("");
$("#63_Monitor").show(); */

  /*  $("#66_Monitor").removeAttr("readonly");
 $("#67_Monitor").html("");
$("#67_Monitor").show();

$("#68_Monitor").removeAttr("readonly");
$("#69_Monitor").html("");
$("#69_Monitor").show(); */
  


  


  $("#5_Monitor").removeAttr("readonly");
   $("#8_Monitor").html("");
  $("#8_Monitor").show();

  $("#6_Monitor").removeAttr("readonly");
  $("#9_Monitor").html("");
  $("#9_Monitor").show();
  
        } 
         
}


 function checkinfoAvailable(){
var mouseval = $("#30_Mouse").val();
var Laptopval = $("#30_Laptop").val();
var Keyboardval = $("#30_Keyboard").val();
var Wireval = $("#30_Wire").val();
var Monitorval = $("#30_Monitor").val();
        var mousemodelno=$("#14_Mouse").val();
        var mouseserialno=$("#16_Mouse").val();
        var mousetag=$("#80_Mouse").val();
        var mousecondition=$("#18_Mouse").val();
        var mousedescription=$("#20_Mouse").val();
        
        var mousepdate=$("#11_Mouse").val();
        var mousesupplier=$("#3_Mouse").val();
        var mouseissuedate=$("#32_Mouse").val();
        var mousewarranty=$("#4_Mouse").val();

        var mouseunitprice=$("#5_Mouse").val();
        var mousequantity=$("#6_Mouse").val();
        
if(mouseval  == 'Available' && (mousemodelno==" " && mouseserialno==" " && mousetag == " " && mousecondition == " "  && mousedescription == " " &&
mousepdate == '' && mousequantity == 0  && mouseunitprice== 0 &&  mouseissuedate == ''
 &&  mousewarranty == ''  &&  mousesupplier == " "))
      {
     
$("#15_Mouse").html("Enter Model No.");
$("#15_Mouse").show(); 

      
 $("#17_Mouse").html("Enter Serial No.");
$("#17_Mouse").show();

$("#81_Mouse").html("Enter Tag Name");
$("#81_Mouse").show();

$("#19_Mouse").html("Enter Condition");
$("#19_Mouse").show();

$("#21_Mouse").html("Enter Description");
$("#21_Mouse").show();


 $("#12_Mouse").html("Enter Procurement Date");
$("#12_Mouse").show();

$("#8_Mouse").html("Enter Unit Price");
$("#8_Mouse").show();


$("#33_Mouse").html("Enter Issue Date");
$("#33_Mouse").show();

$("#13_Mouse").html("Enter Warranty Expiration");
$("#13_Mouse").show();


$("#9_Mouse").html("Enter Quantity");
$("#9_Mouse").show(); 

$("#10_Mouse").html("Enter Supplier");
$("#10_Mouse").show();

      }

      
    


 var laptopmodelno=$("#14_Laptop").val();
       var laptopserialno=$("#16_Laptop").val();
       var laptoptag=$("#80_Laptop").val();
       var laptopcondition=$("#18_Laptop").val();
       var laptopdescription=$("#20_Laptop").val();
       
       var laptoppdate=$("#11_Laptop").val();
       var laptopsupplier=$("#3_Laptop").val();
       var laptopissuedate=$("#32_Laptop").val();
       var laptopwarranty=$("#4_Laptop").val();

       var laptopunitprice=$("#5_Laptop").val();
       var laptopquantity=$("#6_Laptop").val();

if(Laptopval  == 'Available' && (laptopmodelno==" " && laptopserialno==" " && laptoptag == " "  && laptopcondition == " "  && laptopdescription == " " && laptoppdate ==''
&&  laptopsupplier == " " &&  laptopissuedate =='' && laptopwarranty =='' && laptopunitprice==0 && laptopquantity ==0))
      {
     
$("#15_Laptop").html("Enter Model No.");
$("#15_Laptop").show(); 


$("#17_Laptop").html("Enter Serial No.");
$("#17_Laptop").show();



$("#81_Laptop").html("Enter Tag Name");
$("#81_Laptop").show();
$("#19_Laptop").html("Enter Condition");
$("#19_Laptop").show();

$("#21_Laptop").html("Enter Description");
$("#21_Laptop").show();

$("#12_Laptop").html("Enter Procurement Date");
$("#12_Laptop").show();



$("#10_Laptop").html("Enter Supplier");
$("#10_Laptop").show();

$("#33_Laptop").html("Enter Issue Date");
$("#33_Laptop").show();

$("#13_Laptop").html("Enter Warranty Expiration");
$("#13_Laptop").show();

$("#8_Laptop").html("Enter Unit Price");
$("#8_Laptop").show();


$("#9_Laptop").html("Enter Quantity");
$("#9_Laptop").show();

      } 


var keyboardmodelno=$("#14_Keyboard").val();
       var keyboardserialno=$("#16_Keyboard").val();
       var keyboardtag=$("#80_Keyboard").val();
       var keyboardcondition=$("#18_Keyboard").val();
       var keyboarddescription=$("#20_Keyboard").val();
       
       var keyboardpdate=$("#11_Keyboard").val();
       var keyboardsupplier=$("#3_Keyboard").val();
       var keyboardissuedate=$("#32_Keyboard").val();
       var keyboardwarranty=$("#4_Keyboard").val();

       var keyboardunitprice=$("#5_Keyboard").val();
       var keyboardquantity=$("#6_Keyboard").val();

if(Keyboardval  == 'Available'  && (keyboardmodelno==" " && keyboardserialno==" " && keyboardtag==" "  && keyboardcondition == " "  && keyboarddescription == " " && keyboardpdate ==''
&&  keyboardsupplier == " " &&  keyboardissuedate =='' && keyboardwarranty =='' && keyboardunitprice==0 && keyboardquantity ==0))
      {
    
$("#15_Keyboard").html("Enter Model No.");
$("#15_Keyboard").show(); 


$("#17_Keyboard").html("Enter Serial No.");
$("#17_Keyboard").show();

$("#81_Keyboard").html("Enter Tag Name");
$("#81_Keyboard").show();

$("#19_Keyboard").html("Enter Condition");
$("#19_Keyboard").show();

$("#21_Keyboard").html("Enter Description");
$("#21_Keyboard").show();

$("#12_Keyboard").html("Enter Procurement Date");
$("#12_Keyboard").show();



$("#10_Keyboard").html("Enter Supplier");
$("#10_Keyboard").show();

$("#33_Keyboard").html("Enter Issue Date");
$("#33_Keyboard").show();

$("#13_Keyboard").html("Enter Warranty Expiration");
$("#13_Keyboard").show();

$("#8_Keyboard").html("Enter Unit Price");
$("#8_Keyboard").show();


$("#9_Keyboard").html("Enter Quantity");
$("#9_Keyboard").show();

      } 



var wiremodelno=$("#14_Wire").val();
        var wireserialno=$("#16_Wire").val();
        var wiretag=$("#80_Wire").val();
        var wirecondition=$("#18_Wire").val();
        var wiredescription=$("#20_Wire").val();
        
        var wirepdate=$("#11_Wire").val();
        var wiresupplier=$("#3_Wire").val();
        var wireissuedate=$("#32_Wire").val();
        var wirewarranty=$("#4_Wire").val();

        var wireunitprice=$("#5_Wire").val();
        var wirequantity=$("#6_Wire").val();


if(Wireval  == 'Available'  && (wiremodelno==" " && wireserialno==" "  && wiretag==" "  && wirecondition == " "  && wiredescription == " " && wirepdate ==''
&&  wiresupplier == " " &&  wireissuedate =='' && wirewarranty =='' && wireunitprice==0 && wirequantity ==0))
      {
  
$("#15_Wire").html("Enter Model No.");
$("#15_Wire").show(); 


$("#17_Wire").html("Enter Serial No.");
$("#17_Wire").show();

$("#81_Wire").html("Enter Tag Name");
$("#81_Wire").show();

$("#19_Wire").html("Enter Condition");
$("#19_Wire").show();

$("#21_Wire").html("Enter Description");
$("#21_Wire").show();

$("#12_Wire").html("Enter Procurement Date");
$("#12_Wire").show();



$("#10_Wire").html("Enter Supplier");
$("#10_Wire").show();

$("#33_Wire").html("Enter Issue Date");
$("#33_Wire").show();

$("#13_Wire").html("Enter Warranty Expiration");
$("#13_Wire").show();

$("#8_Wire").html("Enter Unit Price");
$("#8_Wire").show();


$("#9_Wire").html("Enter Quantity");
$("#9_Wire").show();

      } 


var Monitormodelno=$("#14_Monitor").val();
        var Monitorserialno=$("#16_Monitor").val();
        var Monitorcondition=$("#18_Monitor").val();
        var Monitortag=$("#80_Monitor").val();
        var Monitordescription=$("#20_Monitor").val();
        
        var Monitorpdate=$("#11_Monitor").val();
        var Monitorsupplier=$("#3_Monitor").val();
        var Monitorissuedate=$("#32_Monitor").val();
        var Monitorwarranty=$("#4_Monitor").val();

        var Monitorunitprice=$("#5_Monitor").val();
        var Monitorquantity=$("#6_Monitor").val();


if(Monitorval  == 'Available'  && (Monitormodelno==" " && Monitorserialno==" "   && Monitortag==" "  && Monitorcondition == " "  && Monitordescription == " " && Monitorpdate ==''
&&  Monitorsupplier == " " &&  Monitorissuedate =='' && Monitorwarranty =='' && Monitorunitprice==0 && Monitorquantity ==0))
      {
      
$("#15_Monitor").html("Enter Model No.");
$("#15_Monitor").show(); 


$("#17_Monitor").html("Enter Serial No.");
$("#17_Monitor").show();


$("#81_Monitor").html("Enter Tag Name");
$("#81_Monitor").show();
$("#19_Monitor").html("Enter Condition");
$("#19_Monitor").show();

$("#21_Monitor").html("Enter Description");
$("#21_Monitor").show();

$("#12_Monitor").html("Enter Procurement Date");
$("#12_Monitor").show();



$("#10_Monitor").html("Enter Supplier");
$("#10_Monitor").show();

$("#33_Monitor").html("Enter Issue Date");
$("#33_Monitor").show();

$("#13_Monitor").html("Enter Warranty Expiration");
$("#13_Monitor").show();

$("#8_Monitor").html("Enter Unit Price");
$("#8_Monitor").show();


$("#9_Monitor").html("Enter Quantity");
$("#9_Monitor").show();

      } 



      

 }













 function checkinfoAvailableforupadate(){
var mouseval = $("#30_Mouse").val();
var Laptopval = $("#30_Laptop").val();
var Keyboardval = $("#30_Keyboard").val();
var Wireval = $("#30_Wire").val();
var Monitorval = $("#30_Monitor").val();
     var mousemodelno=$("#14_Mouse").val();
     var mouseserialno=$("#16_Mouse").val();
     var mousetag=$("#80_Mouse").val();
     var mousecondition=$("#18_Mouse").val();
     var mousedescription=$("#20_Mouse").val();
     
     var mousepdate=$("#11_Mouse").val();
     var mousesupplier=$("#3_Mouse").val();
     var mouseissuedate=$("#32_Mouse").val();
     var mousewarranty=$("#4_Mouse").val();

     var mouseunitprice=$("#5_Mouse").val();
     var mousequantity=$("#6_Mouse").val();
     
if(mouseval  == 'Available' && (mousemodelno==" " && mouseserialno==" " && mousetag==" "  && mousecondition == " "  && mousedescription == " " &&
mousepdate == '' && mousequantity == 0  && mouseunitprice== 0 &&  mouseissuedate == ''
 &&  mousewarranty == ''  &&  mousesupplier == " "))
      {
      
$("#15_Mouse").html("Enter Model No.");
$("#15_Mouse").show(); 

      
 $("#17_Mouse").html("Enter Serial No.");
$("#17_Mouse").show();


$("#81_Mouse").html("Enter Tag Name");
$("#81_Mouse").show();
$("#19_Mouse").html("Enter Condition");
$("#19_Mouse").show();

$("#21_Mouse").html("Enter Description");
$("#21_Mouse").show();


 $("#12_Mouse").html("Enter Procurement Date");
$("#12_Mouse").show();

$("#8_Mouse").html("Enter Unit Price");
$("#8_Mouse").show();


$("#33_Mouse").html("Enter Issue Date");
$("#33_Mouse").show();

$("#13_Mouse").html("Enter Warranty Expiration");
$("#13_Mouse").show();


$("#9_Mouse").html("Enter Quantity");
$("#9_Mouse").show(); 

$("#10_Mouse").html("Enter Supplier");
$("#10_Mouse").show();

      }

      
    


 var laptopmodelno=$("#14_Laptop").val();
       var laptopserialno=$("#16_Laptop").val();
       var laptoptag=$("#80_Laptop").val();
       
       var laptopcondition=$("#18_Laptop").val();
       var laptopdescription=$("#20_Laptop").val();
       
       var laptoppdate=$("#11_Laptop").val();
       var laptopsupplier=$("#3_Laptop").val();
       var laptopissuedate=$("#32_Laptop").val();
       var laptopwarranty=$("#4_Laptop").val();

       var laptopunitprice=$("#5_Laptop").val();
       var laptopquantity=$("#6_Laptop").val();

if(Laptopval  == 'Available' && (laptopmodelno==" " && laptopserialno==" " && laptoptag==" "  && laptopcondition == " "  && laptopdescription == " " && laptoppdate ==''
&&  laptopsupplier == " " &&  laptopissuedate =='' && laptopwarranty =='' && laptopunitprice==0 && laptopquantity ==0))
      {
      
$("#15_Laptop").html("Enter Model No.");
$("#15_Laptop").show(); 


$("#17_Laptop").html("Enter Serial No.");
$("#17_Laptop").show();

$("#81_Laptop").html("Enter Tag Name");
$("#81_Laptop").show();

$("#19_Laptop").html("Enter Condition");
$("#19_Laptop").show();

$("#21_Laptop").html("Enter Description");
$("#21_Laptop").show();

$("#12_Laptop").html("Enter Procurement Date");
$("#12_Laptop").show();



$("#10_Laptop").html("Enter Supplier");
$("#10_Laptop").show();

$("#33_Laptop").html("Enter Issue Date");
$("#33_Laptop").show();

$("#13_Laptop").html("Enter Warranty Expiration");
$("#13_Laptop").show();

$("#8_Laptop").html("Enter Unit Price");
$("#8_Laptop").show();


$("#9_Laptop").html("Enter Quantity");
$("#9_Laptop").show();

      } 


var keyboardmodelno=$("#14_Keyboard").val();
       var keyboardserialno=$("#16_Keyboard").val();
       var keyboardtag=$("#80_Keyboard").val();
       var keyboardcondition=$("#18_Keyboard").val();
       
       var keyboarddescription=$("#20_Keyboard").val();
       
       var keyboardpdate=$("#11_Keyboard").val();
       var keyboardsupplier=$("#3_Keyboard").val();
       var keyboardissuedate=$("#32_Keyboard").val();
       var keyboardwarranty=$("#4_Keyboard").val();

       var keyboardunitprice=$("#5_Keyboard").val();
       var keyboardquantity=$("#6_Keyboard").val();

if(Keyboardval  == 'Available'  && (keyboardmodelno==" " && keyboardserialno==" "  && keyboardtag==" " && keyboardcondition == " "  && keyboarddescription == " " && keyboardpdate ==''
&&  keyboardsupplier == " " &&  keyboardissuedate =='' && keyboardwarranty =='' && keyboardunitprice==0 && keyboardquantity ==0))
      {
      
$("#15_Keyboard").html("Enter Model No.");
$("#15_Keyboard").show(); 


$("#17_Keyboard").html("Enter Serial No.");
$("#17_Keyboard").show();

$("#81_Keyboard").html("Enter Tag Name");
$("#81_Keyboard").show();

$("#19_Keyboard").html("Enter Condition");
$("#19_Keyboard").show();

$("#21_Keyboard").html("Enter Description");
$("#21_Keyboard").show();

$("#12_Keyboard").html("Enter Procurement Date");
$("#12_Keyboard").show();



$("#10_Keyboard").html("Enter Supplier");
$("#10_Keyboard").show();

$("#33_Keyboard").html("Enter Issue Date");
$("#33_Keyboard").show();

$("#13_Keyboard").html("Enter Warranty Expiration");
$("#13_Keyboard").show();

$("#8_Keyboard").html("Enter Unit Price");
$("#8_Keyboard").show();


$("#9_Keyboard").html("Enter Quantity");
$("#9_Keyboard").show();

      } 



var wiremodelno=$("#14_Wire").val();
     var wireserialno=$("#16_Wire").val();
     var wirecondition=$("#18_Wire").val();
     var wiretag=$("#80_Wire").val();
     var wiredescription=$("#20_Wire").val();
     
     var wirepdate=$("#11_Wire").val();
     var wiresupplier=$("#3_Wire").val();
     var wireissuedate=$("#32_Wire").val();
     var wirewarranty=$("#4_Wire").val();

     var wireunitprice=$("#5_Wire").val();
     var wirequantity=$("#6_Wire").val();


if(Wireval  == 'Available'  && (wiremodelno==" " && wireserialno==" "   && wiretag==" "  && wirecondition == " "  && wiredescription == " " && wirepdate ==''
&&  wiresupplier == " " &&  wireissuedate =='' && wirewarranty =='' && wireunitprice==0 && wirequantity ==0))
      {
     
$("#15_Wire").html("Enter Model No.");
$("#15_Wire").show(); 


$("#17_Wire").html("Enter Serial No.");
$("#17_Wire").show();


$("#81_Wire").html("Enter Tag Name");
$("#81_Wire").show();

$("#19_Wire").html("Enter Condition");
$("#19_Wire").show();

$("#21_Wire").html("Enter Description");
$("#21_Wire").show();

$("#12_Wire").html("Enter Procurement Date");
$("#12_Wire").show();



$("#10_Wire").html("Enter Supplier");
$("#10_Wire").show();

$("#33_Wire").html("Enter Issue Date");
$("#33_Wire").show();

$("#13_Wire").html("Enter Warranty Expiration");
$("#13_Wire").show();

$("#8_Wire").html("Enter Unit Price");
$("#8_Wire").show();


$("#9_Wire").html("Enter Quantity");
$("#9_Wire").show();

      } 

var Monitormodelno=$("#14_Monitor").val();
        var Monitorserialno=$("#16_Monitor").val();
        var Monitortag=$("#80_Monitor").val();
        var Monitorcondition=$("#18_Monitor").val();
        var Monitordescription=$("#20_Monitor").val();
        
        var Monitorpdate=$("#11_Monitor").val();
        var Monitorsupplier=$("#3_Monitor").val();
        var Monitorissuedate=$("#32_Monitor").val();
        var Monitorwarranty=$("#4_Monitor").val();

        var Monitorunitprice=$("#5_Monitor").val();
        var Monitorquantity=$("#6_Monitor").val();


if(Monitorval  == 'Available'  && (Monitormodelno==" " && Monitorserialno==" "   && Monitortag==" " && Monitorcondition == " "  && Monitordescription == " " && Monitorpdate ==''
&&  Monitorsupplier == " " &&  Monitorissuedate =='' && Monitorwarranty =='' && Monitorunitprice==0 && Monitorquantity ==0))
      {
      
$("#15_Monitor").html("Enter Model No.");
$("#15_Monitor").show(); 


$("#17_Monitor").html("Enter Serial No.");
$("#17_Monitor").show();

$("#81_Monitor").html("Enter Tag Name");
$("#81_Monitor").show();

$("#19_Monitor").html("Enter Condition");
$("#19_Monitor").show();

$("#21_Monitor").html("Enter Description");
$("#21_Monitor").show();

$("#12_Monitor").html("Enter Procurement Date");
$("#12_Monitor").show();



$("#10_Monitor").html("Enter Supplier");
$("#10_Monitor").show();

$("#33_Monitor").html("Enter Issue Date");
$("#33_Monitor").show();

$("#13_Monitor").html("Enter Warranty Expiration");
$("#13_Monitor").show();

$("#8_Monitor").html("Enter Unit Price");
$("#8_Monitor").show();


$("#9_Monitor").html("Enter Quantity");
$("#9_Monitor").show();

      } 




      

}



 function checkinfoapproved(){
var mouseval = $("#30_Mouse").val();
var Laptopval = $("#30_Laptop").val();
var Keyboardval = $("#30_Keyboard").val();
var Wireval = $("#30_Wire").val();
var Monitorval = $("#30_Monitor").val();
  var mousemodelno=$("#14_Mouse").val();
  var mouseserialno=$("#16_Mouse").val();
  var mousetag=$("#80_Mouse").val();
  var mousecondition=$("#18_Mouse").val();
  var mousedescription=$("#20_Mouse").val();
  
  var mousepdate=$("#11_Mouse").val();
  var mousesupplier=$("#3_Mouse").val();
  var mouseissuedate=$("#32_Mouse").val();
  var mousewarranty=$("#4_Mouse").val();

  var mouseunitprice=$("#5_Mouse").val();
  var mousequantity=$("#6_Mouse").val();
 
if(mouseval  == "Available" && (mousemodelno=="" && mouseserialno==""  && mousetag=="" && mousecondition == ""  && mousedescription == "" &&
mousepdate == "" && mousequantity == 0  && mouseunitprice== 0 &&  mouseissuedate == ""
 &&  mousewarranty == ""  &&  mousesupplier == " "))
      {
      
$("#15_Mouse").html("Enter Model No.");
$("#15_Mouse").show(); 

      
 $("#17_Mouse").html("Enter Serial No.");
$("#17_Mouse").show();
$("#81_Mouse").html("Enter Tag Name");
$("#81_Mouse").show();

$("#19_Mouse").html("Enter Condition");
$("#19_Mouse").show();

$("#21_Mouse").html("Enter Description");
$("#21_Mouse").show();


 $("#12_Mouse").html("Enter Procurement Date");
$("#12_Mouse").show();

$("#8_Mouse").html("Enter Unit Price");
$("#8_Mouse").show();


$("#33_Mouse").html("Enter Issue Date");
$("#33_Mouse").show();

$("#13_Mouse").html("Enter Warranty Expiration");
$("#13_Mouse").show();


$("#9_Mouse").html("Enter Quantity");
$("#9_Mouse").show(); 

$("#10_Mouse").html("Enter Supplier");
$("#10_Mouse").show();

      }

      
    


 var laptopmodelno=$("#14_Laptop").val();
       var laptopserialno=$("#16_Laptop").val();
       var laptopcondition=$("#18_Laptop").val();
       var laptoptag=$("#80_Laptop").val();
       var laptopdescription=$("#20_Laptop").val();
       
       var laptoppdate=$("#11_Laptop").val();
       var laptopsupplier=$("#3_Laptop").val();
       var laptopissuedate=$("#32_Laptop").val();
       var laptopwarranty=$("#4_Laptop").val();

       var laptopunitprice=$("#5_Laptop").val();
       var laptopquantity=$("#6_Laptop").val();

if(Laptopval  == "Available" && (laptopmodelno=="" && laptopserialno==""  && laptoptag==""  && laptopcondition == ""  && laptopdescription == "" && laptoppdate ==''
&&  laptopsupplier == " " &&  laptopissuedate =='' && laptopwarranty =='' && laptopunitprice==0 && laptopquantity ==0))
      {
     
$("#15_Laptop").html("Enter Model No.");
$("#15_Laptop").show(); 


$("#17_Laptop").html("Enter Serial No.");
$("#17_Laptop").show();

$("#81_Laptop").html("Enter Tag Name");
$("#81_Laptop").show();

$("#19_Laptop").html("Enter Condition");
$("#19_Laptop").show();

$("#21_Laptop").html("Enter Description");
$("#21_Laptop").show();

$("#12_Laptop").html("Enter Procurement Date");
$("#12_Laptop").show();



$("#10_Laptop").html("Enter Supplier");
$("#10_Laptop").show();

$("#33_Laptop").html("Enter Issue Date");
$("#33_Laptop").show();

$("#13_Laptop").html("Enter Warranty Expiration");
$("#13_Laptop").show();

$("#8_Laptop").html("Enter Unit Price");
$("#8_Laptop").show();


$("#9_Laptop").html("Enter Quantity");
$("#9_Laptop").show();

      } 


var keyboardmodelno=$("#14_Keyboard").val();
       var keyboardserialno=$("#16_Keyboard").val();
       var keyboardtag=$("#80_Keyboard").val();
       var keyboardcondition=$("#18_Keyboard").val();
       var keyboarddescription=$("#20_Keyboard").val();
       
       var keyboardpdate=$("#11_Keyboard").val();
       var keyboardsupplier=$("#3_Keyboard").val();
       var keyboardissuedate=$("#32_Keyboard").val();
       var keyboardwarranty=$("#4_Keyboard").val();

       var keyboardunitprice=$("#5_Keyboard").val();
       var keyboardquantity=$("#6_Keyboard").val();

if(Keyboardval  == "Available"  && (keyboardmodelno=="" && keyboardserialno==""  && keyboardtag==""   && keyboardcondition == ""  && keyboarddescription == "" && keyboardpdate ==''
&&  keyboardsupplier == " " &&  keyboardissuedate =='' && keyboardwarranty =='' && keyboardunitprice==0 && keyboardquantity ==0))
      {
      
$("#15_Keyboard").html("Enter Model No.");
$("#15_Keyboard").show(); 


$("#17_Keyboard").html("Enter Serial No.");
$("#17_Keyboard").show();

$("#81_Keyboard").html("Enter Tag Name");
$("#81_Keyboard").show();

$("#19_Keyboard").html("Enter Condition");
$("#19_Keyboard").show();

$("#21_Keyboard").html("Enter Description");
$("#21_Keyboard").show();

$("#12_Keyboard").html("Enter Procurement Date");
$("#12_Keyboard").show();



$("#10_Keyboard").html("Enter Supplier");
$("#10_Keyboard").show();

$("#33_Keyboard").html("Enter Issue Date");
$("#33_Keyboard").show();

$("#13_Keyboard").html("Enter Warranty Expiration");
$("#13_Keyboard").show();

$("#8_Keyboard").html("Enter Unit Price");
$("#8_Keyboard").show();


$("#9_Keyboard").html("Enter Quantity");
$("#9_Keyboard").show();

      } 



var wiremodelno=$("#14_Wire").val();
  var wireserialno=$("#16_Wire").val();
  var wiretag=$("#80_Wire").val();
  var wirecondition=$("#18_Wire").val();
  var wiredescription=$("#20_Wire").val();
  
  var wirepdate=$("#11_Wire").val();
  var wiresupplier=$("#3_Wire").val();
  var wireissuedate=$("#32_Wire").val();
  var wirewarranty=$("#4_Wire").val();

  var wireunitprice=$("#5_Wire").val();
  var wirequantity=$("#6_Wire").val();


if(Wireval  == "Available"  && (wiremodelno=="" && wireserialno=="" && wiretag=="" && wirecondition == ""  && wiredescription == "" && wirepdate ==''
&&  wiresupplier == " " &&  wireissuedate =='' && wirewarranty =='' && wireunitprice==0 && wirequantity ==0))
      {
      
$("#15_Wire").html("Enter Model No.");
$("#15_Wire").show(); 


$("#17_Wire").html("Enter Serial No.");
$("#17_Wire").show();

$("#81_Wire").html("Enter Tag Name");
$("#81_Wire").show();

$("#19_Wire").html("Enter Condition");
$("#19_Wire").show();

$("#21_Wire").html("Enter Description");
$("#21_Wire").show();

$("#12_Wire").html("Enter Procurement Date");
$("#12_Wire").show();



$("#10_Wire").html("Enter Supplier");
$("#10_Wire").show();

$("#33_Wire").html("Enter Issue Date");
$("#33_Wire").show();

$("#13_Wire").html("Enter Warranty Expiration");
$("#13_Wire").show();

$("#8_Wire").html("Enter Unit Price");
$("#8_Wire").show();


$("#9_Wire").html("Enter Quantity");
$("#9_Wire").show();

      } 
var Monitormodelno=$("#14_Monitor").val();
        var Monitorserialno=$("#16_Monitor").val();
        var Monitorcondition=$("#18_Monitor").val();
        var Monitortag=$("#80_Monitor").val();
        var Monitordescription=$("#20_Monitor").val();
        
        var Monitorpdate=$("#11_Monitor").val();
        var Monitorsupplier=$("#3_Monitor").val();
        var Monitorissuedate=$("#32_Monitor").val();
        var Monitorwarranty=$("#4_Monitor").val();

        var Monitorunitprice=$("#5_Monitor").val();
        var Monitorquantity=$("#6_Monitor").val();


if(Monitorval  == 'Available'  && (Monitormodelno=="" && Monitorserialno==""  && Monitortag=="" && Monitorcondition == ""  && Monitordescription == "" && Monitorpdate ==''
&&  Monitorsupplier == " " &&  Monitorissuedate =='' && Monitorwarranty =='' && Monitorunitprice==0 && Monitorquantity ==0))
      {
      
$("#15_Monitor").html("Enter Model No.");
$("#15_Monitor").show(); 


$("#17_Monitor").html("Enter Serial No.");
$("#17_Monitor").show();

$("#81_Monitor").html("Enter Tag Name");
$("#81_Monitor").show();

$("#19_Monitor").html("Enter Condition");
$("#19_Monitor").show();

$("#21_Monitor").html("Enter Description");
$("#21_Monitor").show();

$("#12_Monitor").html("Enter Procurement Date");
$("#12_Monitor").show();



$("#10_Monitor").html("Enter Supplier");
$("#10_Monitor").show();

$("#33_Monitor").html("Enter Issue Date");
$("#33_Monitor").show();

$("#13_Monitor").html("Enter Warranty Expiration");
$("#13_Monitor").show();

$("#8_Monitor").html("Enter Unit Price");
$("#8_Monitor").show();


$("#9_Monitor").html("Enter Quantity");
$("#9_Monitor").show();

      } 

var fname = $("#dept").val();
if (fname !== '') {
$("#validDept").hide();

} else {
if (fname === '') {
$("#validDept").html("Enter Dept/Area");
$("#validDept").show();

//error_fname = true;
} 
}


var fname = $("#desk").val();
if (fname !== '') {
$("#validDesk").hide();

} else {
if (fname === '') {
$("#validDesk").html("Enter Desk");
$("#validDesk").show();

error_deptdesk = true;
} 
}




      

}   
</script>


 <script>
$(function(){
    var dtToday = new Date();
    
    var month = dtToday.getMonth() + 1;
    var day = dtToday.getDate();
    var year = dtToday.getFullYear();
    if(month < 10)
        month = '0' + month.toString();
    if(day < 10)
        day = '0' + day.toString();
    var maxDate = year + '-' + month + '-' + day;
    $('#11_Mouse').attr('min', maxDate);
    $('#11_Keyboard').attr('min', maxDate);
    $('#11_Laptop').attr('min', maxDate);
    $('#11_Wire').attr('min', maxDate);

   /*  $('#4_Mouse').attr('min', maxDate);
    $('#4_Keyboard').attr('min', maxDate);
    $('#4_Laptop').attr('min', maxDate);
    $('#4_Wire').attr('min', maxDate);
 */
    $('#32_Mouse').attr('min', maxDate);
    $('#32_Keyboard').attr('min', maxDate);
    $('#32_Laptop').attr('min', maxDate);
    $('#32_Wire').attr('min', maxDate);



    $('#66_Mouse').attr('min', maxDate);
    $('#66_Keyboard').attr('min', maxDate);
    $('#66_Laptop').attr('min', maxDate);
    $('#66_Wire').attr('min', maxDate);



    $('#68_Mouse').attr('min', maxDate);
    $('#68_Keyboard').attr('min', maxDate);
    $('#68_Laptop').attr('min', maxDate);
    $('#68_Wire').attr('min', maxDate);
});

</script> -->

<script type="text/javascript">
function getsectionmodel() {  
	
      var laptopserial=$('#16_Laptop').val();
     var laptopmodel=$('#14_Laptop').val();    
     var keyboardmodel=$('#14_Keyboard').val();
     var keyboardserial=$('#16_Keyboard').val();
     var wiremodel=$('#14_Wire').val();
     var mousemodel=$('#14_Mouse').val();
     var monitormodel=$('#14_Monitor').val();
     var wireserial=$('#16_Wire').val();
     var mouseserial=$('#16_Mouse').val();
     var monitorserial=$('#16_Monitor').val();
     var laptoptag=$('#80_Laptop').val();
     var keyboardtag=$('#80_Keyboard').val();
     var mousetag=$('#80_Mouse').val();
     var wiretag=$('#80_Wire').val();
     var monitortag=$('#80_Monitor').val();
     if( laptoptag !=='' && laptopserial==''){
       
        var url='../getModuleSelfTesting1?id3=' + laptoptag;
        var id1='#16_Laptop';
        var id2='#5_Laptop';
        var id3='#4_Laptop';
      
            }
     else if( keyboardtag !=='' && keyboardserial==''){
    	
        var url='../getModuleSelfTesting1?id3=' + keyboardtag;
        var id1='#16_Keyboard';
        var id2='#5_Keyboard';
        var id3='#4_Keyboard';
       
        }
    else if(wiretag !=='' && wireserial==''){
    	 
            var url='../getModuleSelfTesting1?id3=' + wiretag;
            var id1='#16_Wire';
            var id2='#5_Wire';
            var id3='#4_Wire';
            
            }
    else if(mousetag !=='' && mouseserial==''){
    	
            var url='../getModuleSelfTesting1?id3=' + mousetag;
            var id1='#16_Mouse';
            var id2='#5_Mouse';
            var id3='#4_Mouse';
            
            }
    else if(monitortag !=='' && monitorserial==''){
    	
            var url='../getModuleSelfTesting1?id3=' + monitortag;
            var id1='#16_Monitor';
            var id2='#5_Monitor';
            var id3='#4_Monitor';
           
            }

 

 

     

 
 
     if( laptoptag !==' ' && laptopserial==' '){
    	
        var url='../getModuleSelfTesting1?id3=' + laptoptag;
        var id1='#16_Laptop';
        var id2='#5_Laptop';
        var id3='#4_Laptop';
        
            }
    else if( keyboardtag !==' ' && keyboardserial==' '){
         var url='../getModuleSelfTesting1?id3=' + keyboardtag;
        var id1='#16_Keyboard';
        var id2='#5_Keyboard';
        var id3='#4_Keyboard';
      
        
        }
    else if(wiretag !==' ' && wireserial==' '){
    
            var url='../getModuleSelfTesting1?id3=' + wiretag;
            var id1='#16_Wire';
           
            var id2='#5_Wire';
            var id3='#4_Wire';
           
            }
    else if(mousetag !==' ' && mouseserial==' '){
    	
            var url='../getModuleSelfTesting1?id3=' + mousetag;
            var id1='#16_Mouse';
            var id2='#5_Mouse';
            var id3='#4_Mouse';
          
            }
    else if(monitortag !==' ' && monitorserial==' '){
    	
            var url='../getModuleSelfTesting1?id3=' + monitortag;
            var id1='#16_Monitor';
            var id2='#5_Monitor';
            var id3='#4_Monitor';
          
            } 
     $.ajax({
           url : url , //Write a function in the server side which accepts school code as argument
            type:'POST',     
            dataType:'json',//return type from server side function [return it as JSON object]
            contentType: "application/json",
            cache : false,
           
            success: function (data) { //Array of data returned from server side function
             
               $(id1).val(data[0]);
              
                $(id2).val(data[1]);
                $(id3).val(data[2]);
                
               $(id4).val(data[3]); 
               }, 
            error: function (data) {
                 alert(e);
            }
      });   
}
</script>
<script type="text/javascript">

function gettag(){

	var laptopsup=$('#3_Laptop').val();
	var laptopmodel=$('#14_Laptop').val();
	var laptopserial=$('#16_Laptop').val();
	var laptopreq=$('#90_Laptop').val();
	
	var keyboardsup=$('#3_Keyboard').val();
	var keyboardmodel=$('#14_Keyboard').val();
	 var keyboardserial=$('#16_Keyboard').val();
	 var keyboardreq=$('#90_Keyboard').val();
	 
	 var mousesup=$('#3_Mouse').val();
	 var mousemodel=$('#14_Mouse').val();
	 var mouseserial=$('#16_Mouse').val();
	 var mousereq=$('#90_Mouse').val();
	 
	 var wiresup=$('#3_Wire').val();
	 var wiremodel=$('#14_Wire').val();
	 var wireserial=$('#16_Wire').val();
	 var wirereq=$('#90_Wire').val();
	 
	 var monitorsup=$('#3_Monitor').val();
	 var monitormodel=$('#14_Monitor').val();
	 var monitorserial=$('#16_Monitor').val();
	  var monitorreq=$('#90_Monitor').val();
	 
	  if( laptopreq =='Laptop' && laptopsup !==' ' && laptopserial=='' && laptopmodel!==' '){
		 
	        var url='../gettag?id1=' +laptopsup +'&id2='+laptopreq +'&id3='+laptopmodel;
	        var id='#80_Laptop';
	            }
	    else if( keyboardreq =='Keyboard'  && keyboardsup !==' ' && keyboardserial=='' && keyboardmodel !==' '){
	      
	        var url='../gettag?id1=' + keyboardsup +'&id2='+keyboardreq +'&id3='+keyboardmodel;
	        var id='#80_Keyboard';
	        }
	    else if(  wirereq =='Wire' && wiresup !==' ' && wireserial=='' && wiremodel!==' '){
	        
	            var url='../gettag?id1=' + wiresup +'&id2='+wirereq +'&id3='+wiremodel;
	            var id='#80_Wire';
	            }
	    else if( mousereq =='Mouse' && mousesup !==' ' && mouseserial=='' && mousemodel!==' '){
	        
	            var url='../gettag?id1=' + mousesup +'&id2='+mousereq +'&id3='+mousemodel;
	            var id='#80_Mouse';
	            }
	    else if(monitorreq =='Monitor'  && monitorsup !==' ' && monitorserial=='' && monitormodel!==' '){
	        
	            var url='../gettag?id1=' + monitorsup +'&id2='+monitorreq +'&id3='+monitormodel;
	            var id='#80_Monitor';
	            }

	 

	 

	     if( laptopreq =='Laptop' && laptopsup !==' ' && laptopserial==' ' && laptopmodel !==' '){
	        
	        var url='../gettag?id1=' +laptopsup +'&id2='+laptopreq +'&id3='+laptopmodel;
	        var id='#80_Laptop';
	            }
	    else if( keyboardreq =='Keyboard'  && keyboardsup !==' ' && keyboardserial==' ' && keyboardmodel !==' '){
	       
	        var url='../gettag?id1=' + keyboardsup +'&id2='+keyboardreq +'&id3='+keyboardmodel;
	        var id='#80_Keyboard';
	        }
	    else if(  wirereq =='Wire' && wiresup !==' ' && wireserial==' ' && wiremodel!==' '){
	       
	            var url='../gettag?id1=' + wiresup +'&id2='+wirereq +'&id3='+wiremodel;
	            var id='#80_Wire';
	            }
	    else if( mousereq =='Mouse' && mousesup !==' ' && mouseserial==' ' && mousemodel!==' '){
	       
	            var url='../gettag?id1=' + mousesup +'&id2='+mousereq +'&id3='+mousemodel;
	            var id='#80_Mouse';
	            }
	    else if(monitorreq =='Monitor'  && monitorsup !==' ' && monitorserial==' ' && monitormodel!==' '){
	     
	            var url='../gettag?id1=' + monitorsup +'&id2='+monitorreq +'&id3='+monitormodel;
	            var id='#80_Monitor';
	            }

	     $.ajax({
	           url : url, //Write a function in the server side which accepts school code as argument
	            type:'POST',     
	            dataType:'json',//return type from server side function [return it as JSON object]
	            contentType: "application/json",
	            cache : false,
	           
	            success: function (data) { //Array of data returned from server side function
	              
	                var html = '';
	                var len = data.length;
	                html += '<option value=" ">Select</option>';
	                for (var i = 0; i < len; i++) {
	                 html += '<option value="' + data[i] + '">'
	                   + data[i]
	                   + '</option>';
	                }
	                html += '</option>';
	                $(id).html(html);
	               
	               },
	            error: function (data) {
	                 alert(e);
	            }
	      });   
	 
}

 function getsection() {
    /* alert($('#90_Keyboard').val());
    alert($('#3_Keyboard').val()); */
  
    var laptopreq=$('#90_Laptop').val();
    var laptopsup=$('#3_Laptop').val();
    var laptopserial=$('#16_Laptop').val();
    var keyboardserial=$('#16_Keyboard').val();
    var wireserial=$('#16_Wire').val();
    var mouseserial=$('#16_Mouse').val();
    var monitorserial=$('#16_Monitor').val();
    var keyboardreq=$('#90_Keyboard').val();
    var keyboardsup=$('#3_Keyboard').val();
    var wirereq=$('#90_Wire').val();
    var wiresup=$('#3_Wire').val();
    var mousereq=$('#90_Mouse').val();
    var mousesup=$('#3_Mouse').val();
    var monitorreq=$('#90_Monitor').val();
    var monitorsup=$('#3_Monitor').val();
     if( laptopreq =='Laptop' && laptopsup !==' ' && laptopserial==''){
         
        var url='../getModuleSelfTesting?id1=' +laptopsup +'&id2='+laptopreq;
        var id='#14_Laptop';
            }
    else if( keyboardreq =='Keyboard'  && keyboardsup !==' ' && keyboardserial==''){
      
        var url='../getModuleSelfTesting?id1=' + keyboardsup +'&id2='+keyboardreq;
        var id='#14_Keyboard';
        }
    else if(  wirereq =='Wire' && wiresup !==' ' && wireserial==''){
        
            var url='../getModuleSelfTesting?id1=' + wiresup +'&id2='+wirereq;
            var id='#14_Wire';
            }
    else if( mousereq =='Mouse' && mousesup !==' ' && mouseserial==''){
        
            var url='../getModuleSelfTesting?id1=' + mousesup +'&id2='+mousereq;
            var id='#14_Mouse';
            }
    else if(monitorreq =='Monitor'  && monitorsup !==' ' && monitorserial==''){
        
            var url='../getModuleSelfTesting?id1=' + monitorsup +'&id2='+monitorreq;
            var id='#14_Monitor';
            }

 

 

     if( laptopreq =='Laptop' && laptopsup !==' ' && laptopserial==' '){
        
        var url='../getModuleSelfTesting?id1=' +laptopsup +'&id2='+laptopreq;
        var id='#14_Laptop';
            }
    else if( keyboardreq =='Keyboard'  && keyboardsup !==' ' && keyboardserial==' '){
       
        var url='../getModuleSelfTesting?id1=' + keyboardsup +'&id2='+keyboardreq;
        var id='#14_Keyboard';
        }
    else if(  wirereq =='Wire' && wiresup !==' ' && wireserial==' '){
       
            var url='../getModuleSelfTesting?id1=' + wiresup +'&id2='+wirereq;
            var id='#14_Wire';
            }
    else if( mousereq =='Mouse' && mousesup !==' ' && mouseserial==' '){
       
            var url='../getModuleSelfTesting?id1=' + mousesup +'&id2='+mousereq;
            var id='#14_Mouse';
            }
    else if(monitorreq =='Monitor'  && monitorsup !==' ' && monitorserial==' '){
     
            var url='../getModuleSelfTesting?id1=' + monitorsup +'&id2='+monitorreq;
            var id='#14_Monitor';
            }
    $.ajax({
           url : url, //Write a function in the server side which accepts school code as argument
            type:'POST',     
            dataType:'json',//return type from server side function [return it as JSON object]
            contentType: "application/json",
            cache : false,
         
            success: function (data) { //Array of data returned from server side function
              
                var html = '';
                var len = data.length;
                html += '<option value=" ">Select</option>';
                for (var i = 0; i < len; i++) {
                 html += '<option value="' + data[i] + '">'
                   + data[i]
                   + '</option>';
                }
                html += '</option>';
                $(id).html(html);
               
               },
            error: function (data) {
                 alert(e);
            }
      });   
}

 

</script>

<script>
function check(){
	var flag=0;
	var mouseval = $("#30_Mouse").val();
	var Laptopval = $("#30_Laptop").val();
	var Keyboardval = $("#30_Keyboard").val();
	var Wireval = $("#30_Wire").val();
	var Monitorval = $("#30_Monitor").val();
	var isavailable = $("#sts").val();
	if (mouseval == 'Not available'|| Laptopval == 'Not available'|| Keyboardval == 'Not available'|| Wireval == 'Not available' || Monitorval == 'Not available' ) 
	{
	flag=1;
	$("#sts").val('Not available');

	if(flag==1)
	{
	$("#flagg").hide();
	$("#not").show(); 
	}
	} 
	else if(mouseval == 'Available'|| Laptopval == 'Available'|| Keyboardval == 'Available'|| Wireval == 'Available' || Monitorval ==  'Available')
	{
	flag=0;
	$("#sts").val('Available');
	if(flag==0)
	{
	$("#flagg").show();
	$("#not").hide(); 
	}
	}

	return flag;
	}




</script>


<script>
function calculate() {

var btn = document.getElementsByClassName('form-control');

for (i = 0; i < btn.length; i++) {

if (document.getElementById('5_Mouse') != null) {

var myBox1 = document.getElementById('5_Mouse').value;
var myBox2 = document.getElementById('6_Mouse').value;

var myResult = myBox1 * myBox2;
document.getElementById('7_Mouse').value = myResult;
}

if (document.getElementById('5_Laptop') != null) {

var myBoxval1 = document.getElementById('5_Laptop').value;

var myBoxval2 = document.getElementById('6_Laptop').value;

var myResult1 = myBoxval1 * myBoxval2;

document.getElementById('7_Laptop').value = myResult1;
}

if (document.getElementById('5_Keyboard') != null) {
var myBoxval3 = document.getElementById('5_Keyboard').value;
var myBoxval4 = document.getElementById('6_Keyboard').value;

var myResult2 = myBoxval3 * myBoxval4;

document.getElementById('7_Keyboard').value = myResult2;
}
if (document.getElementById('5_Wire') != null) {
var myBoxval5 = document.getElementById('5_Wire').value;
var myBoxval6 = document.getElementById('6_Wire').value;

var myResult3 = myBoxval5 * myBoxval6;

document.getElementById('7_Wire').value = myResult3;
}
if (document.getElementById('5_Monitor') != null) {
var myBoxval5 = document.getElementById('5_Monitor').value;
var myBoxval6 = document.getElementById('6_Monitor').value;

var myResult3 = myBoxval5 * myBoxval6;

document.getElementById('7_Monitor').value = myResult3;
}
}

}
</script>
 
</body>
</html>
