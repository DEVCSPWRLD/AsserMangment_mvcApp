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


<script type="text/javascript"
    src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#example').DataTable();
    });
</script>
<title>Insert title here</title>
<style>
* {
  box-sizing: border-box;
}

.row {
  margin-left:500px;
  margin-right:600px;
}
  
.column {
  float: left;
  padding: 0px;
}
.column1 {
  float: right;
  padding: 0px;
}

/* Clearfix (clear floats) */
.row::after {
  content: "";
  clear: both;
  display: table;
}

table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
}

th, td {
  text-align: left;
  padding: 16px;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}
</style>
</head>
<body>

<div class="row">
  <div class="column">
    <table>
      <tr>
        <th bgcolor=" #4E7E6B">Device</th>
      </tr>
       <c:forEach items="${userDetails1}" var="data1" >
      <tr>
        <td><c:out value="${data1}"/></td>
      </tr>
      </c:forEach>
    </table>
  </div>
   <div class="column">
    <table>
      <tr>
        <th bgcolor=" #4E7E6B">Assigned</th>
      </tr>
       <c:forEach items="${userDetails }" var="data2" >
      <tr>
        <td><c:out value="${data2}"/></td>
      </tr>
      </c:forEach>
    </table>
  </div>
   
   <div class="column1">
    <table>
      <tr>
        <th bgcolor=" #4E7E6B">Not Assigned</th>
      </tr>
       <c:forEach items="${userDetails2}" var="data4" >
      <tr>
        <td><c:out value="${data4}"/></td>
      </tr>
      </c:forEach>
    </table>
  </div>
  <div class="column1">
    <table >
      <tr>
        <th bgcolor=" #4E7E6B">Device</th>
      </tr>
       <c:forEach items="${userDetails3}" var="data3" >
      <tr>
        <td><c:out value="${data3}"/></td>
      </tr>
      </c:forEach>
    </table>
  </div>
</div>



 <table id="example" class="display" style="width: 100%" style="overflow-x:auto;">
        <thead>
				<tr>
    			<th>Sl No.</th>
                <th>Supplier</th>
                <th>Device</th>
                <th>Entry date</th>
                <th>Device Serial No.</th>
                <th>Device Model No.</th>
                <th>Warranty</th>              
                 <th>Unit Price</th>
                 <th>Tag name</th>             
                 <th>Bill No</th>
                 <th>PO value</th>
                 <th>File Name</th>
                  <th>Inventory Status</th>

            </tr>
        </thead>
        
        <c:forEach items="${data}" var="data" >
                    <tr>
						<td><c:out value="${data.getId()}"/></td>
                        <td><c:out value="${data.getSupplier()}" />
                        <td><c:out value="${data.getDevice()}" />
                        <td><c:out value="${data.getEntrydate()}" />
                        <td><c:out value="${data.getDeviceserialno()}" />
                        <td><c:out value="${data.getDevicemodelno()}" />
                         <td><c:out value="${data.getWarrenty()}" />
                          <td><c:out value="${data.getPrice()}" />
                          <td><c:out value="${data.getTag()}" />
                         <td><c:out value="${data.getBill_no()}" />
                          <td><c:out value="${data.getPo_value()}" />
                        
                          <td><a href = "<c:url value = "../admin/${data.getFilename()}"/>"><c:out value="${data.getFilename()}" /></a></td>
                          
                          <c:if test="${data.getAssign()==1}">
                          <td><c:out value="Assigned" /></c:if>
                          <c:if test="${data.getAssign()==0}">
                          <td><c:out value="Not Assigned" /></c:if>
                    </tr>
                </c:forEach>
        </table> 

</div>

</body>
</html>
