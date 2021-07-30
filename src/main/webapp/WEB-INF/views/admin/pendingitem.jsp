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
<script src="https://cdn.datatables.net/responsive/2.2.6/js/dataTables.responsive.min.js"></script>	
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.js"></script> -->
<script data-require="datatables@*" data-semver="1.10.12" src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js"></script>


<link href="//cdn.datatables.net/responsive/2.1.1/css/dataTables.responsive.css"/>
<link href="https://cdn.datatables.net/responsive/2.2.6/css/responsive.dataTables.min.css"/>
<link href="//cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css"/>
<!-- <link data-require="datatables@*" data-semver="1.10.12" rel="stylesheet" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" />
<link data-require="bootstrap@*" data-semver="4.0.5" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" />
 -->


<!-- <link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->


<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#example').DataTable( {
				responsive: true
            });
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

/* .container-float a:hover {
	background-color: #FFFFFF;
} */
 @media screen and (max-width: 450px)
 {
   
 } 
</style>
</head>

<body class="container-float" style="overflow-y: hidden">

<%-- <spring:url value="/report1" var="xlsURL"></spring:url>
 <a href="${xlsURL}">Excel Report</a>
 --%>

	<table id="example" class="display" style="width: 100%" style="overflow-x:auto;">
		<thead>
			<tr>
				<th>Asset Request No.</th>
				<th>Name</th>
				<th>Emp Id</th>
				<th>Designation</th>
				<th>Category</th>
				<th>Asset Request</th> 
				<th>Dept</th>
				<th>Desk</th>
				<th>Status</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>   
		<c:if test="${typuser=='HR'}">
		<c:forEach items="${pendingforhr}" var="report" varStatus="status">
		
				<tr>
					<td><c:out value="${report.getUnique_id()}" />
					<td><c:out value="${report.getName()}" />
					<td><c:out value="${report.getEid()}" />
					 <td><c:out value="${report.getDesig()}" />
					<td><c:out value="${report.getCategory()}" />
					 <td><button class="collapsible"></button>
						<div class="content">
							<table style="width: 100%" id="grid">
								<tr>
									<th>Asset Request</th>
									<th>Model No</th>
									<th>Serial No</th>
									<th>Condition</th>									
									<th>Procurement Date</th>
									<th>Supplier</th>
									<th>Issue Date</th>
									<th>Warranty Expiration</th>
									<th>Return Date</th>
								
									
								</tr>

								<c:forEach items="${assetrequestlist}" var="childasset"
									varStatus="status">
									<tr>
										<c:if test="${report.asset_id==childasset.asset_id}">


											<td><c:out value="${childasset.getAsset_request()}" />
                                            <td><c:out value="${childasset.getModel_no()}" />
                                            <td><c:out value="${childasset.getSerial_no()}" />
                                            <td><c:out value="${childasset.getCondition1()}" />
                                            <c:if test="${childasset.date=='2020-01-23'}">
                                            <td><c:out value=" " />
                                            </c:if>
                                            <c:if test="${childasset.date>'2020-01-23'}">
                                            <td><c:out value="${childasset.getDate()}" />
                                            </c:if>
                                           
                                            <td><c:out value="${childasset.getSupplier()}" />
                                            <c:if test="${childasset.getIssue_date()=='2020-01-23'}">
                                            <td><c:out value=" " />
                                            </c:if>
                                            <c:if test="${childasset.date>'2020-01-23'}">
                                            <td><c:out value="${childasset.getIssue_date()}" />
                                            </c:if>
                                            <c:if test="${childasset.getWarranty_expiration()=='2020-01-23'}">
                                            <td><c:out value=" " />
                                            </c:if>
                                            <c:if test="${childasset.getWarranty_expiration()>'2020-01-23'}">
                                            <td><c:out value="${childasset.getWarranty_expiration()}"/>
                                            </c:if>
                                            <c:if test="${childasset.getReturn_date()=='2020-01-23'}">
                                            <td><c:out value=" " />
                                            </c:if>
                                            <c:if test="${childasset.getReturn_date()>'2020-01-23'}">
                                            <td><c:out value="${childasset.getReturn_date()}"/>
                                            </c:if>
										</c:if>
									</tr>
								</c:forEach>




							</table>  
 
						</div></td>
					<td><c:out value="${report.getDept()}" />
					<td><c:out value="${report.getDesk()}" />
					<td><c:out value="${report.getStatus()}" /> 
					<%-- <c:if test="${report.status=='Approved'}"> --%>
							<td><a href='../admin/editasset?id=${report.asset_id}&bid=btn1' style="background-color: #FFFFFF;">Edit</a>
							</td>
						<%-- </c:if> <c:if test="${report.status!='Approved'}">
							<td><a href="../admin/editasset?id=${report.asset_id}" style="background-color: #FFFFFF;">Open</a>
						</c:if> --%>
				</tr></c:forEach>
		</c:if>
		<c:if test="${typuser=='ADMIN'}">
		<c:forEach items="${pendingrq}" var="report" varStatus="status">
		
			
				<tr>
					<td><c:out value="${report.getUnique_id()}" />
					<td><c:out value="${report.getName()}" />
					<td><c:out value="${report.getEid()}" />
					 <td><c:out value="${report.getDesig()}" />
					<td><c:out value="${report.getCategory()}" />
					 <td><button class="collapsible"></button>
						<div class="content">
							<table style="width: 100%" id="grid">
								<tr>
									<th>Asset Request</th>
									<th>Model No</th>
									<th>Serial No</th>
									<th>Condition</th>									
									<th>Procurement Date</th>
									<th>Supplier</th>
									<th>Issue Date</th>
									<th>Warranty Expiration</th>
									<th>Return Date</th>
								
									
								</tr>

								<c:forEach items="${assetrequestlist}" var="childasset"
									varStatus="status">
									<tr>
										<c:if test="${report.asset_id==childasset.asset_id}">


											<td><c:out value="${childasset.getAsset_request()}" />
                                            <td><c:out value="${childasset.getModel_no()}" />
                                            <td><c:out value="${childasset.getSerial_no()}" />
                                            <td><c:out value="${childasset.getCondition1()}" />
                                            <c:if test="${childasset.date=='2020-01-23'}">
                                            <td><c:out value=" " />
                                            </c:if>
                                            <c:if test="${childasset.date>'2020-01-23'}">
                                            <td><c:out value="${childasset.getDate()}" />
                                            </c:if>
                                           
                                            <td><c:out value="${childasset.getSupplier()}" />
                                            <c:if test="${childasset.getIssue_date()=='2020-01-23'}">
                                            <td><c:out value=" " />
                                            </c:if>
                                            <c:if test="${childasset.date>'2020-01-23'}">
                                            <td><c:out value="${childasset.getIssue_date()}" />
                                            </c:if>
                                            <c:if test="${childasset.getWarranty_expiration()=='2020-01-23'}">
                                            <td><c:out value=" " />
                                            </c:if>
                                            <c:if test="${childasset.getWarranty_expiration()>'2020-01-23'}">
                                            <td><c:out value="${childasset.getWarranty_expiration()}"/>
                                            </c:if>
                                            <c:if test="${childasset.getReturn_date()=='2020-01-23'}">
                                            <td><c:out value=" " />
                                            </c:if>
                                            <c:if test="${childasset.getReturn_date()>'2020-01-23'}">
                                            <td><c:out value="${childasset.getReturn_date()}"/>
                                            </c:if>
										</c:if>
									</tr>
								</c:forEach>




							</table>  
 
						</div></td>
					<td><c:out value="${report.getDept()}" />
					<td><c:out value="${report.getDesk()}" />
					<td><c:out value="${report.getStatus()}" /> 
					<%-- <c:if test="${report.status=='Approved'}"> --%>
							<td><a href='../admin/editasset?id=${report.asset_id}&bid=btn' style="background-color: #FFFFFF;">Edit</a>
							</td>
						<%-- </c:if> <c:if test="${report.status!='Approved'}">
							<td><a href="../admin/editasset?id=${report.asset_id}" style="background-color: #FFFFFF;">Open</a>
						</c:if> --%>
				</tr>
			</c:forEach></c:if>
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
