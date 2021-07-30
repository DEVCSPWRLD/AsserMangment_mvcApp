$(function() {

         $("#fname_error_message").hide();
         $("#sname_error_message").hide();
         $("#email_error_message").hide();
         $("#password_error_message").hide();
         $("#retype_password_error_message").hide();

         var error_fname = false;
         var error_sname = false;
         var error_email = false;
         var error_password = false;
         var error_retype_password = false;

         $("#form_fname").focusout(function(){
            check_fname();
         });
         $("#form_sname").focusout(function() {
            check_sname();
         });
         $("#form_email").focusout(function() {
            check_email();
         });
         $("#form_password").focusout(function() {
            check_password();
         });
         $("#form_retype_password").focusout(function() {
            check_retype_password();
         });

         function check_fname() {
            var pattern = /^[a-zA-Z ]+$/;
            var fname = $("#form_fname").val();
            if (pattern.test(fname) && fname !== '') {
               $("#fname_error_message").hide();
               $("#form_fname").css("border","3px solid #34F458");
            } else 
              {
	             if(fname === '')
                  {
	                  $("#fname_error_message").html("**Enter Your Name**");
                      $("#fname_error_message").show();
                      $("#form_fname").css("border","3px solid #F90A0A");
                      error_fname = true;
                   }
               else
               {
                    	$("#fname_error_message").html("**Name Should Contain Characters Only**");
                          $("#fname_error_message").show();
                         $("#form_fname").css("border","3px solid #F90A0A");
                          error_fname = true;
                 }
               
            }
         }

         function check_sname() {
            var pattern =/^[A-Za-z0-9 _.-]+$/;
            var sname = $("#form_sname").val()
             if(sname==='')
            {
	              $("#sname_error_message").html("**Enter Employee ID**");
                  $("#sname_error_message").show();
                  $("#form_sname").css("border","3px solid #F90A0A");
                  error_fname = true;
            }
            if (pattern.test(sname) ) {
               $("#sname_error_message").hide();
               $("#form_sname").css("border","3px solid #34F458");
            } 
           if(sname!==''&& !pattern.test(sname))
             {
               $("#sname_error_message").html("**Invalid Employee ID**");
               $("#sname_error_message").show();
               $("#form_sname").css("border","3px solid #F90A0A");
               error_fname = true;
            }
         }
          
           function check_password(){
            var pattern =/^(?=^.{8,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]/;
            var password = $("#form_password").val();
           
            /* if(password=='')
            {
	 alert(password);
	              $("#password_error_message").html("**Enter Password **");
                  $("#password_error_message").show();
                  $("#form_password").css("border","3px solid #F90A0A");
                  error_fname = true;
 alert(password);
            }*/
            
           if(!pattern.test(password) || password == '') {
	
	  if(password=='')
            {
	
	              $("#password_error_message").html("**Enter Password **");
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
	
	
             
            if (pattern.test(password) && password !== '') {
               $("#password_error_message").hide();
               $("#form_password").css("border","3px solid #34F458");
            } 
         }
          
         

         function check_retype_password() {
            var password = $("#form_password").val();
            var retype_password = $("#form_retype_password").val();
            if (password !== retype_password) 
            {
	            /*if( retype_password==='')
                 { 
	              $("#retype_password_error_message").html("**Enter Confirm Password **");
                  $("#retype_password_error_message").show();
                  $("#form_retype_password").css("border","3px solid #F90A0A");
                  error_retype_password = true;
               }
             */
	                 $("#retype_password_error_message").html("** Passwords Did Not Match**");
                  $("#retype_password_error_message").show();
                  $("#form_retype_password").css("border","3px solid #F90A0A");
                  error_retype_password = true;
                
              
            } else {
               $("#retype_password_error_message").hide();
               $("#form_retype_password").css("border","3px solid #34F458");
            }
         }

         function check_email() 
           {
            var pattern =/^[a-z0-9_]+@[a-z0-9-]+(?:\.[a-z0-9-]+)*$/;
            var email = $("#form_email").val();
            
            if (pattern.test(email) && email !== '') {
               $("#email_error_message").hide();
               $("#form_email").css("border","3px solid #34F458");
            } else 
              {
	           if(email=='')
              {
	
               $("#email_error_message").html("**Enter  Email**");
               $("#email_error_message").show();
               $("#form_email").css("border","3px solid #F90A0A");
               error_email = true;
               }
            
              else
             {
	            $("#email_error_message").html("**Invalid Email**");
               $("#email_error_message").show();
               $("#form_email").css("border","3px solid #F90A0A");
               error_email = true;
             }
         }
}

         $("#registration_form").submit(function() {
            error_fname = false;
            error_sname = false;
            error_email = false;
            error_password = false;
            error_retype_password = false;

            check_fname();
            check_sname();
            check_email();
            check_password();
            check_retype_password();

            if ( error_email === false && error_password === false ) {
               
               return true;
            } else {
              swal("Sorry!", "Please Fill The Form Correctly", "error");
               return false;
            }


         });
      });