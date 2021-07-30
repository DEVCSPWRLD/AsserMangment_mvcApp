<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/topnav.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

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


<title>Inventory</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <script type="text/javascript" src="js/Login.js"></script> -->
<!-- <script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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

.btn-primary {
color: #fff;
background-color: #4E7E6B;
border-color: #2e6da4;
}
</style>
</head>
<body>
<div class="space"></div>
<div class="col-md right">
<div class="container h-100">
<div class="row align-items-center h-100">
<div class="card shadow border-0 mx-auto">
<div class="card-header p-4"></div>
<div class="loader h-100">
<div class="dots" style="display: none; opacity: 0">
<div style="position: absolute; bottom: 35%; left: 30%;"
class="row justify-content-center">

</div>
</div>

<div class="row">
<div class="card-body" style="width: 55vw;">
<h5 class="text-grey text-center mt-0 font-weight-bold">Inventory Form</h5>
<form:form class="form-horizontal" action="../admin/saveinventory"
                                    modelAttribute="inventory" cssClass="float-label" id="trxForm"
                                    name="myform" method="POST" enctype="multipart/form-data"
                                    onsubmit="return  Validate()">
<div class="form-group p-1">   


<div class="container" style="width: inherit;">

<!---------------------------------------SUPPLIER---------------------------------------------  -->
<label class="control-label required"> Supplier </label>
<input style="color: black" type="text" name="supplier"
id="supplier" class="form-control">
<div id="validSupp" class="text-danger" font-weight-bold></div>
<input type="hidden" name=assign value=0>
<!---------------------------------------Brand NAME---------------------------------------------  -->
<label class="control-label required"> Brand Name </label>
<input style="color: black" type="text" name="brandname"
id="brandname" class="form-control">
<div id="validbrandname" class="text-danger" font-weight-bold></div>
<!---------------------------------------Category---------------------------------------------  -->
<label class="control-label required"> Category </label> <select
style="color: black" id="category" name="category"
class="form-control">
<option value="">Select</option>
<option value="Hardware">Hardware</option>
<option value="Software">Software</option>
</select>
<div id="validCat" class="text-danger" font-weight-bold></div>
<!---------------------------------------DEVICE---------------------------------------------  -->
<%-- <label class="control-label required"> Device </label>
<select name="device" id="device" class="form-control">
<option value="">Select</option>
                                                        <c:forEach var="assetslist" items="${assetslist}">
                                                            <option value="${assetslist}">${assetslist}</option>      
                                                            </c:forEach>
                                                        </select> --%>
<label class="control-label required"> Device</label>
<input style="color: black" type="text" name="device"
id="device" class="form-control">
<div id="validDev" class="text-danger" font-weight-bold></div>
<!---------------------------------------DEVICE MODEL NUMBER---------------------------------------------  -->
<label class="control-label required"> Device Model Name </label> 
<input style="color: black" type="text" name="devicemodelno"
id="deviceMo" class="form-control">
<div id="validMo" class="text-danger" font-weight-bold></div>
<!---------------------------------------DEVICE SERIAL NUMBER---------------------------------------------  -->
<label class="control-label required"> Device Serial No. </label> 
<input style="color: black" type="text" name="deviceserialno"
id="deviceSl" class="form-control">
<div id="validSl" class="text-danger" font-weight-bold></div>
<!---------------------------------------ENTRYDATE---------------------------------------------  -->
                                                    <label class="control-label required"> Entry date </label>
                                                    <input style="color: black" type="date" name="entrydate"
                                                       
                                                        id="entrydate" class="form-control">
                                                    <div id="validEntrydate" class="text-danger" font-weight-bold></div>
