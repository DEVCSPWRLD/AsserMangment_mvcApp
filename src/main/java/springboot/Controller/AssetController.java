package springboot.Controller;

import java.io.ByteArrayInputStream;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import springboot.Repository.ReportRepository;
import springboot.Repository.SaveAssetRepository;
import springboot.Repository.UserRepository;
import springboot.Service.AssetRequestService;
import springboot.Service.AssetsService;
import springboot.Service.InventoryService;
import springboot.Service.ReportService;
import springboot.Service.SaveAssetService;
import springboot.Service.UserService;
import springboot.model.AssetRequest;
import springboot.model.Assetstype;
import springboot.model.Inventory;
import springboot.model.Report;
import springboot.model.SaveAsset;
import springboot.model.User;
import springboot.utility.Utility;

@Controller
@RequestMapping
public class AssetController {
	private static final Logger logger = LoggerFactory.getLogger(AssetController.class);
	@Autowired
	private ReportService reportService;
	@Autowired
	private SaveAssetService saveAssetService;

	@Autowired
	private AssetsService assetsservice;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private SaveAssetRepository saveAssetRepository;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private ReportRepository reportRepository;
	@Autowired
	private UserService userService;
	@Autowired
	private AssetRequestService AssetRequestService;
	
	@Autowired
	private InventoryService inventoryService;
	
	String var ="";
    String data="";
    String datastatus="Approved";
	
	// ASSET View
	@GetMapping("user/asset")
	public ModelAndView viewlist(@ModelAttribute("assetval") Assetstype assetval, Model model, Principal principal,
			HttpSession session, @RequestParam String eid,Inventory inventory) {
		/*
		 * List<Inventory> inventory1 = inventoryService.getinventoryfrommaster();
		 * Map<String, String> var = new LinkedHashMap<>(); for (int i = 0; i <
		 * inventory1.size(); i++) { var.put(inventory1.get(i).getDevice(),
		 * inventory1.get(i).getDevice());
		 * 
		 * model.addAttribute("inventory1", var.values());
		 * 
		 * 
		 * }
		 */

		
		
		List<Object[]> data1= inventoryService.getinventoryfrommaster();
	    List<String> ft=new  ArrayList<String>();
	    
	    for( int i = 0;i<data1.size();i++) {
	        Object[] userDetails = data1.get(i);       
	        String First = String.valueOf(userDetails[0]);
	       
	        ft.add(First);
	       
	       
	        model.addAttribute("userDetails",ft);
	        
	    }
		String userName = (String) session.getAttribute("empid");
		if (session.getAttribute("empid") == null) {
			ModelAndView result = new ModelAndView("/login");
			return result;
		} else {
			User currentUser = this.userRepository.getUserByEmail(userName);
			Object var1 = currentUser.getEmail();
            String eid1 = String.valueOf(var1);
            List<SaveAsset> result1 = saveAssetService.getsaveasset(eid1);   
            int uniqueid=result1.size()+1;
            model.addAttribute("uniqueid",currentUser.getEid() +"/"+ new java.sql.Date(new java.util.Date().getTime()).toLocalDate()+"/" + uniqueid);
			model.addAttribute("fullname", currentUser.getFullname());
			model.addAttribute("eid", currentUser.getEid());
			model.addAttribute("email", currentUser.getEmail());
			model.addAttribute("desig", currentUser.getDesig());
			ModelAndView result = new ModelAndView("/user/asset");
			return result;
		}

	}

