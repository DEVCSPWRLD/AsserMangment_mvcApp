<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <meta charset="ISO-8859-1"> -->
<script src="https://cdn.datatables.net/responsive/2.2.6/js/dataTables.responsive.min.js"></script>	
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.js"></script> -->
<script data-require="datatables@*" data-semver="1.10.12" src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js"></script>


<link href="//cdn.datatables.net/responsive/2.1.1/css/dataTables.responsive.css"/>
<link href="https://cdn.datatables.net/responsive/2.2.6/css/responsive.dataTables.min.css"/>
<link href="//cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css"/>

<link rel="stylesheet" type="text/css"
    href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css" />

<!-- <link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 -->
 

<!-- <script type="text/javascript"
    src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
<script type="text/javascript"
    src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#example').DataTable();
    });
</script>
<title>Insert title here</title>
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
<body>
<div class="container-fluid">
 <table id="example" class="display" style="width: 100%" style="overflow-x:auto;">
        <thead>
            <tr>
                <th>Asset Req No.</th>
                <th>Name</th>
                <th>Emp Id</th>
                <th>Designation</th>
                <th>Category</th>
                <th>Asset Request</th>
                <th>Department</th>
                <th>Desk</th>
                <th>Status</th>
                <th>Actions</th>
                <th>Feedback</th>
                
            </tr>
        </thead>
        
        <c:forEach items="${result}" var="asset" varStatus="status">
                    <tr>
                    
                        <td><c:out value="${asset.getUnique_id()}"/></td>
                        <td><c:out value="${asset.getName()}" /></a>
                        <td><c:out value="${asset.getEid()}" />
                        <td><c:out value="${desig}" />
                        <td><c:out value="${asset.getCategory()}" />
                        <td><button class="collapsible"></button>
                        <div class="content">
                            <table style="width: 100%" id="grid">
                                <tr>
                                    <th>Asset Request</th>
                                    <th>Model Name</th>
                                    <th>Serial No</th>
                                    <th>Condition</th>
                                    <!-- <th>Descriptions</th> -->
                                    <th>Date</th>
                                    <th>Brand Name</th>
                                    <th>Tag No</th>
                                    <!-- <th>Unit_price</th>
                                    <th>Quantity</th>
                                    <th>Value</th> -->
                                </tr>

 

                                <c:forEach items="${assetrequestlist}" var="childasset"
                                    varStatus="status">
                                    <tr>
                                        <c:if test="${asset.asset_id==childasset.asset_id}">

 

 

                                            <td><c:out value="${childasset.getAsset_request()}" />
                                            <td><c:out value="${childasset.getModel_no()}" />
                                            <td><c:out value="${childasset.getSerial_no()}" />
                                            <td><c:out value="${childasset.getCondition1()}" /> <%-- <td><c:out value="${childasset.getDescriptions()}" /> --%>
                                           <c:if test="${childasset.getDate()=='2020-01-23'}">
                                            <td><c:out value=" " />
                                            </c:if>
                                            <c:if test="${childasset.date>'2020-01-23'}">
                                            <td><c:out value="${childasset.getDate()}" />
                                            </c:if>
                                            <td><c:out value="${childasset.getSupplier()}" />
                                         	<td><c:out value="${childasset.getTag()}" />
                                        </c:if>
                                    </tr>
                                </c:forEach>

 

 


                            </table>

 

                        </div></td>
                        <td><c:out value="${asset.getDept()}" /></td>
                    <td><c:out value="${asset.getDesk()}" /></td>
                    <td><c:out value="${asset.getStatus()}" /></td>
                     <c:if test="${asset.status=='Sent To Requester'}">
                      <td><a href="../admin/editasset?id=${asset.asset_id}" onMouseOver="this.style.color='black'"
        onMouseOut="this.style.color='blue'">Open</a></td>
                        </c:if>
                    <c:if test="${asset.status=='Closed'}">
                            <td><a href="../admin/editasset?id=${asset.asset_id}" onMouseOver="this.style.color='black'"
        onMouseOut="this.style.color='blue'">Open</a></td>
                        </c:if> 
                                           
                        <c:if test="${asset.status=='Return by HR'}">
                            <td><a href="../admin/editasset?id=${asset.asset_id}" onMouseOver="this.style.color='black'"
        onMouseOut="this.style.color='blue'">Edit</a></td>
                        </c:if>
                        
                        <c:if test="${asset.status=='Return By Reporting Manager'}">
                            <td><a href="../admin/editasset?id=${asset.asset_id}" onMouseOver="this.style.color='black'"
        onMouseOut="this.style.color='blue'">Edit</a></td>
                        </c:if>
                       
                        <c:if test="${asset.status!='Sent To Requester'&& asset.status!='Return by HR' && asset.status!= 'Closed'  && asset.status!= 'Return By Reporting Manager'}">
                            <td><a href="" style="background-color: #FFFFFF;"></a></td>
                        </c:if>
                        <c:if test="${asset.status=='Sent To Requester'}">
                      <td><a href="../user/rating?id=${asset.asset_id}" onMouseOver="this.style.color='black'"
        onMouseOut="this.style.color='blue'">Give Feedback</a></td>
                        </c:if>
                    <c:if test="${asset.status=='Closed'}">
                            <td><a href="../user/rating?id=${asset.asset_id}" onMouseOver="this.style.color='black'"
        onMouseOut="this.style.color='blue'">Give Feedback</a></td>
                        </c:if> 
                    </tr>
                </c:forEach>
        </table> 

</div>

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
/* if (!localStorage.getItem("reload")) {
    /* set reload to true and then reload the page */
   /*  localStorage.setItem("reload", "true");
    location.reload(); */

/* after reloading remove "reload" from localStorage */
/* else {
    localStorage.removeItem("reload"); */
    // localStorage.clear(); // or clear it, instead
</script>
        
</body>
</html>