<!---------------------------------------WARRENTY---------------------------------------------  -->
<label class="control-label required"> Warranty </label> 
<input style="color: black" type="date" name="warrenty"
id="warrenty" class="form-control">
<div id="validWrty" class="text-danger" font-weight-bold></div>
<!---------------------------------------PRICE---------------------------------------------  -->
<label class="control-label required">Unit Price </label> 
<input style="color: black" type="number" name="price"
id="price" class="form-control">
<div id="validPrice" class="text-danger" font-weight-bold></div>
<!---------------------------------------TAG---------------------------------------------  -->
                                                    <label class="control-label required"> Tag name </label>
                                                    <input style="color: black" type="text" name="tag"
                                                       
                                                        id="tag" class="form-control">
                                                    <div id="validtag" class="text-danger" font-weight-bold></div>
                                                   <!---------------------------------------TAG---------------------------------------------  -->
                                                    <label class="control-label required">Owner Name</label>
                                                    <input style="color: black" type="text" name="ownername"
                                           
                                                        id="ownername" class="form-control">
                                                    <div id="validowner" class="text-danger" font-weight-bold></div>
                                                    <!---------------------------------------BILL_NO---------------------------------------------  -->
                                                    <label class="control-label required"> Bill No </label>
                                                    <input style="color: black" type="text" name="bill_no"
                                                       
                                                        id="bill_no" class="form-control">
                                                    <div id="validbill_no" class="text-danger" font-weight-bold></div>
                                                   
                                                    Please select a file for import :<input type = "file"  name = "file" value = "Browse File" />
                                                    <!---------------------------------------po_value---------------------------------------------  -->
                                                    <label class="control-label required"> PO value </label>
                                                    <input style="color: black" type="text" name="po_value"
                                                       
                                                        id="po_value" class="form-control">
                                                    <div id="validpo_value" class="text-danger" font-weight-bold></div>
                                                    
                                                    <!-- -----------------------------------upload invoice-------------------------------- -->
                                                    <!-- <label class="control-label required">invoice upload</label>
                                                    <input style="color: black" type="text" name="invoice"
                                                    
                                                       
                                                        id="invoice" class="form-control">
                                                        <input type = "file"  name = "file" value = "Browse File" />
                                                    <div id="invoice" class="text-danger" font-weight-bold></div>
                                                     -->
<!-- ------------------------------------------------SUBMIT-------------------------------------->
<br>
<div class="container" >
                                        <div class="row">
                                      <div class="col-md-4">
    <div class="btn-group"> 