	// ASSET Save Logic
	@RequestMapping(value = "/saveasset", method = { RequestMethod.GET, RequestMethod.POST })
	public String saveAsset(@ModelAttribute("reportval") Report report,@ModelAttribute("assetval") SaveAsset saveasset, RedirectAttributes attr,
			HttpSession session,HttpServletRequest request) throws MessagingException {
		
		String from = (String) session.getAttribute("empid");
		User currentUser = userRepository.getUserByEmail(from);
		String username = currentUser.getFullname();
        String email = currentUser.getEmail();
		 String reportvalue = saveasset.getRemarks();
	        saveasset.setRemarks(reportvalue + "-By" + username + "On Date "
	                + new java.sql.Date(new java.util.Date().getTime()).toLocalDate()+ "\n" + "----------------------------");
	        
	       
		try {

			SaveAsset obj = saveAssetService.saveAsset(saveasset);
			
			attr.addAttribute("msg", obj);
			
		} catch (Exception e) {
			logger.error(e.getMessage());

		}
		
		if (report.getStatus().equalsIgnoreCase("Sent To Reporting Manager")) {
	
		
		//String to[] = userService.getEmail();
		String to = "saiprasad@centroxy.com";
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);

		helper.setSubject("AssetRequest is sending");

		helper.setFrom(from);
		helper.setTo(to);

		boolean html = true;
	

		String assetRequest = report.getAsset_request();
		String remarks = report.getRemarks();		
		String siteLink = Utility.getSiteURL(request) + "/login" ;
		String sendmail = Utility.getSiteURL(request) + "/sendmail" + "?id=" + saveasset.getAsset_id() + "&bid=btn";
		
		String reject = Utility.getSiteURL(request) + "/reject" + "?id=" + saveasset.getAsset_id();
		String hold = Utility.getSiteURL(request) + "/hold" + "?id=" + saveasset.getAsset_id();
		String return1 = Utility.getSiteURL(request) + "/return1" + "?id=" + saveasset.getAsset_id();
		/*
		 * helper.setText("<!DOCTYPE html>\r\n" + "<html>\r\n" + "<head>\r\n" +
		 * "<style>\r\n" + "table, td {\r\n" + "  border: 1px solid black;\r\n" +
		 * "}\r\n" + "</style>\r\n" + "</head>\r\n" + "<body>\r\n" + "\r\n" +
		 * "<table style=\"width:20%\">\r\n" + "  <tr>\r\n" + "    <td>Name</td>\r\n" +
		 * "     <td>" + username + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" +
		 * "    <td>EmailId</td>\r\n" + "    <td>" + email + "</td>\r\n" + "  </tr>\r\n"
		 * + "  <tr>\r\n" + "    <td>AssetRequest</td>\r\n" +
		 * "    <td>"+assetRequest+"</td>\r\n" + "  <tr>\r\n" + " <tr>\r\n" +
		 * "    <td>Remarks</td>\r\n" + "    <td>"+remarks+"</td>\r\n" + "  </tr>\r\n" +
		 * "</table>\r\n" + "\r\n" + "<p><a href=\"" + siteLink +
		 * "\">Go to Webpage</a></p>"+"\r\n" + "</body>\r\n" + "</html>\r\n" + "",
		 * html);
		 * 
		 */
		helper.setText("<!DOCTYPE html>\r\n" + "<html>\r\n" + "<head>\r\n" + "<style>\r\n" + "table, td {\r\n"
				+ "  border: 1px solid black;\r\n" + "}\r\n" + "</style>\r\n" + "</head>\r\n" + "<body>\r\n"
				+ "\r\n" + "<table style=\"width:25%\">\r\n" + "  <tr>\r\n" + "    <td>Name</td>\r\n" + "     <td>"
				+ username + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>EmailId</td>\r\n" + "    <td>"
				+ email + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>AssetRequest</td>\r\n" + "    <td>"
				+ assetRequest + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>Remarks</td>\r\n" + "    <td>"
				+ remarks + "</td>\r\n" + "  </tr>\r\n" + "</table>\r\n" + "<br>"
				+ 
					  "<a href=\"" + sendmail + "\">	<button>Approved</button></a>"+ "<br>" +
					  "<a href=\"" + reject + "\">	<button>Reject</button></a>" + "<br>" +
					  "<a href=\"" + hold + "\">	<button>HOLD</button></a>" + "<br>" +
					  "<a href=\"" + return1 + "\">	<button>Return</button></a>" +
					 "<p><a href=\"" + siteLink + "\">	Go to WebSite</a></p>"
				+ "\r\n" + "</body>\r\n" + "</html>\r\n" + "", html);

		mailSender.send(message);

		}
		
		
		
		
		
