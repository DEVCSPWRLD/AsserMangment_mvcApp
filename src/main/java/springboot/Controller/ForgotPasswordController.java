package springboot.Controller;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import net.bytebuddy.utility.RandomString;
import springboot.Service.UserNotFoundException;
import springboot.Service.UserService;
import springboot.model.User;
import springboot.utility.Utility;

@Controller
public class ForgotPasswordController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@GetMapping("/forgot_password")
	public String showForgotPasswordForm(Model model) {
		model.addAttribute("pageTitle", "Forgot Password");
		return "forgot";
	}

	@PostMapping("/forgot_password")
	public String processForgotPassword(HttpServletRequest request, Model model) {
		String email = request.getParameter("email");
		String token = RandomString.make(45);
		/*
		 * System.out.println("Email:" + email); System.out.println("Token:" + token);
		 */
		
		  try { 
			  userService.updateResetPasswordToken(token, email); 
			  String resetPasswordLink = Utility.getSiteURL(request) + "/reset_password?token=" + token;
		  sendEmail(email, resetPasswordLink); model.addAttribute("message",
		  "We have sent a reset password link to your email. Please check.");
		  
		  } catch (UserNotFoundException ex) { 
			  model.addAttribute("error", ex.getMessage());
			  } catch
		  (UnsupportedEncodingException | MessagingException e) {
		model.addAttribute("error", "Error while sending email"); }
		  
		  return "forgot";
		 
	}

	private void sendEmail(String email, String resetPasswordLink)
	        throws MessagingException, UnsupportedEncodingException {
	    MimeMessage message = mailSender.createMimeMessage();              
	    MimeMessageHelper helper = new MimeMessageHelper(message);
	     
	    helper.setFrom("contact@shopme.com", "Centroxy Support");
	    helper.setTo(email);
	     
	    String subject = "Here's the link to reset your password";
	     
	    String content = "<p>Hello,</p>"
	            + "<p>You have requested to reset your password.</p>"
	            + "<p>Click the link below to change your password:</p>"
	            + "<p><a href=\"" + resetPasswordLink + "\">Change my password</a></p>"
	            + "<br>"
	            + "<p>Ignore this email if you do remember your password, "
	            + "or you have not made the request.</p>";
	     
	    helper.setSubject(subject);
	     
	    helper.setText(content, true);
	     
	    mailSender.send(message);
	}
	
	  @GetMapping("/reset_password") public String
	  showResetPasswordForm(@Param(value = "token") String token, Model model) {
	  User user= userService.get(token); model.addAttribute("token", token);
	  
	  if (user == null) { 
		  model.addAttribute("title", "Reset Password");
		  model.addAttribute("message", "Invalid Token"); return
	  "message"; }
	  
	  return "reset"; }
	  
	
	  
	  @PostMapping("/reset_password") public String
	  processResetPassword(HttpServletRequest request, Model model) { String token
	  = request.getParameter("token"); String password =
	  request.getParameter("password");
	  
	  User user = userService.get(token); model.addAttribute("title",
	  "Reset your password");
	  
	  if (user == null) { model.addAttribute("message", "Invalid Token"); return
	  "message"; } else { userService.updatePassword(user, password);
	  
	  model.addAttribute("message",
	  "You have successfully changed your password."); }
	  
	  return "message"; }
	 
	 
}
