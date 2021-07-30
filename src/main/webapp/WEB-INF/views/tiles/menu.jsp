<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script type="text/javascript" src="../js/leftmenu.js"></script>
<link href="../css/leftmenu.css" rel="stylesheet" type="text/css">

</head>
<body>

<div id="mySidenav" class="sidenav">
       <div class="closebtn" style="font-size:30px;color:white;cursor:pointer;width:40px;margin-top:5px" onclick="closeNav()">&#9776;</div>
                                                    
        
        <c:if test="${role=='USER'}">
         <i class="fa fa-registered" aria-hidden="true">
        <a href="asset?eid=${empid}">Asset Request</a></i>
        <br>
        <br>
        <i class="fa fa-thumb-tack"   aria-hidden="true">
        <a href="trackctrl?eid=${empid}">My Request</a></i> </c:if>
        
       <%--  <br>
        <br>
        <i class="fa fa-thumb-tack"   aria-hidden="true">
        <a href="/user/openinfo?eid=${empid}">Track</a></i></c:if> --%>
        
        <c:if test="${role !='USER'}">
        <i class="fa fa-flag-checkered"  aria-hidden="true">
        <a href="../admin/report">Report</a></i></br></br>
        
          <i class="fa fa-hdd-o"  aria-hidden="true" style= "color: white">
        <a href="../admin/inventory">Inventory</a></i></br></br>
       
        <i class="fa fa-file-text-o"  aria-hidden="true" style= "color: white">
        <a href="../admin/inventoryform">Inventory Form</a></i></br></br>
        
        
        <i class="fa fa-registered"  aria-hidden="true" style= "color: white">
        <a href="../admin/registration">Employee Register</a></i></br></br>
        
        
        
        
     <i class="fa fa-pencil-square-o"  aria-hidden="true" style= "color: white">
        <a href="../admin/pendingitem">New Pending Items</a></i></br></br>
        
        
      <i class="fa fa-comments-o"  aria-hidden="true" style= "color: white">
        <a href="../admin/checkfeedback">Check Feedback</a></i></c:if></br></br>
        
        
        <i class="fa fa-key" aria-hidden="true">
        <a href="../user/changepass">Change
                Password</a></i></br>

 

<li >
    </div>
    
    
    
</body>
</html>