		if (report.getStatus().equalsIgnoreCase("Sent To Reporting Manager")) {
				
				//String to[] = userService.getEmail();
				String to = (String) session.getAttribute("empid");
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(message);

				helper.setSubject("AssetRequest is sending");

				helper.setFrom(from);
				helper.setTo(to);

				boolean html = true;
	

				String assetRequest = report.getAsset_request();
				String remarks = report.getRemarks();
				String siteLink = Utility.getSiteURL(request) + "/login" ;
				
				
				helper.setText("<!DOCTYPE html>\r\n" + "<html>\r\n" + "<head>\r\n" + "<style>\r\n" + "table, td {\r\n"
						+ "  border: 1px solid black;\r\n" + "}\r\n" + "</style>\r\n" + "</head>\r\n" + "<body>\r\n"
						+ "\r\n" + "<table style=\"width:25%\">\r\n" + "  <tr>\r\n" + "    <td>Name</td>\r\n" + "     <td>"
						+ username + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>EmailId</td>\r\n" + "    <td>"
						+ email + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>AssetRequest</td>\r\n" + "    <td>"
						+ assetRequest + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>Remarks</td>\r\n" + "    <td>"
						+ remarks + "</td>\r\n" + "  </tr>\r\n" + "</table>\r\n" + "<br>"
						+ "<p><a href=\"" + siteLink + "\">	Go to WebSite</a></p>"
						+ "\r\n" + "</body>\r\n" + "</html>\r\n" + "", html);


				mailSender.send(message);

				}
		
