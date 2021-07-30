<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Rating Assets</title>
<link rel="stylesheet" href="css/rating.css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
<style>
<style>
body
{
	margin: 0;
	padding: 0;
	/* background: #262626; */
}
.rating
{
	position: relative;
	display: flex;
	flex-wrap: wrap;
	margin-top: 80px;
	left: 10%;
	transform: translate(-50%,-50%) rotateY(180deg);
} 
.rating input
{
	 display: none; 
}
.rating label
{
	/* display: block; */
	cursor: pointer;
	width: 80px;
	/* background: #ccc; */
} 
.rating label:before
{
	content: '\f005';
	font-family: fontAwesome;
	position: relative;
	display: block;
	font-size: 50px;
	color: #ccffcc;
}
.rating label:after
{
	content: '\f005';
	font-family: fontAwesome;
	position: absolute;
	display: block;
	font-size: 50px;
	color: #ff3333;
	top: 0;
	opacity: 0;
	transition: .5s;
	text-shadow: 0 2px 5px rgba(0,0,0,.5);
}
.rating label:hover:after,
.rating label:hover ~ label:after,
.rating input:checked ~ label:after
{
	opacity: 1;
} 
.button{
align: right;
}
</style>
</head>
<body >
<input type="hidden" value="${typuser}">
<input type="hidden" value="${detail}">
<input type="hidden" value="${id}" name="asset_id">
<form:form class="form-horizontal" action="../savestar" modelAttribute="assetval" cssClass="float-label" id="trxForm" 
name="myform" method="POST" >
<input type="hidden" value="${typuser}">
<input type="hidden" value="${detail}">
<input type="hidden" value="${id}" name="asset_id">
<div class="form-group p-1">
<c:if test="${typuser=='USER'}">
<h1 style="color: #4E7E6B; text-align: center;">Please Provide Your Feedback</h1>
<div class="rating">
<input type="radio" name="feedback" value="5" id="star1"> 
<label for="star1"></label>
<input type="radio" name="feedback"  value="4" id="star2"> 
<label for="star2"></label>
<input type="radio" name="feedback"  value="3" id="star3"> 
<label for="star3"></label>
<input type="radio" name="feedback"  value="2" id="star4"> 
<label for="star4"></label>
<input type="radio" name="feedback"  value="1" id="star5"> 
<label for="star5"></label>
</div>
<div align="center">
<button type="submit" value="Submit" class="btn btn-primary mr-2 ml-4" style="background-color: #4E7E6B; color:white">Submit</button>
</div>
</c:if>
</div>
<c:if test="${typuser!='USER'}">
<h1 style="color: #4E7E6B; text-align: center;">Feedback Of The Employee</h1>
<c:if test="${detail=='5'}">
<div class="rating">
<input type="checkbox" name="feedback" value="5" checked="checked" /> 
<label for="star5"></label>

<input type="checkbox" name="feedback"  value="4"  checked="checked" /> 
<label for="star4"></label>

<input type="checkbox" name="feedback"  value="3"  checked="checked" /> 
<label for="star3"></label>

<input type="checkbox" name="feedback"  value="2"  checked="checked" /> 
<label for="star2"></label>

<input type="checkbox" name="feedback"  value="1"  checked="checked" /> 
<label for="star1"></label>
</div>
</c:if>
<c:if test="${detail=='4'}">
<div class="rating">
<input type="checkbox" name="feedback" value="5"  /> 
<label for="star5"></label>

<input type="checkbox" name="feedback"  value="4"  checked="checked" /> 
<label for="star4"></label>

<input type="checkbox" name="feedback"  value="3"  checked="checked" /> 
<label for="star3"></label>

<input type="checkbox" name="feedback"  value="2" checked="checked" /> 
<label for="star2"></label>

<input type="checkbox" name="feedback"  value="1" checked="checked" /> 
<label for="star1"></label>
</div>
</c:if>
<c:if test="${detail=='3'}">
<div class="rating">
<input type="checkbox" name="feedback" value="5" /> 
<label for="star5"></label>

<input type="checkbox" name="feedback"  value="4" /> 
<label for="star4"></label>

<input type="checkbox" name="feedback"  value="3"  checked="checked" /> 
<label for="star3"></label>

<input type="checkbox" name="feedback"  value="2" checked="checked" /> 
<label for="star2"></label>

<input type="checkbox" name="feedback"  value="1"  checked="checked" /> 
<label for="star1"></label>
</div>
</c:if>
<c:if test="${detail=='2'}">
<div class="rating">
<input type="checkbox" name="feedback" value="5"  /> 
<label for="star5"></label>

<input type="checkbox" name="feedback"  value="4" /> 
<label for="star4"></label>

<input type="checkbox" name="feedback"  value="3" /> 
<label for="star3"></label>

<input type="checkbox" name="feedback"  value="2"  checked="checked" /> 
<label for="star2"></label>

<input type="checkbox" name="feedback"  value="1"  checked="checked" /> 
<label for="star1"></label>
</div>
</c:if>
<c:if test="${detail=='1'}">
<div class="rating">
<input type="checkbox" name="feedback" value="5" /> 
<label for="star5"></label>

<input type="checkbox" name="feedback"  value="4" /> 
<label for="star4"></label>

<input type="checkbox" name="feedback"  value="3" /> 
<label for="star3"></label>

<input type="checkbox" name="feedback"  value="2" /> 
<label for="star2"></label>

<input type="checkbox" name="feedback"  value="1" checked="checked" /> 
<label for="star1"></label>
</div>
</c:if>
</c:if>

</form:form>

</body>
</html>