<div class="row">
<button value="submit" id="submit"
class="btn btn-primary mr-2 ml-4"
onclick="Validate(); returnfalse">
<span class="btn-text">Save</span>
<div class="row"></div>
</button>
<button value="submit" id="submit"
class="btn btn-primary mr-2 ml-4">
<span class="btn-text"><a style="text-decoration: none; color: white" href="../admin/report">Cancel</a></span>
<div class="row"></div>
</button>
</div>
</div>
</div>
</div>
</div>
</form:form>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<script>
$(function() {

     $("#validSupp").hide(); 
     $("#validCat").hide();   
     $("#validDev").hide();
     $("#validSl").hide();
     $("#validMo").hide();
     $("#validWrty").hide();
     $("#validPrice").hide();
     $("#validtag").hide();
     $("#validbill_no").hide();
     $("#validpo_value").hide();
     $("#validbrandname").hide();
     $("#validEntrydate").hide();
     $("#validowner").hide();
 
     var error_supplier = false;
     var error_category = false;
     var error_device = false;
     var error_serial = false;
     var error_model = false;
     var error_warrenty = false;
     var error_price = false;
     var error_tag = false;
     var error_bill_no = false;
     var error_po_value = false;
     var error_entrydate=false;
     var error_brandname=false;
var error_ownername=false;

$("#ownername").focusout(function(){
         check_ownername();
      });
     $("#brandname").focusout(function(){
         check_brandname();
      });
     $("#category").focusout(function(){
         check_category();
      });
     $("#supplier").focusout(function(){
           check_supplier();
        });
     
     $("#device").focusout(function(){
            check_device();
         });
     $("#deviceSl").focusout(function(){
            check_devicesl();
         });
    $("#deviceMo").focusout(function(){
            check_devicemo();
         }); 
     $("#warrenty").focusout(function(){
            check_warrenty();
         });
     $("#price").focusout(function(){
            check_price();
         });
     $("#tag").focusout(function(){
            check_tag();
         }); 
     $("#bill_no").focusout(function(){
            check_bill_no();
         });
     $("#po_value").focusout(function(){
            check_po_value();
         });

     $("#entrydate").focusout(function(){
         check_entrydate();
      });

     function check_ownername(){
         var pattern = /^[a-zA-Z ]*$/;
         var ownername = $("#ownername").val();
         if (pattern.test(ownername) && ownername !== '') {
            $("#validowner").hide();
            $("#ownername").css("border-bottom","3px solid #34F458");
         } else {
             if(ownername === '')
             {
                 $("#validowner").html("Enter Brand Name");
                 $("#validowner").show();
                 $("#ownername").css("border-bottom","3px solid #F90A0A");
                 error_ownername = true;
              }
          else
          {
            $("#validbrandname").html("Should contain only Characters");
            $("#validbrandname").show();
            $("#brandname").css("border-bottom","3px solid #F90A0A");
            error_ownername = true;
         }
      }
   }
     
     function check_brandname(){
         var pattern = /^[a-zA-Z ]*$/;
         var brandname = $("#brandname").val();
         if (pattern.test(brandname) && brandname !== '') {
            $("#validbrandname").hide();
            $("#brandname").css("border-bottom","3px solid #34F458");
         } else {
             if(brandname === '')
             {
                 $("#validbrandname").html("Enter Brand Name");
                 $("#validbrandname").show();
                 $("#brandname").css("border-bottom","3px solid #F90A0A");
                 error_brandname = true;
              }
          else
          {
            $("#validbrandname").html("Should contain only Characters");
            $("#validbrandname").show();
            $("#brandname").css("border-bottom","3px solid #F90A0A");
            error_brandname = true;
         }
      }
   }
     /* function check_category() {
var catg = $("#category").val();
if (catg !== '') {
$("#validCat").hide();

} else {
if (catg === '') {
$("#validCat").html("Enter Category");
$("#validCat").show();

error_category = true;
} else {

$("#validCat").show();
$("#category").css("border-bottom", "3px solid #F90A0A");
error_category = true;
}

}
}
  */  



  function check_category() {
	    var catg = $("#category").val();
	    if (catg !== '') {
	       $("#validCat").hide();
	       $("#category").css("border-bottom","3px solid #34F458");
	    } else {
	       
	            $("#validCat").html("Enter Category");
	            $("#validCat").show();
	            $("#category").css("border-bottom","3px solid #F90A0A");
	            error_category = true;
	         }
	}      
     function check_supplier() {
            var pattern = /^[a-zA-Z ]*$/;
            var supplier = $("#supplier").val();
            if (pattern.test(supplier) && supplier !== '') {
               $("#validSupp").hide();
               $("#supplier").css("border-bottom","3px solid #34F458");
            } else {
                if(supplier === '')
                {
                    $("#validSupp").html("Enter Supplier Name");
                    $("#validSupp").show();
                    $("#supplier").css("border-bottom","3px solid #F90A0A");
                    error_supplier = true;
                 }
             else
             {
               $("#validSupp").html("Should contain only Characters");
               $("#validSupp").show();
               $("#supplier").css("border-bottom","3px solid #F90A0A");
               error_supplier = true;
            }
         }
      }
 
     function check_device() {  
         var device = $("#device").val();
         if (device !== '') {
            $("#validDev").hide();
            $("#device").css("border-bottom","3px solid #34F458"); 
         } else 
           {
                   $("#validDev").html("Enter Device Required");
                   $("#validDev").show();
                   $("#device").css("border-bottom","3px solid #F90A0A");
                   error_device = true;
           }  
         
      }

 

     function check_devicesl() {  
         var deviceSl = $("#deviceSl").val();
         if (deviceSl !== '') {
            $("#validSl").hide();
            $("#deviceSl").css("border-bottom","3px solid #34F458"); 
         } else 
           {
              
                   $("#validSl").html("Enter Device Serial Number");
                   $("#validSl").show();
                   $("#deviceSl").css("border-bottom","3px solid #F90A0A");
                   error_serial = true;
                }
         
      }  

 


     function  check_devicemo() {  
         var deviceMo = $("#deviceMo").val();
         if (deviceMo !== '') {
            $("#validMo").hide();
            $("#deviceMo").css("border-bottom","3px solid #34F458"); 
         } else 
           {
                   $("#validMo").html("Enter Model Number");
                   $("#validMo").show();
                   $("#deviceMo").css("border-bottom","3px solid #F90A0A");
                   error_model = true;
                }
      }  

 

     
     function  check_warrenty() {  
         var warrenty = $("#warrenty").val();
         if (warrenty !== '') {
            $("#validWrty").hide();
            $("#warrenty").css("border-bottom","3px solid #34F458"); 
         } else 
           {
                   $("#validWrty").html("Enter Warrenty Date");
                   $("#validWrty").show();
                   $("#warrenty").css("border-bottom","3px solid #F90A0A");
                   error_warrenty = true;
                }
      } 

 


      
     function check_price() {
            var price = $("#price").val();
            if (price !== '') {
               $("#validPrice").hide();
               $("#price").css("border-bottom","3px solid #34F458");  
            } else {
                
                    $("#validPrice").html("Enter Price");
                    $("#validPrice").show();
                    $("#price").css("border-bottom","3px solid #F90A0A"); 
                    error_price = true;
                 }
      } 

 

 

     function  check_tag() {  
         var tag = $("#tag").val();
         if (tag !== '') {
            $("#validtag").hide();
            $("#tag").css("border-bottom","3px solid #34F458"); 
         } else 
           {
                   $("#validtag").html("Enter Tag Name");
                   $("#validtag").show();
                   $("#tag").css("border-bottom","3px solid #F90A0A");
                   error_tag = true;
                }
      }  

 

     
     function  check_bill_no() {  
         var bill_no = $("#bill_no").val();
         if (bill_no !== '') {
            $("#validbill_no").hide();
            $("#bill_no").css("border-bottom","3px solid #34F458"); 
         } else 
           {
                   $("#validbill_no").html("Enter Warrenty Date");
                   $("#validbill_no").show();
                   $("#bill_no").css("border-bottom","3px solid #F90A0A");
                   error_bill_no = true;
                }
      } 

 


      
     function check_po_value() {
            var po_value = $("#po_value").val();
            if (po_value !== '') {
               $("#validpo_value").hide();
               $("#po_value").css("border-bottom","3px solid #34F458");  
            } else {
                
                    $("#validpo_value").html("Enter Price");
                    $("#validpo_value").show();
                    $("#po_value").css("border-bottom","3px solid #F90A0A"); 
                    error_po_value = true;
                 }
      } 


     function check_entrydate() {
         var entrydates = $("#entrydate").val();
         if (entrydates !== '') {
            $("#validEntrydate").hide();
            $("#entrydate").css("border-bottom","3px solid #34F458");  
         } else {
             
                 $("#validEntrydate").html("Enter Entry date");
                 $("#validEntrydate").show();
                 $("#entrydate").css("border-bottom","3px solid #F90A0A"); 
                 error_entrydate = true;
              }
   } 
  
     
      $("#trxForm").submit(function() {

 

          error_supplier = false;
            error_device = false;
            error_serial = false;
            error_category = false;
            error_model = false;
            error_warrenty = false;
            error_price = false; 
           error_tag = false;
             error_bill_no = false;
             error_po_value = false;
             error_entrydate = false;
             error_brandname = false;
             error_ownername = false;
             
             check_supplier();
             check_category();
             check_device(); 
             check_devicesl();
             check_devicemo();
             check_warrenty(); 
             check_price();
             check_tag();
             check_bill_no();
             check_po_value();
             check_entrydate();
             check_brandname();
             check_ownername();
             if (error_supplier === false && error_category === false  && error_device === false &&  error_ownername === false && error_brandname === false && error_serial === false  && error_model === false && error_warrenty === false && error_price === false  && error_tag ===false && error_bill_no ===false && error_po_value === false &&  error_entrydate === false) {      
                 return true;
              } else {
                swal("Sorry!", "Please Fill The Form Correctly", "error");
                 return false;
              }1

 

           });
        });
</script> 




</body>
</html>
