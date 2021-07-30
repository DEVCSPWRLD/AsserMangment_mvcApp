<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
    href="https://code.highcharts.com/css/highcharts.css" />
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style type="text/css">
.popover{width:100%;
background-color: #4E7E6B;
color: white;
}
.exp
{
margin-left: 50px;
}
.expert
{
margin-left: 50px;
}

</style>


</head>
<body>
<!-- <h2>File Upload & Data Save Page</h2>
        
      <form   action ="../uploadFile" method = "POST" enctype = "multipart/form-data">
      <br /> <br />
         Please select a file to upload :
         <input type = "file" name = "file" value = "Browse File" /> <br /> <br />
         Press here to upload the file :
         <input type = "submit" value = "upload" /> <br /> <br />
       
        </form>
        
         <div align="center">
        <h2></h2>
    </div>
    <figure class="highcharts-figure">
        <div id="container-bar"></div>
    </figure> -->
    <br>
    <br>
         <div align="center">
        <h2></h2>
    </div>
    <figure class="highcharts-figure">
        <div id="container-bar"></div>
    </figure>
   
    <br>
    <br>
    <div align="left" >
    <div class="exp">
<h2>File Import</h2>
       
      <form   action ="../uploadFile" method = "POST" enctype = "multipart/form-data">
     
         Please select a file for import :<input type = "file"  name = "file" value = "Browse File" />
        
        
         Press here to import the file :
         <input type = "submit" value = "import" />
      
        </form>
        </div>
     <div  class="expert">  
        <h2>File Export</h2>
 <form   action = "" method = "GET" id="trxForm" >
 From Date:<input type = "date"  id="fdate" /><div id="fdatevalid" style="color: red"></div><br><br> 
 To Date: <input type = "date"  id="tdate" /><div id="tdatevalid" style="color: red"></div>
 <br>
 <br>
 Please click  for Export :<input type = "submit" value = "export" onclick="getexcel(this);"/> <br /> <br />
 
      
        </form>


        </div>
        </div>
    
    
    
    <script type="text/javascript">
        $(document).ready(
                function() {
                    $.ajax({
                        url : "../get-data",
                        success : function(result) {
                            var yearDtls = [];
                            var countDtls = [];
                            console.log(result);
                            Object.keys(result).forEach(
                                    function(key) {
                                        yearDtls.push(key);
                                        countDtls.push(result[key]);
                                    });
                            drawChart(yearDtls, countDtls);
                        }
                    });
                });
 
        function drawChart(year, viewCounts) {
            Highcharts.chart('container-bar', {
                chart : {
                    type : 'column',
                    styledMode : true
                },
                title : {
                    text : ''
                },
                xAxis : [ {
                    title : {
                        text : 'Status'
                    },
                    categories : year
                } ],
                yAxis : [ {
                    className : 'highcharts-color-0',
                    title : {
                        text : 'Response'
                    }
                } ],
                series : [ {
                    data : viewCounts 
                } ]
            });
        }
    </script>
    
    <script type="text/javascript">
function getexcel()
{
	var fdate=$("#fdate").val();
	var tdate=$("#tdate").val();
	/* alert(fdate);	
	alert(tdate); */
	var url='../report1?id1=' + fdate +'&id2='+tdate ;

$.ajax({
    url : url , //Write a function in the server side which accepts school code as argument
     type:'POST',     
     dataType:'json',//return type from server side function [return it as JSON object]
     contentType: "application/json",
     cache : false,
     timeout : 600000,
     success: function (data) { //Array of data returned from server side function
      
        },
     error: function (data) {
          alert(e);
     }
});   
}

    </script>
    
    
    
    <script type="text/javascript">
    $(function() {
    	$("#fdatevalid").hide();
    	$("#tdatevalid").hide();
    	var error_fdate = false;
    	var error_tdate = false;
    	$("#fdate").focusout(function() {
    		check_fdate();
    		});
    	$("#tdate").focusout(function() {
    		check_tdate();
    		});
    	function check_fdate() {

    		var fname = $("#fdate").val();
    		if (fname !== '') 
    		  {
    		$("#fdatevalid").hide();
    		 
    		} 
    		else {
    		if (fname === '') {
    		$("#fdatevalid").html("Enter Date");
    		$("#fdatevalid").show();

    		error_fdate = true;
    		}

    		}
    		}
    	function check_tdate() {

    		var fname = $("#tdate").val();
    		if (fname !== '') 
    		  {
    		$("#tdatevalid").hide();
    		 
    		} 
    		else {
    		if (fname === '') {
    		$("#tdatevalid").html("Enter Date");
    		$("#tdatevalid").show();

    		error_tdate = true;
    		}

    		}
    		}
    	$("#trxForm").submit(
    			function() {
    				error_tdate = false;
    				error_fdate = false;

    				check_tdate();
    				check_fdate();
    				if (error_tdate === false && error_fdate === false) {

    				return true;
    				} else {
    				swal("Sorry!",
    				"Please Fill The Form Correctly",
    				"error");
    				return false;
    				}
    			});
    });
    				        			
    </script>
</body>
</html>