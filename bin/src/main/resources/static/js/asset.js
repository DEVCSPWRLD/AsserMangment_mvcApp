$(function() {
    $("#validCat").hide();
    $("#validRemarks").hide();
    var error_fname = false;
    var error_remarks = false;
    $("#category").focusout(function(){
       check_fname();
    });
    $("#remarks").focusout(function(){
        check_remark();
     });
 function check_fname() {  
       var fname = $("#category").val();
       if (fname !== '') {
          $("#validCat").hide();
          $("#category").css("border","3px solid #34F458");
       } else 
         {
            if(fname === '')
             {
                 $("#validCat").html("**Enter Category**");
                 $("#validCat").show();
                 $("#category").css("border","3px solid #F90A0A");
                 error_fname = true;
              }
          else
          {
               
                     $("#validCat").show();
                    $("#category").css("border","3px solid #F90A0A");
                     error_fname = true;
            }
          
       }
    }
    function check_remark() {
        
        var remark = $("#remarks").val();
             if(remark === '')
              {
                  $("#validRemarks").html("**Enter Remarks**");
                  $("#validRemarks").show();
                  $("#remarks").css("border","3px solid #F90A0A");
                  error_remarks = true;
               }
           else
           {      if(remark !== '')
                
                      $("#validRemarks").hide();
                     $("#remarks").css("border","3px solid green");                    
             }      
     }
    $("#trxForm").submit(function() {
       error_fname = false;
       error_remarks = false;     
       check_fname();
       check_remark();   
       if (error_fname === false && error_remarks == false) {      
          return true;
       } else {
         swal("Sorry!", "Please Fill The Form Correctly", "error");
          return false;
       }

    });
 });