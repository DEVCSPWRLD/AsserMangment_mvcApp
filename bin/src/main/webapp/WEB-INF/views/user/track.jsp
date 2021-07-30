<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1" name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
#grid {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
   width: 100%; 
 
}

#grid td, #grid th {
  border: 1px solid #ddd;
  padding: 10px;
}

#grid tr:nth-child(even){background-color: #f2f2f2;}


#grid tr:hover {background-color: #ddd;}


#grid th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4E7E6B;
  color: white;
}
</style>
</head>
<body>
<form action="">
<div style="overflow-x:auto;">
<table class="table" style="width: 100%" id="grid">

				<tr>
					<th>Name</th>
					<th>Emp Id</th>
					<th>Category</th>
					<th>Asset Request</th>
					<th>Status</th>
				</tr>
				<c:forEach items="${result}" var="asset" varStatus="status">
					<tr>
						<td><a href = "<c:url value = "/user/trackinfo/${asset.getAsset_id()}"/>"><c:out value="${asset.getName()}" /></a>
						<td><c:out value="${asset.getEid()}" />
						<td><c:out value="${asset.getCategory()}" />
						<td>
                        <c:forEach var="splt" items="${fn:split(asset.getAsset_request(),',')}">
                            <div style="margin: 0px 0px -24px 0px;">${splt} </div> </br>
                        </c:forEach>
                        </td>
						<td><c:out value="${asset.getStatus()}" />
					</tr>
				</c:forEach>

			</table>
</form>
</body>
</html>