		return "redirect:/user/trackctrl";

	}

	// Track View
	@RequestMapping("/user/trackctrl")
	public ModelAndView search(HttpSession session) {

		Object var = session.getAttribute("empid");
		String eid = String.valueOf(var);
		List<SaveAsset> result = saveAssetService.getsaveasset(eid);
		ModelAndView mav = new ModelAndView("/user/track");
		mav.addObject("result", result);

		return mav;
	}

	// Track Info
	@GetMapping("/user/trackinfo")
	public ModelAndView Editasset(@RequestParam("asset_id") String asset_id,@ModelAttribute("saveassetval")SaveAsset saveAsset, Model model, HttpSession session,
			Principal principal, String assetname) {

		String userName = principal.getName();
		try {
			User currentUser = this.userRepository.getUserByEmail(userName);
			model.addAttribute("fullname", currentUser.getFullname());
			model.addAttribute("eid", currentUser.getEid());

			SaveAsset assetdetail = this.saveAssetRepository.getSaveAssetByAssetId(asset_id);
			model.addAttribute("assetrequest", assetdetail.getAsset_request());
			model.addAttribute("uniqueid",assetdetail.getUnique_id());
			model.addAttribute("category", assetdetail.getCategory());
			model.addAttribute("remarks", assetdetail.getRemarks());
			model.addAttribute("status", assetdetail.getStatus());
		} catch (Exception e) {
			logger.error(e.getMessage());
		} 
		ModelAndView result = new ModelAndView("/user/trackinfo");
		return result;
	}
	
	@PostMapping("/uploadFile") 
	public String readExel(@RequestParam("file") MultipartFile multipartFile) throws Exception {
	try {
	byte file[]=multipartFile.getBytes();
	ByteArrayInputStream fis=new ByteArrayInputStream(file);
	// File file = new File("D:\\project\\information.centroxyy1.xlsx"); // creating a new file instance
	// FileInputStream fis = new FileInputStream(file); // obtaining bytes from the file
	// creating Workbook instance that refers to .xlsx file
	XSSFWorkbook wb = new XSSFWorkbook(fis);
	XSSFSheet sheet = wb.getSheetAt(0); // creating a Sheet object to retrieve object
	Iterator<Row> itr = sheet.iterator(); // iterating over excel file

	int j = 1;
	while (itr.hasNext()) {
	SaveAsset saveAsset = new SaveAsset();
	AssetRequest assetRequest = new AssetRequest();
	Row row = itr.next();
	int i = 1;
	Iterator<Cell> cellIterator = row.cellIterator(); // iterating over each column
	while (cellIterator.hasNext()) {
	if (j == 1) {
	break;
	}
	Cell cell = cellIterator.next();

	CellType c = cell.getCellType();
	// System.out.println(c);
	String s = c.toString();
	System.out.println();
	// 
	if (s.equals("STRING")) {
	System.out.print(cell.getStringCellValue() + "\t\t\t");
	if (i == 1) {
	saveAsset.setName(cell.getStringCellValue());
	} else if (i == 4) {
	saveAsset.setEmail(cell.getStringCellValue());
	} else if (i == 5) {
	saveAsset.setCategory(cell.getStringCellValue());
	} else if (i == 6) {
	saveAsset.setAsset_request(cell.getStringCellValue());
	assetRequest.setAsset_request(cell.getStringCellValue());
	}

	else if (i == 7) {
	assetRequest.setSupplier(cell.getStringCellValue());
	} else if (i == 8) {
	assetRequest.setModel_no(cell.getStringCellValue());
	} else if (i == 9) {
	assetRequest.setSerial_no(cell.getStringCellValue());
	} else if (i == 10) {
	assetRequest.setCondition1(cell.getStringCellValue());
	} else if (i == 11) {
	assetRequest.setDescriptions(cell.getStringCellValue());
	} 
	 else if (i == 12) { 
	 assetRequest.setInformation(cell.getStringCellValue()); }

	else if (i == 20) {
	saveAsset.setDept(cell.getStringCellValue());
	} else if (i == 21) {
	saveAsset.setDesk(cell.getStringCellValue());
	} else if (i == 22) {
	saveAsset.setRemarks(cell.getStringCellValue());
	}  else if (i == 23) {
        if(datastatus.equals(cell.getStringCellValue()))
        {
            saveAsset.setStatus("Sent To Requester");
        }
        else
        {
        
    saveAsset.setStatus(cell.getStringCellValue());
        }
	} else if (i == 24) {
	assetRequest.setTag(cell.getStringCellValue());
	  saveAsset.setUnique_id(var + "/" + new java.sql.Date(new java.util.Date().getTime()).toLocalDate()+"/" + cell.getStringCellValue()); 
	} else if (i == 3) {
	saveAsset.setDesig(cell.getStringCellValue());
	}

	} else if (s.equals("NUMERIC")) {
	System.out.print(cell.getNumericCellValue() + "\t\t\t");
	  if (i == 2) {
	        if(data.equals(Integer.toString((int) cell.getNumericCellValue())))
	                {
	                
	                }
	        else {
	            var="";
	            data=Integer.toString((int) cell.getNumericCellValue());
	            var =var+ Integer.toString((int) cell.getNumericCellValue());
	            System.out.println(var);
//	             saveAsset.setEid(Integer.toString((int) cell.getNumericCellValue()));
	             
	        }
	        saveAsset.setEid(var);
//	             var =var+ Integer.toString((int) cell.getNumericCellValue());
//	             System.out.println(var);
//	         saveAsset.setEid(Integer.toString((int) cell.getNumericCellValue()));
	    }
	else if (i == 17) {
	assetRequest.setUnit_price(Double.toString(cell.getNumericCellValue()));
	} else if (i == 18) {
	assetRequest.setQuantity(Double.toString(cell.getNumericCellValue()));
	} else if (i == 19) {
	assetRequest.setValue(Double.toString(cell.getNumericCellValue()));
	}
	else if (i == 13) { 
	 System.out.println(row.getCell(12).getDateCellValue());
	SimpleDateFormat ss=new SimpleDateFormat("yyyy-MM-dd");
	Date sss=row.getCell(12).getDateCellValue();
	String s1=ss.format(sss);
	System.out.println(s1);
	 assetRequest.setDate(s1); 
	 } else if (i == 14) { 
	 System.out.println(row.getCell(13).getDateCellValue());
	SimpleDateFormat ss=new SimpleDateFormat("yyyy-MM-dd");
	Date sss=row.getCell(13).getDateCellValue();
	String s1=ss.format(sss);
	System.out.println(s1);
	 assetRequest.setIssue_date(s1);
	 } else if (i == 15) {
	 System.out.println(row.getCell(14).getDateCellValue());
	SimpleDateFormat ss=new SimpleDateFormat("yyyy-MM-dd");
	Date sss=row.getCell(14).getDateCellValue();
	String s1=ss.format(sss);
	System.out.println(s1);
	 assetRequest.setWarranty_expiration(s1);
	 } else if (i==16) { 
	 System.out.println(row.getCell(15).getDateCellValue());
	SimpleDateFormat ss=new SimpleDateFormat("yyyy-MM-dd");
	Date sss=row.getCell(15).getDateCellValue();
	String s1=ss.format(sss);
	System.out.println(s1);
	 assetRequest.setReturn_date(s1); 
	 }
	} 
	i++;
	}
	if (j > 1) {
	String name=saveAsset.getName();
	saveAssetRepository.save(saveAsset);
	int id=0;
	List<SaveAsset> list=saveAssetRepository.findByName(name);
	for (SaveAsset saveAsset2 : list) {
	id=saveAsset2.getAsset_id();
	}
	assetRequest.setAsset_id(id);
	AssetRequestService.saveAssetRequest(assetRequest);//child
	}
	j++;
	System.out.println("");
	}

	} catch (Exception e) {
	e.printStackTrace();
	}

	return "redirect:/admin/report";
	}
	
}
