<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <meta charset="ISO-8859-1" name="viewport"
	content="width=device-width, initial-scale=1.0"> -->



<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css" />



<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#example').DataTable();
    });
</script>
<style type="text/css">
#grid {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#grid td, #grid th {
	border: 1px solid #ddd;
	padding: 8px;
}

#grid tr:nth-child(even) {
	background-color: #f2f2f2;
}

#grid tr:hover {
	background-color: #ddd;
}

#grid th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #4E7E6B;
	color: white;
}

.collapsible {
	color: black;
	cursor: pointer;
	border: none;
	text-align: left;
	outline: none;
	font-size: 15px;
}

.collapsible:after {
	content: '\002B';
	color: Black;
	font-weight: bold;
	float: left;
	margin-left: 5px;
}

.active:after {
	content: "\2212";
}

.content {
	padding: 0 18px;
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.2s ease-out;
	background-color: #f1f1f1;
}
@media screen and (max-width: 450px)
 {
   
 }
</style>
</head>
<body class="container-float" style="overflow-y: hidden">
	<table id="example" class="display" style="width: 100%" style="overflow-x:auto;">
		<thead>
			<tr>
				<th>Name</th>
				<th>Emp Id</th>
				<th>Category</th>
				<th>Asset Request</th>
				<th>Department</th>
				<th>Desk</th>
				<th>Status</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${reportlist}" var="report" varStatus="status">
				<tr>
					<td><c:out value="${report.getName()}" />
					<td><c:out value="${report.getEid()}" />
					<td><c:out value="${report.getCategory()}" />
					<td><button class="collapsible"></button>
						<div class="content">
							<table style="width: 50%" id="grid">
								<tr>
									<th>Asset_request</th>
									<th>Model_no</th>
									<th>Serial_no</th>
									<th>Condition1</th>
									<!-- <th>Descriptions</th> -->
									<th>Date</th>
									<th>Supplier</th>
									<th>Warranty_expiration</th>
									<!-- <th>Unit_price</th>
									<th>Quantity</th>
									<th>Value</th> -->
								</tr>

								<c:forEach items="${assetrequestlist}" var="childasset"
									varStatus="status">
									<tr>
										<c:if test="${report.asset_id==childasset.asset_id}">



											<td><c:out value="${childasset.getAsset_request()}" />
											<td><c:out value="${childasset.getModel_no()}" />
											<td><c:out value="${childasset.getSerial_no()}" />
											<td><c:out value="${childasset.getCondition1()}" /> <%-- <td><c:out value="${childasset.getDescriptions()}" /> --%>
											<td><c:out value="${childasset.getDate()}" />
											<td><c:out value="${childasset.getSupplier()}" />
											<td><c:out
													value="${childasset.getWarranty_expiration()}" /> <%-- <td><c:out value="${childasset.getUnit_price()}" />
											<td><c:out value="${childasset.getQuantity()}" />
											<td><c:out value="${childasset.getValue()}" /> --%>
										</c:if>
									</tr>
								</c:forEach>




							</table>

						</div></td>
					<td><c:out value="${report.getDept()}" />
					<td><c:out value="${report.getDesk()}" />
					<td><c:out value="${report.getStatus()}" /> 
					<c:if test="${report.status=='Approved'}">
							<td><a href="/admin/editasset?id=${report.asset_id}">Edit</a>
							</td>
						</c:if> <c:if test="${report.status!='Approved'}">
							<td><a href="/admin/editasset?id=${report.asset_id}">Open</a>
						</c:if>
				</tr>
			</c:forEach>
		</tbody>

	</table>
	<script>
var coll = document.getElementsByClassName("collapsible");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.maxHeight){
      content.style.maxHeight = null;
    } else {
      content.style.maxHeight = content.scrollHeight + "px";
    } 
  });
}
</script>

</body>
</html>
