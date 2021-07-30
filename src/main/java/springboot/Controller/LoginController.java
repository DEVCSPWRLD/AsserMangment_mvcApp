package springboot.Controller;

import java.security.Principal;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import springboot.Repository.AssetRepository;
import springboot.Repository.ReportRepository;
import springboot.Repository.UserRepository;
import springboot.Service.AssetRequestService;
import springboot.Service.ReportService;
import springboot.Service.SaveAssetService;
import springboot.Service.UserService;
import springboot.model.AssetRequest;
import springboot.model.Report;
import springboot.model.SaveAsset;
import springboot.model.User;

@Controller
@RequestMapping
public class LoginController 
{
	@Autowired
	private UserRepository userRepository; 
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder; 

	@Autowired
    private UserService userService;
	
	@Autowired
    private SaveAssetService saveAssetService;
	
    @Autowired
    private AssetRequestService assetRequestService;
	
	@Autowired
	private ReportService reportService;
	
	@Autowired
	private ReportRepository reportRepository;
	
	@Autowired
    private AssetRepository assetRepository;

	
	//User DashBoard View Page 
	@SuppressWarnings("unlikely-arg-type")
	@RequestMapping("/user/dashboard")
	public ModelAndView user(@ModelAttribute("user") User user, HttpSession session, Principal principle,HttpServletRequest request, Model model) {
		
		 int count = 0;
	        int num = assetRepository.countAssetId(count);

	 

	        model.addAttribute("num", num);

	 

	        String status = "Sent To Reporting Manager";
	       
	 

	        List<Report> reportlist = reportService.getuniqueid(status);
	        model.addAttribute("assetId", reportlist);

		
		  String userName = principle.getName(); User currentUser =
		  this.userRepository.getUserByEmail(userName);
		  
		  try {
		  
		  User existing =userService.findByEmail(user.getTypeofuser());
		  
		  if (existing.equals("HR"))
		  
		  { HttpSession httpSession=request.getSession();
		  httpSession.setAttribute("role", "HR"); }
		  
		  else {
		  
		  HttpSession httpSession=request.getSession();
		  httpSession.setAttribute("role", "USER"); } } catch(Exception e) {
		  
		  } session.setAttribute("empid", currentUser.getEmail());
		  session.setAttribute("role", currentUser.getTypeofuser());
		  session.setAttribute("name", currentUser.getFullname());
		 
	return new ModelAndView("/user/dashboard");
	}
	
	
	
	
	
	
	//Admin DashBoard View Page 
	@RequestMapping("/admin/dashboard")
	public ModelAndView admin(@ModelAttribute("user") User user, HttpServletRequest request,Principal principle,HttpSession session, Model model) {
		
		
		
		int reports[] = new int[10];
        int count = 0;
        int num = assetRepository.countAssetId(count);

 

        model.addAttribute("num", num);

 

        String status = "Sent To Reporting Manager";
       
 

        List<Report> reportlist = reportService.getuniqueid(status);
        model.addAttribute("assetId", reportlist);

        int count1 = 0;
        int num1 = assetRepository.countApproved(count1);
        model.addAttribute("num1", num1);
       
        String status1 = "Approved";
        List<Report> pendingforhr = reportService.getuniqueidpending(status1);
        model.addAttribute("pendingforhr", pendingforhr);
        
        

        Map<String, String> map = new LinkedHashMap<>();
        		
        		
		  String userName = principle.getName();
		  User currentUser =this.userRepository.getUserByEmail(userName);
		  
		  try {
		  
		  User existing =userService.findByEmail(user.getTypeofuser());
		  
		  if (existing.equals("HR"))
		  
		  { HttpSession httpSession=request.getSession();
		  httpSession.setAttribute("role", "HR"); }
		  
		  else {
		  
		  HttpSession httpSession=request.getSession();
		  httpSession.setAttribute("role", "USER"); } } catch(Exception e) {
		  
		  } 
			session.setAttribute("empid", userName);
		  System.out.println(session.getAttribute("empid"));
		  session.setAttribute("role", currentUser.getTypeofuser());
		  session.setAttribute("name", currentUser.getFullname());
		return new ModelAndView("/admin/dashboard");
	}
	  @GetMapping("/get-data")
	    public ResponseEntity<Map<String, Integer>> getPieChart() {
	        Map<String, Integer> graphData = new TreeMap<>();
	        
	        int sts=saveAssetService.getStatus();
	        int sts1=saveAssetService.getStatus1();
	        int sts2=saveAssetService.getStatus2();
	        int sts3=saveAssetService.getStatus3();
	        int sts4=saveAssetService.getStatus4();
	        int sts5=saveAssetService.getStatus5();
	        int sts6=saveAssetService.getStatus6();
	        int sts7=saveAssetService.getStatus7();
            int sts8=saveAssetService.getStatus8();
            int sts9=saveAssetService.getStatus9();
	       
	        graphData.put("Approved", sts);
	        graphData.put("Rejected by HR", sts1);
	        graphData.put("Sent to HR",sts2);
	        graphData.put("Return by HR ", sts3);
	        graphData.put("Sent To Requester", sts4);
	        graphData.put("Sent To HR(ON HOLD)", sts5);
	        graphData.put("partially select", sts6);
	        graphData.put("Partially update", sts7);
            graphData.put("Closed", sts8);
            graphData.put("Finally Closed", sts9);
	       
	        return new ResponseEntity<>(graphData, HttpStatus.OK);
	    }

	
	
