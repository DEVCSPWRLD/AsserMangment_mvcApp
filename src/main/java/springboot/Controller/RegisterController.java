package springboot.Controller;

 

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import springboot.Service.UserService;
import springboot.model.User;
import springboot.utility.Utility;

 

	@Controller
	public class RegisterController {
    private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);
    
    
    @Autowired
    private JavaMailSender mailSender;
    
    @Autowired
    private UserService userService;
	/*
	 * @Autowired private UserRepository userRepository;
	 */

	//Register View Page
      @RequestMapping("/admin/registration")
      public String showform(HttpSession session) 
      {
    	  session.removeAttribute("message2");
    	  return "/admin/registration"; 
      }
  

    //Register Save Logic
      @RequestMapping(value = "/save", method = { RequestMethod.POST }) 
      public String saveUser(@ModelAttribute("user")User user ,HttpSession session,@RequestParam("email") String email,HttpServletRequest request,HttpServletResponse response) throws MessagingException, UnsupportedEncodingException 
      {
    	  session.setAttribute("empid", user.getEid());
      try 
      {
      User existing =userService.findByEmail(user.getEmail());
      if(existing !=null)
      {
    	  HttpSession httpSession=request.getSession();
          httpSession.setAttribute("message2", "Email Already Exist");
    	  return "redirect:/admin/registration";
    	  
      }
      else
      {
    	  userService.saveUser(user);
    	  HttpSession httpSession=request.getSession();
          httpSession.setAttribute("message1", "Registration Successful");
    	  
      }
      }
      
      catch(Exception e) 
      { 
    	  logger.error(e.getMessage()); 
      }

		String to = user.getEmail();
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);

		helper.setSubject("Welcome to Asset management Tool");

		helper.setFrom("contact@Asset.com", "Centroxy Support");
		helper.setTo(to);

		boolean html = true;

		
	    String name = user.getFullname();
	        String email1 = user.getEmail();
	        String password=user.getCpassword();
	        String siteLink = Utility.getSiteURL(request) + "/login";
	        helper.setText("<img style=\"-webkit-user-select: none;margin: auto;cursor: zoom-in;\"\n"
	                + "        src=\"https://centroxy.com/wp-content/uploads/2018/04/centroxy-logo-black.png\" width=\"300\" height=\"80\">\n"
	                + "\n" + "    <div><br><br>\n" + "        <p>Dear\""  + name
	                +  ",</p><br>Welcome to Asset Management Tool\n"
	                + "        <p>This e-mail confirms that your account is now active and\n"
	                + "            ready using the following e-mail address:<p>" + email1 + "</p>\n"+ "     "
	               
	                + "            ready using the following password:<p>" + password + "</p>\n"
	                + "        <br><br>With Heart,<p>The Centroxy Team\n" + "        </p><br>\n"
	                + "<p><a href=\"" + siteLink + "\">Go to Webpage</a></p>" + "    </div>", html);

		
		 mailSender.send(message); 

      return "redirect:/admin/dashboard"; 
      }
     
      

}  

