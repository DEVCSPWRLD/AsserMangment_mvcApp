<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script type="text/javascript" src="/js/leftmenu.js"></script>
<link href="/css/leftmenu.css" rel="stylesheet" type="text/css">
</head>
<body>
<style>
  a:hover
  {
    background-color:black;
    border-radius:25px;
  }
</style>
<div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                                                    
        
        <c:if test="${role=='USER'}">
         <i class="fa fa-registered" aria-hidden="true">
        <a href="/user/asset?eid=${empid}">Asset Form</a></i>
        <br>
        <br>
        <i class="fa fa-thumb-tack"   aria-hidden="true">
        <a href="/user?eid=${empid}">Track</a></i></c:if>
        
        
        
        <c:if test="${role !='USER'}">
        <i class="fa fa-flag-checkered"  aria-hidden="true">
        <a href="/admin/report">Report</a></i></c:if></br></br>
        
        
        
        <i class="fa fa-key" aria-hidden="true">
        <a href="/user/changepass">Change
                Password</a></i></br>

 

<li >
    </div>
    
    
    
</body>
</html>