$(function(){
	
	 $("#password_error_message").hide();
     $("#newpassword_error_message").hide();
       $("#retype_password_error_message").hide();

      var error_fname = false;
      var error_newpass = false;
       var error_conpass = false;

       $("#form_password").focusout(function(){
            check_fname();
         });
        $("#form_Npassword").focusout(function(){
            check_newpass();
         });
          $("#form_Cpassword").focusout(function(){
            check_conpass();
         });



         function check_fname() {
            var pattern = /^(?=^.{8,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]/;
            var fname = $("#form_password").val();
            if (pattern.test(fname) && fname !== '') {
               $("#password_error_message").hide();
               $("#form_password").css("border","3px solid #34F458");
            } else 
              {
                 if(fname === '')
                  {
                      $("#password_error_message").html("**Enter Old Password**");
                      $("#password_error_message").show();
                      $("#form_password").css("border","3px solid #F90A0A");
                      error_fname = true;
                   }
               else
               {
                        $("#password_error_message").html("**Invalid Password**");
                          $("#password_error_message").show();
                         $("#form_password").css("border","3px solid #F90A0A");
                          error_fname = true;
                 }
               
            }
         }
          
        function check_newpass(){
            
            var fname = $("#form_password").val();
            var newpass=$("#form_Npassword").val();
            if ((newpass!==fname) && (newpass!=='') ) {
               $("#newpassword_error_message").hide();
               $("#form_Npassword").css("border","3px solid #34F458");
            } else if(newpass===''|| newpass===fname)
              {
                    if(newpass==='')
                       {
                          $("#newpassword_error_message").html("**Enter New Password**");
                      $("#newpassword_error_message").show();
                      $("#form_Npassword").css("border","3px solid #F90A0A");
                     error_newpass = true;
                       }
                      else
                      {
                         $("#newpassword_error_message").html("**Enter Other Password**");
                      $("#newpassword_error_message").show();
                      $("#form_Npassword").css("border","3px solid #F90A0A");
                     error_newpass = true;
                      }
                   
              
               
            }
         }



         function check_conpass(){
            
            var newpass=$("#form_Npassword").val();
            var conpass=$("#form_Cpassword").val();
            if ((newpass===conpass) && (newpass!=='') ) {
               $("#retype_password_error_message").hide();
               $("#form_Cpassword").css("border","3px solid #34F458");
            } else if(newpass===''|| newpass!==conpass)
              {
                    if(newpass==='')
                       {
                          $("#retype_password_error_message").html("**Enter New Password**");
                      $("#retype_password_error_message").show();
                      $("#form_Cpassword").css("border","3px solid #F90A0A");
                     error_conpass = true;
                       }
                      else
                       {
                          $("#retype_password_error_message").html("**Password Did Not Match....Try Again**");
                      $("#retype_password_error_message").show();
                      $("#form_Cpassword").css("border","3px solid #F90A0A");
                     error_conpass = true;
                       }
                     
                   
              
               
            }
         }
     $("#registration_form").submit(function() {
            error_fname = false;
            error_newpass = false;
             error_conpass=false;

            check_fname();
            check_newpass();
              check_conpass();
            
           
            if ( error_fname === false && error_newpass === false &&  error_conpass===false) {
               
               return true;
            } else {
              swal("Sorry!", "Please Fill The Form Correctly", "error");
               return false;
            }

 


         });
	
	
});