	//Login View Page
	@RequestMapping("/login")
	public ModelAndView login( HttpSession session ) 
	{
		session.removeAttribute("message1");
		session.removeAttribute("errorMessage");
		return new ModelAndView("login");
	}
	
	//Login Error
	
	/*
	 * @RequestMapping("/loginerror") public String login(HttpServletRequest
	 * request, Model model) { HttpSession session = request.getSession(false);
	 * String errorMessage = null; if (session != null) { AuthenticationException ex
	 * = (AuthenticationException) session
	 * .getAttribute(WebAttributes.AUTHENTICATION_EXCEPTION); if (ex != null) {
	 * errorMessage = ex.getMessage(); } } model.addAttribute("errorMessage",
	 * errorMessage); return "login";
	 */
	
	@RequestMapping("/loginerror")
	public ModelAndView login(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		String errorMessage = null;
		if (session != null) {
			AuthenticationException ex = (AuthenticationException) session
					.getAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
			if (ex != null) {
				errorMessage = ex.getMessage();
			}
		}
		ModelAndView model = new ModelAndView("/login");
		model.addObject("errorMessage", errorMessage);
		return model;
	 
	
	
	
	 }
		/*
		 * //Home View Page
		 * 
		 * @RequestMapping("/home") public ModelAndView home1() { return new
		 * ModelAndView("home"); }
		 */
	
	@RequestMapping("/")
    public ModelAndView home() {
        return new ModelAndView("login");
    }
	
	
	
	//Change Password View Page
	@RequestMapping("/user/changepass")
    public ModelAndView Pass(HttpSession  status) 
	{
		status.removeAttribute("message4");
		status.removeAttribute("message3");
        return new ModelAndView("/user/changepass");
    }
	
	
	
	
	
	//Change Password Logic
	@PostMapping("/user/changepass")
   public String changePassword(@RequestParam("oldpassword") String oldpassword,@RequestParam("newpassword") String newpassword,Principal principle,HttpSession session,HttpServletRequest request)
   {
		
		
		String userName=principle.getName();
		User currentUser=this.userRepository.getUserByEmail(userName);
		
		
		if(this.bCryptPasswordEncoder.matches(oldpassword, currentUser.getPassword()))
		{
			//Change Password
			currentUser.setPassword(this.bCryptPasswordEncoder.encode(newpassword));
			this.userRepository.save(currentUser);
			session.setAttribute("message4", "Your Password Sucessfully Changed");
			return "redirect:/login";
		}
		else
		{
			//error
			session.setAttribute("message3", "Your Old Password is Wrong");
			return "redirect:/user/changepass";
		}
	
		
   }
	
	
	
	
	
	@RequestMapping("/user/openinfo")
	public ModelAndView admin1(@ModelAttribute("saveassetval")SaveAsset saveAsset,@ModelAttribute("user") User user,HttpSession session,Model model,Principal principle,HttpServletRequest request) {
		
	        Object var = session.getAttribute("empid");
	        String eid = String.valueOf(var);
	        List<SaveAsset> result = saveAssetService.getsaveasset(eid);
	        System.out.println(result.size());
	        List<AssetRequest> assetRequest1 = assetRequestService.getAllAssetrequest();        
	        String userName = principle.getName();
	        User currentUser = this.userRepository.getUserByEmail(userName);
	       
	        try {
	        User existing =userService.findByEmail(user.getTypeofuser());
	        if (existing.equals("HR"))
	        {
	        HttpSession httpSession=request.getSession();
	        httpSession.setAttribute("role", "HR");
	        }
	        else
	        {
	        HttpSession httpSession=request.getSession();
	        httpSession.setAttribute("role", "USER");
	        }
	        } catch(Exception e)
	        { 
	        }
	        session.setAttribute("empid", currentUser.getEmail());
	        session.setAttribute("role", currentUser.getTypeofuser());
	        session.setAttribute("name", currentUser.getFullname());
	        ModelAndView mav = new ModelAndView("/user/openinfo");
	        mav.addObject("result", result);
	        model.addAttribute("assetrequestlist", assetRequest1);
	        model.addAttribute("desig", currentUser.getDesig());
	        return mav;
	        
	    }
	
	
	
	
	
}


