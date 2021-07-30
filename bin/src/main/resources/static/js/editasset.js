$(function() {

 

    $("#validDept").hide();
    $("#validDesk").hide();
    $("#validRemark").hide();

 

    var error_fname = false;
    var error_deptdesk = false;
    var error_remark = false;

 

    $("#dept").focusout(function(){
       check_fname();
    });
    $("#desk").focusout(function(){
        check_dept();
     });
    $("#remarks").focusout(function(){
        check_remark();
     });
    

 

    function check_fname() {
      
       var fname = $("#dept").val();
       if (fname !== '') {
          $("#validDept").hide();
          $("#dept").css("border","3px solid #34F458");
       } else 
         {
            if(fname === '')
             {
                 $("#validDept").html("**Enter Dept/Area**");
                 $("#validDept").show();
                 $("#dept").css("border","3px solid #F90A0A");
                 error_fname = true;
              }
          else
          {
               
                     $("#validDept").show();
                    $("#dept").css("border","3px solid #F90A0A");
                     error_fname = true;
            }
          
       }
    }

 

    function check_dept() {
        
        var fname = $("#desk").val();
        if (fname !== '') {
           $("#validDesk").hide();
           $("#desk").css("border","3px solid #34F458");
        } else 
          {
             if(fname === '')
              {
                  $("#validDesk").html("**Enter Desk**");
                  $("#validDesk").show();
                  $("#desk").css("border","3px solid #F90A0A");
                  error_deptdesk = true;
               }
           else
           {
                
                      $("#validDept").show();
                     $("#desk").css("border","3px solid #F90A0A");
                     error_deptdesk = true;
             }
           
        }
     }

 

    function check_remark() {
        
        var fname = $("#remarks").val();
        if (fname !== '') {
           $("#validRemark").hide();
           $("#remarks").css("border","3px solid #34F458");
        } else 
          {
             if(fname === '')
              {
                  $("#validRemark").html("**Enter Remarks**");
                  $("#validRemark").show();
                  $("#remarks").css("border","3px solid #F90A0A");
                  error_remark = true;
               }
           else
           {
                
                      $("#validRemark").show();
                     $("#remarks").css("border","3px solid #F90A0A");
                     error_remark = true;
             }
           
        }
     }

 

   
    $("#trxForm").submit(function() {
       error_fname = false;
       error_deptdesk = false;
       error_remark = false;
          

 

       
       check_fname();
       check_dept();
       check_remark();
       if (error_fname === false &&  error_deptdesk == false && error_remark == false ) {
          
          return true;
       } else {
         swal("Sorry!", "Please Fill The Form Correctly", "error");
          return false;
       }

 


    });
 });