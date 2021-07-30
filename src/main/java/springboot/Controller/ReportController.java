package springboot.Controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.binary.Hex;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

import springboot.Repository.AssetRepository;
import springboot.Repository.InventoryRepository;
import springboot.Repository.UserRepository;
import springboot.Service.AssetRequestService;
import springboot.Service.AssetsService;
import springboot.Service.InventoryService;
import springboot.Service.ReportService;
import springboot.Service.UserService;
import springboot.model.AssetRequest;
import springboot.model.Assetstype;
import springboot.model.Inventory;
import springboot.model.Report;
import springboot.model.User;
import springboot.utility.Utility;

@Controller
@RequestMapping
public class ReportController {
	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);
	@Autowired
	private ReportService reportService;
	@Autowired
	private AssetsService assetsservice;
	@Autowired
	private AssetRequestService assetRequestService;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private UserService userService;
	@Autowired
	UserRepository userRepository;
	@Autowired
	private AssetRepository assetRepository;
	@Autowired
	private InventoryService inventoryService;
	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private InventoryRepository inven;

	
	@RequestMapping(value = "/admin/checkfeedback", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView checkfeedback(Model model)
    {
   
    List<Report> feedback=reportService.viewfeedback();
    model.addAttribute("feedbackdata",feedback);
   
    
    List<AssetRequest> assetRequest1 = assetRequestService.getAllAssetrequest();
    model.addAttribute("assetrequestlist", assetRequest1);
        ModelAndView mav= new ModelAndView("/admin/checkfeedback");
        return mav;
    }
   
@RequestMapping(value = "/admin/pendingitem", method = { RequestMethod.GET, RequestMethod.POST })
public ModelAndView pendingitem(Model model,Principal principle)
{
   
    String userName = principle.getName();
    User currentUser = this.userRepository.getUserByEmail(userName);
    String status = "Sent To Reporting Manager";
    List<Report> reportlist1 = reportService.getuniqueid(status);
    model.addAttribute("pendingrq", reportlist1);
    String status1 = "Approved";
    List<Report> pendingforhr = reportService.getuniqueidpending(status1);
    model.addAttribute("typuser",currentUser.getTypeofuser());
    model.addAttribute("pendingforhr",pendingforhr);
    ModelAndView mav= new ModelAndView("/admin/pendingitem");
    return mav;
}
@RequestMapping(value = "user/rating", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView viewstar(HttpSession session,Principal principle,@RequestParam(value="id") Integer asset_id,Model model,@ModelAttribute("assetval") Report report)
    {
    model.addAttribute("id",asset_id);
    String detail=reportService.viewreportdetailof(asset_id);
    model.addAttribute("detail",detail);
    String userName = principle.getName();
    User currentUser = this.userRepository.getUserByEmail(userName);
    session.setAttribute("typuser", currentUser.getTypeofuser());
    model.addAttribute("typuser",currentUser.getTypeofuser());
        ModelAndView mav= new ModelAndView("/user/rating");
        return mav;
    }
   
    @RequestMapping(value = "/savestar", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView savestar(@RequestParam(value="asset_id") Integer asset_id,Integer feedback,@ModelAttribute("assetval") Report report)
    {
        Integer f=reportService.savefeedback(report, asset_id);
       
        ModelAndView mav= new ModelAndView("redirect:/user/openinfo");
        return mav;
    }
	
	
	// Report View Page
	@GetMapping("/admin/report")
	public String viewlist(Model model, String desig) {

		List<Report> reportlist = reportService.getAllReportList();
		model.addAttribute("reportlist", reportlist);

		int count = 0;
		int num = assetRepository.countAssetId(count);

		model.addAttribute("num", num);
		String status = "Sent To HR";
		List<Report> reportlist1 = reportService.getuniqueid(status);
		model.addAttribute("assetId", reportlist1);

		List<AssetRequest> assetRequest1 = assetRequestService.getAllAssetrequest();
		model.addAttribute("assetrequestlist", assetRequest1);
		return "/admin/report";

	}
	

@RequestMapping(value = "/report1", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    
    public String excel(@RequestParam("id2") String id2,@RequestParam("id1") String id1)  throws Exception{
        
List<AssetRequest> cdata=assetRequestService.getallexcel(id1, id2);

 

        List<Report> reportlist = reportService.getAllReportList();

 

        XSSFWorkbook workbook = new XSSFWorkbook();
        XSSFSheet sheet = workbook.createSheet("Report");

 

        createHeader(sheet, workbook);

 

        int rowCount = 0;

 

        for (AssetRequest report : cdata) {

			Row row = sheet.createRow(++rowCount);

			Cell asset_requestCell = row.createCell(5);
			asset_requestCell.setCellValue(report.getAsset_request());

			Cell modelnoCell = row.createCell(6);
			modelnoCell.setCellValue(report.getModel_no());

			Cell serialnoCell = row.createCell(7);
			serialnoCell.setCellValue(report.getSerial_no());

			Cell conditionCell = row.createCell(8);
			conditionCell.setCellValue(report.getCondition1());
			if (report.getDate().equalsIgnoreCase("2020-01-23")) {
				Cell ProcurementDateCell = row.createCell(9);
				ProcurementDateCell.setCellValue(" ");
			} else {
				Cell ProcurementDateCell = row.createCell(9);
				ProcurementDateCell.setCellValue(report.getDate());
			}
			Cell SupplierCell = row.createCell(10);
			SupplierCell.setCellValue(report.getSupplier());
			if (report.getIssue_date().equalsIgnoreCase("2020-01-23")) {
				Cell IssuedateCell = row.createCell(11);
				IssuedateCell.setCellValue(" ");
			} else {
				Cell IssuedateCell = row.createCell(11);
				IssuedateCell.setCellValue(report.getIssue_date());
			}
			if (report.getWarranty_expiration().equalsIgnoreCase("2020-01-23")) {
				Cell WarrentyExpirationCell = row.createCell(12);
				WarrentyExpirationCell.setCellValue(" ");
			} else {
				Cell WarrentyExpirationCell = row.createCell(12);
				WarrentyExpirationCell.setCellValue(report.getWarranty_expiration());
			}

			if (report.getReturn_date().equalsIgnoreCase("2020-01-23")) {
				Cell ReturndateCell = row.createCell(13);
				ReturndateCell.setCellValue(" ");
			} else {
				Cell ReturndateCell = row.createCell(13);
				ReturndateCell.setCellValue(report.getReturn_date());
			}

			Cell UnitPriceCell = row.createCell(14);
			UnitPriceCell.setCellValue(report.getUnit_price());

			Cell QuantityCell = row.createCell(15);
			QuantityCell.setCellValue(report.getQuantity());

			Cell ValueCell = row.createCell(16);
			ValueCell.setCellValue(report.getValue());

			for (Report report1 : reportlist) {
				if (report.getAsset_id().equals(report1.getAsset_id())) {

					Cell UniquenoCell = row.createCell(0);
					UniquenoCell.setCellValue(report1.getUnique_id());

					Cell nameCell = row.createCell(1);
					nameCell.setCellValue(report1.getName());

					Cell eidCell = row.createCell(2);
					eidCell.setCellValue(report1.getEid());

					Cell designationCell = row.createCell(3);
					designationCell.setCellValue(report1.getDesig());

					Cell categoryCell = row.createCell(4);
					categoryCell.setCellValue(report1.getCategory());

					Cell DeptCell = row.createCell(17);
					DeptCell.setCellValue(report1.getDept());

					Cell DeskCell = row.createCell(18);
					DeskCell.setCellValue(report1.getDesk());

					Cell RemarksCell = row.createCell(19);
					RemarksCell.setCellValue(report1.getRemarks());

					Cell StatusCell = row.createCell(20);
					StatusCell.setCellValue(report1.getStatus());
				}

			}
		}

		try (FileOutputStream outputStream = new FileOutputStream(new File("D:\\excel\\report.xlsx"))) {
			workbook.write(outputStream);
		} finally {

			workbook.close();

		}
		return "redirect:/admin/report";

	}

	private static String createHeader(XSSFSheet sheet, XSSFWorkbook workbook) throws Exception {
		XSSFFont font = workbook.createFont();
		font.setFontHeightInPoints((short) 11);
		font.setFontName("Arial");
		font.setBold(true);

		String rgbS = "FFF000";
		byte[] rgbB = Hex.decodeHex(rgbS); // get byte array from hex string
		XSSFColor color = new XSSFColor(rgbB, null); // IndexedColorMap has no usage until now. So it can be set null.

		XSSFCellStyle cellStyle = (XSSFCellStyle) workbook.createCellStyle();
		cellStyle.setFillForegroundColor(color);
		cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		cellStyle.setFont(font);

		Row headerRow = sheet.createRow(0);
		Cell cell = headerRow.createCell(0);
		cell.setCellValue("AssetRequest No");
		Cell cell1 = headerRow.createCell(1);
		cell1.setCellValue("Name");
		Cell cell2 = headerRow.createCell(2);
		cell2.setCellValue("Emp Id.");
		Cell cell3 = headerRow.createCell(3);
		cell3.setCellValue("Designation");
		Cell cell4 = headerRow.createCell(4);
		cell4.setCellValue("Category");
		Cell cell5 = headerRow.createCell(5);
		cell5.setCellValue("Asset Request");
		Cell cell6 = headerRow.createCell(6);
		cell6.setCellValue("Model No.");
		Cell cell7 = headerRow.createCell(7);
		cell7.setCellValue("Serial No.");
		Cell cell8 = headerRow.createCell(8);
		cell8.setCellValue("Condition");
		Cell cell9 = headerRow.createCell(9);
		cell9.setCellValue("Procurement Date");
		Cell cell10 = headerRow.createCell(10);
		cell10.setCellValue("Supplier");
		Cell cell11 = headerRow.createCell(11);
		cell11.setCellValue("Issue Date");
		Cell cell12 = headerRow.createCell(12);
		cell12.setCellValue("Warrenty Expiration");
		Cell cell13 = headerRow.createCell(13);
		cell13.setCellValue("Return Date");
		Cell cell14 = headerRow.createCell(14);
		cell14.setCellValue("Unit Price");
		Cell cell15 = headerRow.createCell(15);
		cell15.setCellValue("Quantity");
		Cell cell16 = headerRow.createCell(16);
		cell16.setCellValue("Value");
		Cell cell17 = headerRow.createCell(17);
		cell17.setCellValue("Department");
		Cell cell18 = headerRow.createCell(18);
		cell18.setCellValue("Desk");
		Cell cell19 = headerRow.createCell(19);
		cell19.setCellValue("Remarks");
		Cell cell20 = headerRow.createCell(20);
		cell20.setCellValue("Status");
		cell.setCellStyle(cellStyle);
		cell1.setCellStyle(cellStyle);
		cell2.setCellStyle(cellStyle);
		cell3.setCellStyle(cellStyle);
		cell4.setCellStyle(cellStyle);
		cell5.setCellStyle(cellStyle);
		cell6.setCellStyle(cellStyle);
		cell7.setCellStyle(cellStyle);
		cell8.setCellStyle(cellStyle);
		cell9.setCellStyle(cellStyle);
		cell10.setCellStyle(cellStyle);
		cell11.setCellStyle(cellStyle);
		cell12.setCellStyle(cellStyle);
		cell13.setCellStyle(cellStyle);
		cell14.setCellStyle(cellStyle);
		cell15.setCellStyle(cellStyle);
		cell16.setCellStyle(cellStyle);
		cell17.setCellStyle(cellStyle);
		cell18.setCellStyle(cellStyle);
		cell19.setCellStyle(cellStyle);
		cell20.setCellStyle(cellStyle);
		return "/admin/report";
	}

	@RequestMapping(value = "/getModuleSelfTesting1", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Inventory> getModuleSelfTesting1(@RequestParam("id3") String id3) {

		List ll = new ArrayList<>();
System.out.println(id3);
		Optional<Inventory> i = inven.findBytag(id3);

		if (i.isPresent()) {
			ll.add(i.get().getDeviceserialno());
			ll.add(i.get().getPrice());
			ll.add(i.get().getWarrenty());
			ll.add(i.get().getTag());
//			inventoryService.getUpdatemasterinventory(id3);

		}
		Iterator ii = ll.iterator();
		while (ii.hasNext()) {
			System.out.println(ii.next());
		}
		return ll;
	}

	@RequestMapping(value = "/getModuleSelfTesting", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Inventory> getModuleSelfTesting(@RequestParam("id1") String id1,
			@RequestParam("id2") String id2) {

		ObjectMapper objectMapper = new ObjectMapper();
		String arrayToJson = "";
		// Set pretty printing of json
		List _list = new ArrayList<>();

		StringBuffer _sqlQueryCrList = new StringBuffer("select devicemodelno from master_inventory where device=" + "'"
				+ id2 + "'" + "AND supplier=" + "'" + id1 + "'" + "AND assign=0" +" " +"GROUP BY devicemodelno");
		NativeQuery crList = sessionFactory.openSession().createSQLQuery(_sqlQueryCrList.toString());
	              System.out.println(_sqlQueryCrList);
		_list = crList.list();
		objectMapper.enable(SerializationFeature.INDENT_OUTPUT);
		System.out.println(_list);
		return _list;
	}

// tagno fetching by ajax	
	@RequestMapping(value = "/gettag", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Inventory> gettag(@RequestParam("id1") String id1,
			@RequestParam("id2") String id2,@RequestParam("id3") String id3) {

		ObjectMapper objectMapper = new ObjectMapper();
		String arrayToJson = "";
		// Set pretty printing of json
		List _list1 = new ArrayList<>();
//	              System.out.println(id1+"column value");

		StringBuffer _sqlQueryCrList = new StringBuffer("select tag from master_inventory where device=" + "'"
				+ id2 + "'" + "AND supplier=" + "'" + id1 + "'" + "AND devicemodelno=" + "'" + id3 + "'");
		NativeQuery crList = sessionFactory.openSession().createSQLQuery(_sqlQueryCrList.toString());
	              System.out.println(_sqlQueryCrList);
		_list1 = crList.list();
		objectMapper.enable(SerializationFeature.INDENT_OUTPUT);
		System.out.println(_list1);
		return _list1;
	}
	
	// Edit Asset page view
	@RequestMapping(value = "/admin/editasset", method = RequestMethod.GET)
	public ModelAndView editLocation(HttpServletRequest request, @ModelAttribute("assetval") Assetstype assetval,
			@ModelAttribute("assetrequest") AssetRequest assetRequest, Model model2, Principal principle, Model model3,
			HttpSession session,Inventory inventory) {

		int count = 0;
		int num = assetRepository.countAssetId(count);
		model3.addAttribute("num", num);

		 int count1 = 0;
	        int num1 = assetRepository.countApproved(count1);
	        model3.addAttribute("num1", num1);
		String status = "Sent To Reporting Manager";

		List<Report> reportlist = reportService.getuniqueid(status);
		model3.addAttribute("assetId", reportlist);

		
		String status1 = "Approved";
        List<Report> pendingforhr = reportService.getuniqueidpending(status1);
        model3.addAttribute("pendingforhr", pendingforhr);
		
		
//		List<Assetstype> assetslistval = assetsservice.getAllAssetsList();	
//		Map<String, String> var = new LinkedHashMap<>();
//		for (int i = 0; i < assetslistval.size(); i++) {
//			var.put(assetslistval.get(i).getAssetstype(), assetslistval.get(i).getAssetstype());
//			model2.addAttribute("assetslist", assetslistval);	
//			model2.addAttribute("assetslist", var.values());

		String userName = principle.getName();
		User currentUser = this.userRepository.getUserByEmail(userName);
		session.setAttribute("empid", currentUser.getEmail());
		session.setAttribute("role", currentUser.getTypeofuser());
		session.setAttribute("name", currentUser.getFullname());
		//List<Assetstype> assetslist = assetsservice.getAllAssetsList();
		Map<String, String> var = new LinkedHashMap<>();
		Map<String, String> var1 = new LinkedHashMap<>();
		Map<String, String> var2 = new LinkedHashMap<>();
		Map<String, String> var3 = new LinkedHashMap<>();
		Map<String, String> var4 = new LinkedHashMap<>();

		HashMap<String, String> new_hash_map = new HashMap<String, String>();
		Map<String, String> new_hash_map1 = new LinkedHashMap<String, String>();
		Map<String, String> new_hash_map2 = new LinkedHashMap<String, String>();
		Map<String, String> new_hash_map3 = new LinkedHashMap<String, String>();

		/*
		 * for (int i = 0; i < assetslist.size(); i++) {
		 * var.put(assetslist.get(i).getAssetstype(),
		 * assetslist.get(i).getAssetstype());
		 * 
		 * model2.addAttribute("assetslist", var.values()); }
		 */
		
		

		List<Object[]> data1= inventoryService.getinventoryfrommaster();
	    List<String> ft=new  ArrayList<String>();
	    
	    for( int p = 0;p<data1.size();p++) {
	        Object[] userDetails = data1.get(p);       
	        String First = String.valueOf(userDetails[0]);
	       
	        ft.add(First);
	       
	       
	        model2.addAttribute("userDetails",ft);
	    }
		int assetId = Integer.parseInt(request.getParameter("id"));
		Report report = reportService.getReportData(assetId);

		String assetreqvalue = report.getAsset_request();

		List<AssetRequest> reportchild = assetRequestService.getAssetrequest(assetId);

		model2.addAttribute("reportchild", reportchild);
		List<String> selctedotherincall = Arrays.asList(assetreqvalue.split("\\s*,\\s*"));
		for (int i = 0; i < selctedotherincall.size(); i++) {
			var.put(selctedotherincall.get(i), selctedotherincall.get(i));

			List<Inventory> inv = inventoryService.getinventorydevice(selctedotherincall.get(i));
			for (int j = 0; j < inv.size(); j++) {
				var1.put(inv.get(j).getSupplier(), inv.get(j).getSupplier());

				new_hash_map.putAll(var1);
				model2.addAttribute("device", new_hash_map.values());

			}
			List<Inventory> inv1 = inventoryService.getinventorydevice(selctedotherincall.get(i));
			for (int k = 0; k < inv1.size(); k++) {
				var2.put(inv1.get(k).getDevicemodelno(), inv1.get(k).getDevicemodelno());
				var3.put(inv1.get(k).getDeviceserialno(), inv1.get(k).getDeviceserialno());
				var4.put(inv1.get(k).getWarrenty(), inv1.get(k).getWarrenty());

				new_hash_map1.putAll(var2);
				new_hash_map2.putAll(var3);
				new_hash_map3.putAll(var4);

				model2.addAttribute("devicemodelno1", new_hash_map1.values());
				model2.addAttribute("deviceserialno1", new_hash_map2.values());
				model2.addAttribute("devicewarrenty1", new_hash_map3.values());

			}

			String action = request.getParameter("bid");
	
			int asset_id = Integer.parseInt(request.getParameter("id"));
			try {
				if (action.equalsIgnoreCase("btn")) {
					reportService.updateNotification(asset_id);
					System.out.println("rrrr");
					// model3.addAttribute("notification", notification);
				}
				else if(action.equalsIgnoreCase("btn1")) {
					reportService.updateNotification1(asset_id);
				}
			} catch (Exception e) {
				logger.error(e.getMessage());

			}

			model2.addAttribute("selctedotherincall", selctedotherincall);
		}
		ModelAndView model = new ModelAndView("/admin/editasset");
		model.addObject("report", report);

		return model;
	}

	// Edit Asset Logic
	@RequestMapping(value = "/updateasset", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView UpdateReport(@ModelAttribute("assetval") Report report,
			@ModelAttribute("assetrequest") AssetRequest assetRequest, RedirectAttributes attr, HttpSession session,
			Integer asset_id, HttpServletRequest request, Principal principle,Inventory inventory) throws MessagingException {
		String userName = principle.getName();
		User currentUser = this.userRepository.getUserByEmail(userName);
		session.setAttribute("empid", currentUser.getEmail());
		session.setAttribute("role", currentUser.getTypeofuser());
		session.setAttribute("name", currentUser.getFullname());

		report.setAsset_id(report.getAsset_id());
		String remarkshist = report.getHistory();
		String reportvalue = report.getRemarks();
		String Status = report.getStatus();
		String user = currentUser.getTypeofuser();

		/*
		 * String Remarksval=remarkshist + "\n" + reportvalue + "-By Requester On Date "
		 * + new java.sql.Date(new java.util.Date().getTime()).toLocalDate() + "\n" +
		 * "---------------------------------------"; System.out.println(Remarksval);
		 */
		if (Status.equalsIgnoreCase("Sent To Reporting Manager") && user.equalsIgnoreCase("ADMIN")) {
			report.setRemarks(remarkshist + "\n" + reportvalue + "-By" + currentUser.getFullname() +"On Date"

					+ new java.sql.Date(new java.util.Date().getTime()).toLocalDate() + "\n"
					+ "---------------------------------------");
			reportService.updateReport(report, asset_id);
		}
		if (Status.equalsIgnoreCase("Sent To Reporting Manager") && user.equalsIgnoreCase("USER")) {
			report.setRemarks(remarkshist + "\n" + reportvalue +  "-By" + currentUser.getFullname() +"On Date"
					+ new java.sql.Date(new java.util.Date().getTime()).toLocalDate() + "\n"
					+ "---------------------------------------");
			reportService.updateReport(report, asset_id);
			
		}
		if (Status.equalsIgnoreCase("Sent To HR") && user.equalsIgnoreCase("HR")) {
			report.setRemarks(remarkshist + "\n" + reportvalue +  "-By" + currentUser.getFullname() +"On Date"
					+ new java.sql.Date(new java.util.Date().getTime()).toLocalDate() + "\n"
					+ "---------------------------------------");
			reportService.updateReport(report, asset_id);
			ModelAndView model = new ModelAndView("redirect:/admin/report");
			return model;
		}
		if (Status.equalsIgnoreCase("Return by HR")) {
			report.setRemarks(remarkshist + "\n" + reportvalue +  "-By" + currentUser.getFullname() +"On Date"
					+ new java.sql.Date(new java.util.Date().getTime()).toLocalDate() + "\n"
					+ "---------------------------------------");
			reportService.updateReport(report, asset_id);
		}
		if (Status.equalsIgnoreCase("Pending To Approver") && (user.equalsIgnoreCase("HR"))) {
			report.setRemarks(remarkshist + "\n" + reportvalue + "-By" + currentUser.getFullname() +"On Date"
					+ new java.sql.Date(new java.util.Date().getTime()).toLocalDate() + "\n"
					+ "---------------------------------------");
			reportService.updateReport(report, asset_id);
		}
		if (report.getStatus().equalsIgnoreCase("Sent To Requester")) {
			report.setRemarks(remarkshist + "\n" + reportvalue + "-By" + currentUser.getFullname() +"On Date"
					+ new java.sql.Date(new java.util.Date().getTime()).toLocalDate() + "\n"
					+ "---------------------------------------");
			reportService.updateReport(report, asset_id);
		}
		if (Status.equalsIgnoreCase("Approved")) {
			report.setRemarks(remarkshist + "\n" + reportvalue + "-By" + currentUser.getFullname() +"On Date"
					+ new java.sql.Date(new java.util.Date().getTime()).toLocalDate() + "\n"
					+ "---------------------------------------");
			reportService.updateReport(report, asset_id);
		}
		if (Status.equalsIgnoreCase("Rejected by HR")) {
			report.setRemarks(remarkshist + "\n" + reportvalue +  "-By" + currentUser.getFullname() +"On Date"
					+ new java.sql.Date(new java.util.Date().getTime()).toLocalDate() + "\n"
					+ "---------------------------------------");
			reportService.updateReport(report, asset_id);
		}
		if (Status.equalsIgnoreCase("Reject by Reporting Manager")) {
			report.setRemarks(remarkshist + "\n" + reportvalue +  "-By" + currentUser.getFullname() +"On Date"
					+ new java.sql.Date(new java.util.Date().getTime()).toLocalDate() + "\n"
					+ "---------------------------------------");
			reportService.updateReport(report, asset_id);
		}
		if (Status.equalsIgnoreCase("Sent To HR(ON HOLD)")) {
			report.setRemarks(remarkshist + "\n" + reportvalue +  "-By" + currentUser.getFullname() +"On Date"
					+ new java.sql.Date(new java.util.Date().getTime()).toLocalDate() + "\n"
					+ "---------------------------------------");
			reportService.updateReport(report, asset_id);

		}
		if (Status.equalsIgnoreCase("Pending To Reporting Manager(ON HOLD)")) {
			report.setRemarks(remarkshist + "\n" + reportvalue +  "-By" + currentUser.getFullname() +"On Date"
					+ new java.sql.Date(new java.util.Date().getTime()).toLocalDate() + "\n"
					+ "---------------------------------------");
			reportService.updateReport(report, asset_id);
		}
		if (Status.equalsIgnoreCase("Return By Reporting Manager")) {
			report.setRemarks(remarkshist + "\n" + reportvalue + "-By" + currentUser.getFullname() +"On Date"
					+ new java.sql.Date(new java.util.Date().getTime()).toLocalDate() + "\n"
					+ "---------------------------------------");
			reportService.updateReport(report, asset_id);
		}
		if (Status.equalsIgnoreCase("partially select")) {
			report.setRemarks(remarkshist + "\n" + reportvalue +  "-By" + currentUser.getFullname() +"On Date"
					+ new java.sql.Date(new java.util.Date().getTime()).toLocalDate() + "\n"
					+ "---------------------------------------");

			reportService.updateReport(report, asset_id);

		}
		if (Status.equalsIgnoreCase("Partially update")) {
			report.setRemarks(remarkshist + "\n" + reportvalue + "-By" + currentUser.getFullname() +"On Date"
					+ new java.sql.Date(new java.util.Date().getTime()).toLocalDate() + "\n"
					+ "---------------------------------------");
			reportService.updateReport(report, asset_id);
		}
		if (Status.equalsIgnoreCase("Closed")) {
			report.setRemarks(remarkshist + "\n" + reportvalue + "-By" + currentUser.getFullname() +"On Date"
					+ new java.sql.Date(new java.util.Date().getTime()).toLocalDate() + "\n"
					+ "---------------------------------------");
			reportService.updateReport(report, asset_id);
		}
		if (Status.equalsIgnoreCase("Finally Closed")) {
			report.setRemarks(remarkshist + "\n" + reportvalue + "-By" + currentUser.getFullname() +"On Date"
					+ new java.sql.Date(new java.util.Date().getTime()).toLocalDate() + "\n"
					+ "---------------------------------------");
			reportService.updateReport(report, asset_id);
		}
		if (Status.equalsIgnoreCase("Partially Closed")) {
			report.setRemarks(remarkshist + "\n" + reportvalue + "-By" + currentUser.getFullname() +"On Date"
					+ new java.sql.Date(new java.util.Date().getTime()).toLocalDate() + "\n"
					+ "---------------------------------------");
			reportService.updateReport(report, asset_id);
		}

		assetRequest.setAsset_id(assetRequest.getAsset_id());
		assetRequest.getAsset_id();

		String asstreq = assetRequest.getAsset_request();
		String modelno = assetRequest.getModel_no();
		String serialno = assetRequest.getSerial_no();
		String tag = assetRequest.getTag();
		String condition1 = assetRequest.getCondition1();
		String descriptions = assetRequest.getCondition1();
		String information = assetRequest.getInformation();
		String date1 = assetRequest.getDate();

		String supplier = assetRequest.getSupplier();
		String issuedate = assetRequest.getIssue_date();
		String warranty_expiration = assetRequest.getWarranty_expiration();
		String returndate = assetRequest.getReturn_date();
		String unitprice = assetRequest.getUnit_price();
		String quantity = assetRequest.getQuantity();
		String value = assetRequest.getValue();

		try {

			List<String> listasset = Arrays.asList(asstreq.split("\\s*,\\s*"));

			List<String> listmodel = Arrays.asList(modelno.split("\\s*,\\s*"));
			List<String> listserial = Arrays.asList(serialno.split("\\s*,\\s*"));
			List<String> listtag = Arrays.asList(tag.split("\\s*,\\s*"));
			List<String> listcondition1 = Arrays.asList(condition1.split("\\s*,\\s*"));
			List<String> listdescriptions = Arrays.asList(descriptions.split("\\s*,\\s*"));
			List<String> listinformation = Arrays.asList(information.split("\\s*,\\s*"));
			List<String> listdate = Arrays.asList(date1.split("\\s*,\\s*"));
			List<String> listsupplier = Arrays.asList(supplier.split("\\s*,\\s*"));
			List<String> listissuedate = Arrays.asList(issuedate.split("\\s*,\\s*"));
			List<String> listwarranty_expiration = Arrays.asList(warranty_expiration.split("\\s*,\\s*"));
			List<String> listreturndate = Arrays.asList(returndate.split("\\s*,\\s*"));
			List<String> listunitprice = Arrays.asList(unitprice.split("\\s*,\\s*"));
			List<String> listquantity = Arrays.asList(quantity.split("\\s*,\\s*"));
			List<String> listvalue = Arrays.asList(value.split("\\s*,\\s*"));
			System.out.println(listasset.size());
			for (int i = 0; i <= listasset.size(); i++) {
				System.out.println(listasset.size() + "------" + listasset.get(i));
				assetRequest.setAsset_request(listasset.get(i));
				String a = listinformation.get(i);
				if ((a.equalsIgnoreCase("Not available"))) {
					assetRequest.setModel_no(" ");
					assetRequest.setSerial_no(" ");
					assetRequest.setTag(" ");
					assetRequest.setCondition1(" ");
					assetRequest.setDescriptions(" ");
					assetRequest.setInformation("Not available");
					assetRequest.setDate("2020-01-23");
					assetRequest.setIssue_date("2020-01-23");
					assetRequest.setWarranty_expiration("2020-01-23");
					assetRequest.setReturn_date("2020-01-23");
					assetRequest.setSupplier(" ");
					assetRequest.setUnit_price("0");
					assetRequest.setQuantity("0");
					assetRequest.setValue("0");
				}
				if ((a.equalsIgnoreCase("Available"))) {

					assetRequest.setModel_no(listmodel.get(i));
					assetRequest.setSerial_no(listserial.get(i));
					assetRequest.setTag(listtag.get(i));
					inventoryService.getUpdatemasterinventory(listtag.get(i));

					assetRequest.setCondition1(listcondition1.get(i));
					assetRequest.setDescriptions(listdescriptions.get(i));
					assetRequest.setInformation(listinformation.get(i));
					assetRequest.setDate(listdate.get(i));
					assetRequest.setIssue_date(listissuedate.get(i));
					assetRequest.setWarranty_expiration(listwarranty_expiration.get(i));
					if (Status.equalsIgnoreCase("partially select") || Status.equalsIgnoreCase("Partially update")
							|| Status.equalsIgnoreCase("Closed") || Status.equalsIgnoreCase("Sent To Requester")) {
						assetRequest.setReturn_date("2020-01-23");

					} else {
						assetRequest.setReturn_date(listreturndate.get(i));
						if(!(listreturndate.get(i).equalsIgnoreCase("")))
								{
						inventoryService.getUpdatemasterinventoryfortag(listtag.get(i));
								}
						else if(!(listreturndate.get(i).equalsIgnoreCase("2020-01-23")) && !(listreturndate.get(i).equalsIgnoreCase("")))
						{
				inventoryService.getUpdatemasterinventoryfortag(listtag.get(i));
						}
					}
					// assetRequest.setDate(listdate.get(i));
					assetRequest.setSupplier(listsupplier.get(i));
					// assetRequest.setIssue_date(listissuedate.get(i));
					// assetRequest.setWarranty_expiration(listwarranty_expiration.get(i));
					// assetRequest.setReturn_date(listreturndate.get(i));
					assetRequest.setUnit_price(listunitprice.get(i));
					assetRequest.setQuantity(listquantity.get(i));
					assetRequest.setValue(listvalue.get(i));
				}
				// Approved case start
				if (Status.equalsIgnoreCase("partially select")) {
					
					assetRequestService.saveAssetRequest(assetRequest);

				}
				if ((Status.equalsIgnoreCase("Sent To Requester"))) {
					assetRequestService.saveAssetRequest(assetRequest);
				}
				// Approved case End

				// "partially select start it will work on Send to req and partially select
				if (Status.equalsIgnoreCase("Partially update")) {
					
					assetRequestService.getUpdatechild(assetRequest, asset_id);
				}
				if (Status.equalsIgnoreCase("Finally Closed")) {
					
					assetRequestService.getUpdatechildreturndate(assetRequest, asset_id);
				}
				if (Status.equalsIgnoreCase("Partially Closed")) {
					
					if(assetRequest.getReturn_date().equalsIgnoreCase("")){
						assetRequest.setReturn_date("2020-01-23");
						
					}
					assetRequestService.getUpdatechildreturndate(assetRequest, asset_id);
				     
				}

				if (Status.equalsIgnoreCase("Closed")) {
					
					assetRequestService.getUpdatechild(assetRequest, asset_id);
				}

				// End

			}

		} catch (Exception e) {
			logger.error(e.getMessage());

		}

		// mail

		if (report.getStatus().equalsIgnoreCase("Sent To Reporting Manager") && user.equalsIgnoreCase("USER")) {
			String role = (String) session.getAttribute("role");

			String from = (String) session.getAttribute("empid");

			//String to[] = userService.getEmailHr();
			String cc="saiprasad@centroxy.com";
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message);

			helper.setSubject("AssetRequest is updated");

			helper.setFrom(from);
			//helper.setTo(to);
            helper.setCc(cc);
			boolean html = true;
			String name = report.getName();
			String email = report.getEmail();
			String aR = report.getAsset_request();
			String remarks = report.getRemarks();
			String sendmail = Utility.getSiteURL(request) + "/sendmail" + "?id=" + report.getAsset_id() + "&bid=btn";
			String reject = Utility.getSiteURL(request) + "/reject" + "?id=" + report.getAsset_id();
			String hold = Utility.getSiteURL(request) + "/hold" + "?id=" + report.getAsset_id();
			String return1 = Utility.getSiteURL(request) + "/return1" + "?id=" + report.getAsset_id();
			String siteLink = Utility.getSiteURL(request) + "/login";
			helper.setText("<!DOCTYPE html>\r\n" + "<html>\r\n" + "<head>\r\n" + "<style>\r\n" + "table, td {\r\n"
					+ "  border: 1px solid black;\r\n" + "}\r\n" + "</style>\r\n" + "</head>\r\n" + "<body>\r\n"
					+ "\r\n" + "<table style=\"width:25%\">\r\n" + "  <tr>\r\n" + "    <td>Name</td>\r\n" + "     <td>"
					+ name + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>EmailId</td>\r\n" + "    <td>"
					+ email + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>AssetRequest</td>\r\n" + "    <td>"
					+ aR + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>Remarks</td>\r\n" + "    <td>"
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
		if (report.getStatus().equalsIgnoreCase("Sent To Reporting Manager") && user.equalsIgnoreCase("USER")) {
			String from = (String) session.getAttribute("empid");
	String to[] = userService.getEmailHr();
	System.out.println(to);
	
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message);

			helper.setSubject("AssetRequest is updated");

			helper.setFrom(from);
			helper.setTo(to);
//			helper.setCc(cc);
			boolean html = true;

			String name = report.getName();
			String email = report.getEmail();
			String aR = report.getAsset_request();
			String remarks = report.getRemarks();
			String siteLink = Utility.getSiteURL(request) + "/login";
			

			helper.setText("<!DOCTYPE html>\r\n" + "<html>\r\n" + "<head>\r\n" + "<style>\r\n" + "table, td {\r\n"
					+ "  border: 1px solid black;\r\n" + "}\r\n" + "</style>\r\n" + "</head>\r\n" + "<body>\r\n"
					+ "\r\n" + "<table style=\"width:25%\">\r\n" + "  <tr>\r\n" + "    <td>Name</td>\r\n" + "     <td>"
					+ name + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>EmailId</td>\r\n" + "    <td>"
					+ email + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>AssetRequest</td>\r\n" + "    <td>"
					+ aR + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>Remarks</td>\r\n" + "    <td>"
					+ remarks + "</td>\r\n" + "  </tr>\r\n" + "</table>\r\n" + "<br>"
					+ "<p><a href=\"" + siteLink + "\">	Go to WebSite</a></p>"
					+ "\r\n" + "</body>\r\n" + "</html>\r\n" + "", html);

		

			mailSender.send(message);
			
			ModelAndView model = new ModelAndView("redirect:/user/openinfo");
			return model;
			
		} else if (report.getStatus().equalsIgnoreCase("Sent To Requester")) {

			String s = "" + " <table border ='1'>" + "<tr>" + "<td>Asset Type</td>" + "<td>Model No.</td>"
					+ "<td>Serial No.</td> " + "<td>Tag Name </td> " + "</tr> ";

			List<String> AssetRequestval = Arrays.asList(asstreq.split(","));
			List<String> modelNoval = Arrays.asList(modelno.split(","));
			List<String> SerialNoval = Arrays.asList(serialno.split(","));
			List<String> TagNoval = Arrays.asList(tag.split(","));

			for (int i1 = 0; i1 < AssetRequestval.size(); i1++) {
				s = s.concat("<tr>" + "<td>" + AssetRequestval.get(i1) + "</td>" + "<td>" + modelNoval.get(i1)
						+ "</td> " + "<td>" + SerialNoval.get(i1) + "</td> " + "<td>" + TagNoval.get(i1) + "</td> "
						+ "</tr> ");
			}
			s = s.concat("</table>");

			String from = (String) session.getAttribute("empid");
			String to = report.getEmail();

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message);

			helper.setSubject("Requested Asset is Sent");

			helper.setFrom(from);
			helper.setTo(to);
			boolean html = true;

			String siteLink = Utility.getSiteURL(request) + "/login";
			helper.setText(s + "<br>" + "<p><a href=\"" + siteLink + "\">	Go to WebSite</a></p>", html);

			mailSender.send(message);
		}

		else if (report.getStatus().equalsIgnoreCase("Partially update")) {

			String s = "" + " <table border ='1'>" + "<tr>" + "<td>Asset Type</td>" + "<td>Model No.</td>"
					+ "<td>Serial No.</td> " + "</tr> ";

			List<String> AssetRequestval = Arrays.asList(asstreq.split(","));
			List<String> modelNoval = Arrays.asList(modelno.split(","));
			List<String> SerialNoval = Arrays.asList(serialno.split(","));
			for (int i1 = 0; i1 < AssetRequestval.size(); i1++) {
				s = s.concat("<tr>" + "<td>" + AssetRequestval.get(i1) + "</td>" + "<td>" + modelNoval.get(i1)
						+ "</td> " + "<td>" + SerialNoval.get(i1) + "</td> " + "</tr> ");
			}
			s = s.concat("</table>");

			String from = "hr@gmail.com";
			String to = report.getEmail();

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message);

			helper.setSubject("Requested Asset is Sent");

			helper.setFrom(from);
			helper.setTo(to);
			boolean html = true;

			String siteLink = Utility.getSiteURL(request) + "/login";
			helper.setText(s + "<br>" + "<p><a href=\"" + siteLink + "\">	Go to WebSite</a></p>", html);

			mailSender.send(message);
		} else if (report.getStatus().equalsIgnoreCase("Closed")) {

			String s = "" + " <table border ='1'>" + "<tr>" + "<td>Asset Type</td>" + "<td>Model No.</td>"
					+ "<td>Serial No.</td> " + "</tr> ";

			List<String> AssetRequestval = Arrays.asList(asstreq.split(","));
			List<String> modelNoval = Arrays.asList(modelno.split(","));
			List<String> SerialNoval = Arrays.asList(serialno.split(","));
			for (int i1 = 0; i1 < AssetRequestval.size(); i1++) {
				s = s.concat("<tr>" + "<td>" + AssetRequestval.get(i1) + "</td>" + "<td>" + modelNoval.get(i1)
						+ "</td> " + "<td>" + SerialNoval.get(i1) + "</td> " + "</tr> ");
			}
			s = s.concat("</table>");

			String from = "hr@gmail.com";
			String to = report.getEmail();

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message);

			helper.setSubject("Requested Asset is Sent");

			helper.setFrom(from);
			helper.setTo(to);
			boolean html = true;

			String siteLink = Utility.getSiteURL(request) + "/login";
			helper.setText(s + "<br>" + "<p><a href=\"" + siteLink + "\">	Go to WebSite</a></p>", html);

			mailSender.send(message);
		} else if (report.getStatus().equalsIgnoreCase("partially select")) {
			String from = (String) session.getAttribute("empid");
			String to = report.getEmail();

			String s = "" + " <table border ='1'>" + "<tr>" + "<td>Asset Type</td>" + "<td>Model No.</td>"
					+ "<td>Serial No.</td> " + "</tr> ";

			List<String> AssetRequestval = Arrays.asList(asstreq.split(","));
			List<String> modelNoval = Arrays.asList(modelno.split("\\s*,\\s*"));
			List<String> SerialNoval = Arrays.asList(serialno.split("\\s*,\\s*"));
			for (int i1 = 0; i1 < modelNoval.size(); i1++) {
				if (modelNoval.get(i1).equalsIgnoreCase("")) {
					s = s.concat("");
				} else {
					s = s.concat("<tr>" + "<td>" + AssetRequestval.get(i1) + "</td>" + "<td>" + modelNoval.get(i1)
							+ "</td> " + "<td>" + SerialNoval.get(i1) + "</td> " + "</tr> ");
				}
			}
			s = s.concat("</table>");
			boolean html = true;
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message);

			helper.setSubject("Requested Asset is partially Sent and Rest of the assets will be provided you soon");
			helper.setText(/*
							 * s + "<br>" + "<br>" + "<p>Rest of the assets will be provided you soon</p>",
							 * html
							 */
					"<!DOCTYPE html>\r\n" + "<html>\r\n" + "<body>\r\n" + "\r\n"
							+ "<p>Rest of the assets will be provided you soon</p>" + "\r\n" + "</body>\r\n"
							+ "</html>\r\n" + "",
					html);
			helper.setFrom(from);
			helper.setTo(to);

			String siteLink = Utility.getSiteURL(request) + "/login";
			helper.setText(s + "<br>" + "<p><a href=\"" + siteLink + "\">    Go to WebSite</a></p>", html);

			mailSender.send(message);

		} else if (report.getStatus().equalsIgnoreCase("Rejected by HR")) {
			// requester
			String from = (String) session.getAttribute("empid");
			System.out.println(from);
			String to = report.getEmail();
			System.out.println(to);
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message);

			helper.setSubject("AssetRequest is rejected by HR");

			helper.setFrom(from);
			helper.setTo(to);

			boolean html = true;

			String name = report.getName();
			String email = report.getEmail();
			String aR = report.getAsset_request();
			String remarks = report.getRemarks();
			String siteLink = Utility.getSiteURL(request) + "/login";
			helper.setText("<!DOCTYPE html>\r\n" + "<html>\r\n" + "<head>\r\n" + "<style>\r\n" + "table, td {\r\n"
					+ "  border: 1px solid black;\r\n" + "}\r\n" + "</style>\r\n" + "</head>\r\n" + "<body>\r\n"
					+ "\r\n" + "<table style=\"width:20%\">\r\n" + "  <tr>\r\n" + "    <td>Name</td>\r\n" + "     <td>"
					+ name + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>EmailId</td>\r\n" + "    <td>"
					+ email + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>AssetRequest</td>\r\n" + "    <td>"
					+ aR + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + " <tr>\r\n" + "    <td>Remarks</td>\r\n"
					+ "    <td>" + remarks + "</td>\r\n" + "  </tr>\r\n" + "</table>\r\n" + "\r\n" + "<p><a href=\""
					+ siteLink + "\">Go to Webpage</a></p>" + "\r\n" + "</body>\r\n" + "</html>\r\n" + "", html);

			mailSender.send(message);
		} else if (report.getStatus().equalsIgnoreCase("Sent To HR(ON HOLD)")) {
			// requester
			String from = (String) session.getAttribute("empid");
			String to = report.getEmail();
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message);

			helper.setSubject("AssetRequest is on hold by HR");

			helper.setFrom(from);
			helper.setTo(to);

			boolean html = true;

			String name = report.getName();
			String email = report.getEmail();
			String aR = report.getAsset_request();
			String remarks = report.getRemarks();
			String siteLink = Utility.getSiteURL(request) + "/login";
			helper.setText("<!DOCTYPE html>\r\n" + "<html>\r\n" + "<head>\r\n" + "<style>\r\n" + "table, td {\r\n"
					+ "  border: 1px solid black;\r\n" + "}\r\n" + "</style>\r\n" + "</head>\r\n" + "<body>\r\n"
					+ "\r\n" + "<table style=\"width:20%\">\r\n" + "  <tr>\r\n" + "    <td>Name</td>\r\n" + "     <td>"
					+ name + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>EmailId</td>\r\n" + "    <td>"
					+ email + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>AssetRequest</td>\r\n" + "    <td>"
					+ aR + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + " <tr>\r\n" + "    <td>Remarks</td>\r\n"
					+ "    <td>" + remarks + "</td>\r\n" + "  </tr>\r\n" + "</table>\r\n" + "\r\n" + "<p><a href=\""
					+ siteLink + "\">Go to Webpage</a></p>" + "\r\n" + "</body>\r\n" + "</html>\r\n" + "", html);

			mailSender.send(message);
		} else if (report.getStatus().equalsIgnoreCase("Rejected by HR")) {
			String from = (String) session.getAttribute("empid");
			String to = report.getEmail();
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message);

			helper.setSubject("AssetRequest is rejected by HR");

			helper.setFrom(from);
			helper.setTo(to);

			boolean html = true;

			String name = report.getName();
			String email = report.getEmail();
			String aR = report.getAsset_request();
			String remarks = report.getRemarks();
			String siteLink = Utility.getSiteURL(request) + "/login";
			helper.setText("<!DOCTYPE html>\r\n" + "<html>\r\n" + "<head>\r\n" + "<style>\r\n" + "table, td {\r\n"
					+ "  border: 1px solid black;\r\n" + "}\r\n" + "</style>\r\n" + "</head>\r\n" + "<body>\r\n"
					+ "\r\n" + "<table style=\"width:20%\">\r\n" + "  <tr>\r\n" + "    <td>Name</td>\r\n" + "     <td>"
					+ name + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>EmailId</td>\r\n" + "    <td>"
					+ email + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>AssetRequest</td>\r\n" + "    <td>"
					+ aR + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + " <tr>\r\n" + "    <td>Remarks</td>\r\n"
					+ "    <td>" + remarks + "</td>\r\n" + "  </tr>\r\n" + "</table>\r\n" + "\r\n" + "<p><a href=\""
					+ siteLink + "\">Go to Webpage</a></p>" + "\r\n" + "</body>\r\n" + "</html>\r\n" + "", html);

			mailSender.send(message);

		} else if (report.getStatus().equalsIgnoreCase("Return by HR")) {

			String from = (String) session.getAttribute("empid");
			String to = report.getEmail();
			String cc = "saiprasad@centroxy.com";
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message);

			helper.setSubject("AssetRequest is return by HR");

			helper.setFrom(from);
			helper.setTo(to);
			helper.setCc(cc);

			boolean html = true;

			String name = report.getName();
			String email = report.getEmail();
			String aR = report.getAsset_request();
			String remarks = report.getRemarks();
			String siteLink = Utility.getSiteURL(request) + "/login";
			helper.setText("<!DOCTYPE html>\r\n" + "<html>\r\n" + "<head>\r\n" + "<style>\r\n" + "table, td {\r\n"
					+ "  border: 1px solid black;\r\n" + "}\r\n" + "</style>\r\n" + "</head>\r\n" + "<body>\r\n"
					+ "\r\n" + "<table style=\"width:20%\">\r\n" + "  <tr>\r\n" + "    <td>Name</td>\r\n" + "     <td>"
					+ name + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>EmailId</td>\r\n" + "    <td>"
					+ email + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>AssetRequest</td>\r\n" + "    <td>"
					+ aR + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + " <tr>\r\n" + "    <td>Remarks</td>\r\n"
					+ "    <td>" + remarks + "</td>\r\n" + "  </tr>\r\n" + "</table>\r\n" + "\r\n" + "<p><a href=\""
					+ siteLink + "\">Go to Webpage</a></p>" + "\r\n" + "</body>\r\n" + "</html>\r\n" + "", html);

			mailSender.send(message);
		} 
		/*
		 * else if (report.getStatus().equalsIgnoreCase("Sent To Reporting Manager") &&
		 * user.equalsIgnoreCase("USER") ) { String role = (String)
		 * session.getAttribute("role");
		 * 
		 * String from = (String) session.getAttribute("empid");
		 * 
		 * String to[] = userService.getEmailHr(); String cc="saiprasad@centroxy.com";
		 * MimeMessage message = mailSender.createMimeMessage(); MimeMessageHelper
		 * helper = new MimeMessageHelper(message);
		 * 
		 * helper.setSubject("AssetRequest is updated");
		 * 
		 * helper.setFrom(from); helper.setTo(to); helper.setCc(cc); boolean html =
		 * true; String name = report.getName(); String email = report.getEmail();
		 * String aR = report.getAsset_request(); String remarks = report.getRemarks();
		 * String sendmail = Utility.getSiteURL(request) + "/sendmail" + "?id=" +
		 * report.getAsset_id() + "&bid=btn"; String reject =
		 * Utility.getSiteURL(request) + "/reject" + "?id=" + report.getAsset_id();
		 * String hold = Utility.getSiteURL(request) + "/hold" + "?id=" +
		 * report.getAsset_id(); String return1 = Utility.getSiteURL(request) +
		 * "/return1" + "?id=" + report.getAsset_id(); String siteLink =
		 * Utility.getSiteURL(request) + "/login"; helper.setText("<!DOCTYPE html>\r\n"
		 * + "<html>\r\n" + "<head>\r\n" + "<style>\r\n" + "table, td {\r\n" +
		 * "  border: 1px solid black;\r\n" + "}\r\n" + "</style>\r\n" + "</head>\r\n" +
		 * "<body>\r\n" + "\r\n" + "<table style=\"width:25%\">\r\n" + "  <tr>\r\n" +
		 * "    <td>Name</td>\r\n" + "     <td>" + name + "</td>\r\n" + "  </tr>\r\n" +
		 * "  <tr>\r\n" + "    <td>EmailId</td>\r\n" + "    <td>" + email + "</td>\r\n"
		 * + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>AssetRequest</td>\r\n" + "    <td>"
		 * + aR + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" +
		 * "    <td>Remarks</td>\r\n" + "    <td>" + remarks + "</td>\r\n" +
		 * "  </tr>\r\n" + "</table>\r\n" + "<br>" + "<a href=\"" + sendmail +
		 * "\">	<button>Approved</button></a>"+ "<br>" + "<a href=\"" + reject +
		 * "\">	<button>Reject</button></a>" + "<br>" + "<a href=\"" + hold +
		 * "\">	<button>HOLD</button></a>" + "<br>" + "<a href=\"" + return1 +
		 * "\">	<button>Return</button></a>" + "<p><a href=\"" + siteLink +
		 * "\">	Go to WebSite</a></p>" + "\r\n" + "</body>\r\n" + "</html>\r\n" + "",
		 * html);
		 * 
		 * 
		 * 
		 * mailSender.send(message); ModelAndView model = new
		 * ModelAndView("redirect:/user/openinfo"); return model; // }
		 */			/*
					 * else if (report.getStatus().equalsIgnoreCase("Approved")) {
					 * 
					 * String from = "saiprasad@centroxy.com"; String cc = report.getEmail(); String
					 * to[] = userService.getEmail(); MimeMessage message =
					 * mailSender.createMimeMessage(); MimeMessageHelper helper = new
					 * MimeMessageHelper(message);
					 * 
					 * helper.setSubject("AssetRequest is active");
					 * 
					 * helper.setFrom(from); helper.setTo(to); helper.setCc(cc); boolean html =
					 * true;
					 * 
					 * String name = report.getName(); String email = report.getEmail(); String aR =
					 * report.getAsset_request(); String remarks = report.getRemarks(); String
					 * siteLink = Utility.getSiteURL(request) + "/login";
					 * helper.setText("<!DOCTYPE html>\r\n" + "<html>\r\n" + "<head>\r\n" +
					 * "<style>\r\n" + "table, td {\r\n" + "  border: 1px solid black;\r\n" +
					 * "}\r\n" + "</style>\r\n" + "</head>\r\n" + "<body>\r\n" + "\r\n" +
					 * "<table style=\"width:20%\">\r\n" + "  <tr>\r\n" + "    <td>Name</td>\r\n" +
					 * "     <td>" + name + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" +
					 * "    <td>EmailId</td>\r\n" + "    <td>" + email + "</td>\r\n" + "  </tr>\r\n"
					 * + "  <tr>\r\n" + "    <td>AssetRequest</td>\r\n" + "    <td>" + aR +
					 * "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + " <tr>\r\n" +
					 * "    <td>Remarks</td>\r\n" + "    <td>" + remarks + "</td>\r\n" +
					 * "  </tr>\r\n" + "</table>\r\n" + "\r\n" + "<p><a href=\"" + siteLink +
					 * "\">Go to Webpage</a></p>" + "\r\n" + "</body>\r\n" + "</html>\r\n" + "",
					 * html);
					 * 
					 * mailSender.send(message); }
					 */
		 else if (report.getStatus().equalsIgnoreCase("Reject by Reporting Manager")) {
			String from = "saiprasad@centroxy.com";
			String cc = report.getEmail();
			String to[] = userService.getEmailHr();
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message);

			helper.setSubject("AssetRequest is rejected");

			helper.setFrom(from);
			helper.setTo(to);
			helper.setCc(cc);

			boolean html = true;

			String name = report.getName();
			String email = report.getEmail();
			String aR = report.getAsset_request();
			String remarks = report.getRemarks();
			String siteLink = Utility.getSiteURL(request) + "/login";
			helper.setText("<!DOCTYPE html>\r\n" + "<html>\r\n" + "<head>\r\n" + "<style>\r\n" + "table, td {\r\n"
					+ "  border: 1px solid black;\r\n" + "}\r\n" + "</style>\r\n" + "</head>\r\n" + "<body>\r\n"
					+ "\r\n" + "<table style=\"width:20%\">\r\n" + "  <tr>\r\n" + "    <td>Name</td>\r\n" + "     <td>"
					+ name + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>EmailId</td>\r\n" + "    <td>"
					+ email + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>AssetRequest</td>\r\n" + "    <td>"
					+ aR + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + " <tr>\r\n" + "    <td>Remarks</td>\r\n"
					+ "    <td>" + remarks + "</td>\r\n" + "  </tr>\r\n" + "</table>\r\n" + "\r\n" + "<p><a href=\""
					+ siteLink + "\">Go to Webpage</a></p>" + "\r\n" + "</body>\r\n" + "</html>\r\n" + "", html);

			mailSender.send(message);
		} else if (report.getStatus().equalsIgnoreCase("Pending To Reporting Manager(ON HOLD)")) {
			String from = "saiprasad@centroxy.com";
			String cc = report.getEmail();
			String to[] = userService.getEmailHr();
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message);

			helper.setSubject("AssetRequest is on hold");

			helper.setFrom(from);
			helper.setTo(to);
			helper.setCc(cc);

			boolean html = true;

			String name = report.getName();
			String email = report.getEmail();
			String aR = report.getAsset_request();
			String remarks = report.getRemarks();
			String siteLink = Utility.getSiteURL(request) + "/login";
			helper.setText("<!DOCTYPE html>\r\n" + "<html>\r\n" + "<head>\r\n" + "<style>\r\n" + "table, td {\r\n"
					+ "  border: 1px solid black;\r\n" + "}\r\n" + "</style>\r\n" + "</head>\r\n" + "<body>\r\n"
					+ "\r\n" + "<table style=\"width:20%\">\r\n" + "  <tr>\r\n" + "    <td>Name</td>\r\n" + "     <td>"
					+ name + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>EmailId</td>\r\n" + "    <td>"
					+ email + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>AssetRequest</td>\r\n" + "    <td>"
					+ aR + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + " <tr>\r\n" + "    <td>Remarks</td>\r\n"
					+ "    <td>" + remarks + "</td>\r\n" + "  </tr>\r\n" + "</table>\r\n" + "\r\n" + "<p><a href=\""
					+ siteLink + "\">Go to Webpage</a></p>" + "\r\n" + "</body>\r\n" + "</html>\r\n" + "", html);

			mailSender.send(message);
		} /*
			 * else if (report.getStatus().equalsIgnoreCase("Pending To Approver(ON HOLD)"))
			 * {
			 * 
			 * String from = "saiprasad@centroxy.com"; String cc = report.getEmail(); String
			 * to[] = userService.getEmail(); MimeMessage message =
			 * mailSender.createMimeMessage(); MimeMessageHelper helper = new
			 * MimeMessageHelper(message);
			 * 
			 * helper.setSubject("AssetRequest is on hold");
			 * 
			 * helper.setFrom(from); helper.setTo(to); helper.setCc(cc);
			 * 
			 * boolean html = true;
			 * 
			 * String name = report.getName(); String email = report.getEmail(); String aR =
			 * report.getAsset_request(); String remarks = report.getRemarks(); String
			 * siteLink = Utility.getSiteURL(request) + "/login";
			 * helper.setText("<!DOCTYPE html>\r\n" + "<html>\r\n" + "<head>\r\n" +
			 * "<style>\r\n" + "table, td {\r\n" + "  border: 1px solid black;\r\n" +
			 * "}\r\n" + "</style>\r\n" + "</head>\r\n" + "<body>\r\n" + "\r\n" +
			 * "<table style=\"width:20%\">\r\n" + "  <tr>\r\n" + "    <td>Name</td>\r\n" +
			 * "     <td>" + name + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" +
			 * "    <td>EmailId</td>\r\n" + "    <td>" + email + "</td>\r\n" + "  </tr>\r\n"
			 * + "  <tr>\r\n" + "    <td>AssetRequest</td>\r\n" + "    <td>" + aR +
			 * "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + " <tr>\r\n" +
			 * "    <td>Remarks</td>\r\n" + "    <td>" + remarks + "</td>\r\n" +
			 * "  </tr>\r\n" + "</table>\r\n" + "\r\n" + "<p><a href=\"" + siteLink +
			 * "\">Go to Webpage</a></p>" + "\r\n" + "</body>\r\n" + "</html>\r\n" + "",
			 * html);
			 * 
			 * mailSender.send(message); }
			 */ else if (report.getStatus().equalsIgnoreCase("Return By Reporting Manager")) {

			String from = "saiprasad@centroxy.com";
			String cc = report.getEmail();
			String to[] = userService.getEmailHr();
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message);

			helper.setSubject("AssetRequest is returned by approver");

			helper.setFrom(from);
			helper.setTo(to);
			helper.setCc(cc);

			boolean html = true;

			String name = report.getName();
			String email = report.getEmail();
			String aR = report.getAsset_request();
			String remarks = report.getRemarks();
			String siteLink = Utility.getSiteURL(request) + "/login";
			helper.setText("<!DOCTYPE html>\r\n" + "<html>\r\n" + "<head>\r\n" + "<style>\r\n" + "table, td {\r\n"
					+ "  border: 1px solid black;\r\n" + "}\r\n" + "</style>\r\n" + "</head>\r\n" + "<body>\r\n"
					+ "\r\n" + "<table style=\"width:20%\">\r\n" + "  <tr>\r\n" + "    <td>Name</td>\r\n" + "     <td>"
					+ name + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>EmailId</td>\r\n" + "    <td>"
					+ email + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>AssetRequest</td>\r\n" + "    <td>"
					+ aR + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + " <tr>\r\n" + "    <td>Remarks</td>\r\n"
					+ "    <td>" + remarks + "</td>\r\n" + "  </tr>\r\n" + "</table>\r\n" + "\r\n" + "<p><a href=\""
					+ siteLink + "\">Go to Webpage</a></p>" + "\r\n" + "</body>\r\n" + "</html>\r\n" + "", html);

			mailSender.send(message);
		} else if (report.getStatus().equalsIgnoreCase("Approved")) {

			String from = "saiprasad@centroxy.com";
			String cc = report.getEmail();
			String to[] = userService.getEmailHr();
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message);

			helper.setSubject("AssetRequest is Approved");

			helper.setFrom(from);
			helper.setTo(to);
			helper.setCc(cc);

			boolean html = true;

			String name = report.getName();
			String email = report.getEmail();
			String aR = report.getAsset_request();
			String remarks = report.getRemarks();
			String siteLink = Utility.getSiteURL(request) + "/login";
			helper.setText("<!DOCTYPE html>\r\n" + "<html>\r\n" + "<head>\r\n" + "<style>\r\n" + "table, td {\r\n"
					+ "  border: 1px solid black;\r\n" + "}\r\n" + "</style>\r\n" + "</head>\r\n" + "<body>\r\n"
					+ "\r\n" + "<table style=\"width:20%\">\r\n" + "  <tr>\r\n" + "    <td>Name</td>\r\n" + "     <td>"
					+ name + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>EmailId</td>\r\n" + "    <td>"
					+ email + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>AssetRequest</td>\r\n" + "    <td>"
					+ aR + "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + " <tr>\r\n" + "    <td>Remarks</td>\r\n"
					+ "    <td>" + remarks + "</td>\r\n" + "  </tr>\r\n" + "</table>\r\n" + "\r\n" + "<p><a href=\""
					+ siteLink + "\">Go to Webpage</a></p>" + "\r\n" + "</body>\r\n" + "</html>\r\n" + "", html);

			mailSender.send(message);
		}
		ModelAndView mav = new ModelAndView("redirect:/admin/report");
		return mav;
	}

	@RequestMapping(value = "/sendmail", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView login(@ModelAttribute("assetrequest") AssetRequest assetRequest, RedirectAttributes attr,
			HttpSession session, Integer asset_id, HttpServletRequest request, Model model) throws MessagingException {

		int var = Integer.parseInt(request.getParameter("id"));

		Report report = reportService.getReportData(var);

		int var1 = Integer.parseInt(request.getParameter("id"));

		reportService.updateStatus(var1);
		
		String action = request.getParameter("bid");
		
		//int asset_id = Integer.parseInt(request.getParameter("id"));
		System.out.println(asset_id);
		try {
			if (action.equalsIgnoreCase("btn")) {
				reportService.updateNotification(var);
				System.out.println("rrrr");
				// model3.addAttribute("notification", notification);
			}
					} catch (Exception e) {
			logger.error(e.getMessage());

		}


		String from = "saiprasad@centroxy.com";
		String cc = report.getEmail();
		String to[] = userService.getEmailHr();

		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);

		helper.setSubject("AssetRequest is Approved");

		helper.setFrom(from);
		helper.setTo(to);
		helper.setCc(cc);
		boolean html = true;

		String name = report.getName();
		String email = report.getEmail();
		String aR = report.getAsset_request();
		String remarks = report.getRemarks();
		String siteLink = Utility.getSiteURL(request) + "/login";
		helper.setText("<!DOCTYPE html>\r\n" + "<html>\r\n" + "<head>\r\n" + "<style>\r\n" + "table, td {\r\n"
				+ "  border: 1px solid black;\r\n" + "}\r\n" + "</style>\r\n" + "</head>\r\n" + "<body>\r\n" + "\r\n"
				+ "<table style=\"width:40%\">\r\n" + "  <tr>\r\n" + "    <td>Name</td>\r\n" + "     <td>" + name
				+ "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>EmailId</td>\r\n" + "    <td>" + email
				+ "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>AssetRequest</td>\r\n" + "    <td>" + aR
				+ "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>Remarks</td>\r\n" + "    <td>" + remarks
				+ "</td>\r\n" + "  </tr>\r\n" + "</table>\r\n" + "<p><a href=\"" + siteLink
				+ "\">	Go to WebSite</a></p>" + "\r\n" + "</body>\r\n" + "</html>\r\n" + "", html);

		mailSender.send(message);
		model.addAttribute("title", "Approved  Successfully");
		model.addAttribute("message", "Mail successfully sent to HR and USER");

		return new ModelAndView("mail");
	}

	@RequestMapping(value = "/reject", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView reject(@ModelAttribute("assetrequest") AssetRequest assetRequest, RedirectAttributes attr,
			HttpSession session, Integer asset_id, HttpServletRequest request, Model model) throws MessagingException {

		int var = Integer.parseInt(request.getParameter("id"));

		Report report = reportService.getReportData(var);

		int var2 = Integer.parseInt(request.getParameter("id"));

		reportService.updateStatus1(var2);
		String from = "saiprasad@centroxy.com";
		String cc = report.getEmail();
		String to[] = userService.getEmailHr();

		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);

		helper.setSubject("AssetRequest is Rejected");

		helper.setFrom(from);
		helper.setTo(to);
		helper.setCc(cc);

		boolean html = true;

		String name = report.getName();
		String email = report.getEmail();
		String aR = report.getAsset_request();
		String remarks = report.getRemarks();
		String siteLink = Utility.getSiteURL(request) + "/login";
		helper.setText("<!DOCTYPE html>\r\n" + "<html>\r\n" + "<head>\r\n" + "<style>\r\n" + "table, td {\r\n"
				+ "  border: 1px solid black;\r\n" + "}\r\n" + "</style>\r\n" + "</head>\r\n" + "<body>\r\n" + "\r\n"
				+ "<table style=\"width:40%\">\r\n" + "  <tr>\r\n" + "    <td>Name</td>\r\n" + "     <td>" + name
				+ "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>EmailId</td>\r\n" + "    <td>" + email
				+ "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>AssetRequest</td>\r\n" + "    <td>" + aR
				+ "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>Remarks</td>\r\n" + "    <td>" + remarks
				+ "</td>\r\n" + "  </tr>\r\n" + "</table>\r\n" + "<p><a href=\"" + siteLink
				+ "\">	Go to WebSite</a></p>" + "\r\n" + "</body>\r\n" + "</html>\r\n" + "", html);

		mailSender.send(message);
		model.addAttribute("title", "AssetRequest is Rejected");
		model.addAttribute("message", "Mail successfully sent to HR and USER");

		return new ModelAndView("mail");
	}

	@RequestMapping(value = "/hold", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView hold(@ModelAttribute("assetrequest") AssetRequest assetRequest, RedirectAttributes attr,
			HttpSession session, Integer asset_id, HttpServletRequest request, Model model) throws MessagingException {

		int var = Integer.parseInt(request.getParameter("id"));

		Report report = reportService.getReportData(var);

		int var3 = Integer.parseInt(request.getParameter("id"));

		reportService.updateStatus2(var3);
		String from = "saiprasad@centroxy.com";
		String to[] = userService.getEmailHr();
		String cc = report.getEmail();

		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);

		helper.setSubject("AssetRequest is on Hold");

		helper.setFrom(from);
		helper.setTo(to);
		helper.setCc(cc);

		boolean html = true;

		String name = report.getName();
		String email = report.getEmail();
		String aR = report.getAsset_request();
		String remarks = report.getRemarks();
		String siteLink = Utility.getSiteURL(request) + "/login";
		helper.setText("<!DOCTYPE html>\r\n" + "<html>\r\n" + "<head>\r\n" + "<style>\r\n" + "table, td {\r\n"
				+ "  border: 1px solid black;\r\n" + "}\r\n" + "</style>\r\n" + "</head>\r\n" + "<body>\r\n" + "\r\n"
				+ "<table style=\"width:40%\">\r\n" + "  <tr>\r\n" + "    <td>Name</td>\r\n" + "     <td>" + name
				+ "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>EmailId</td>\r\n" + "    <td>" + email
				+ "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>AssetRequest</td>\r\n" + "    <td>" + aR
				+ "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>Remarks</td>\r\n" + "    <td>" + remarks
				+ "</td>\r\n" + "  </tr>\r\n" + "</table>\r\n" + "<p><a href=\"" + siteLink
				+ "\">	Go to WebSite</a></p>" + "\r\n" + "</body>\r\n" + "</html>\r\n" + "", html);

		mailSender.send(message);
		model.addAttribute("title", "AssetRequest is on Hold");
		model.addAttribute("message", "Mail successfully sent to HR and USER");

		return new ModelAndView("mail");
	}

	@RequestMapping(value = "/return1", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView return1(@ModelAttribute("assetrequest") AssetRequest assetRequest, RedirectAttributes attr,
			HttpSession session, Integer asset_id, HttpServletRequest request, Model model) throws MessagingException {

		int var = Integer.parseInt(request.getParameter("id"));

		Report report = reportService.getReportData(var);

		int var4 = Integer.parseInt(request.getParameter("id"));

		reportService.updateStatus3(var4);
		String from = "saiprasad@centroxy.com";
		String cc = report.getEmail();
		String to[] = userService.getEmailHr();

		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);

		helper.setSubject("AssetRequest is returned ");

		helper.setFrom(from);
		helper.setTo(to);
		helper.setCc(cc);
		boolean html = true;

		String name = report.getName();
		String email = report.getEmail();
		String aR = report.getAsset_request();
		String remarks = report.getRemarks();
		String siteLink = Utility.getSiteURL(request) + "/login";
		helper.setText("<!DOCTYPE html>\r\n" + "<html>\r\n" + "<head>\r\n" + "<style>\r\n" + "table, td {\r\n"
				+ "  border: 1px solid black;\r\n" + "}\r\n" + "</style>\r\n" + "</head>\r\n" + "<body>\r\n" + "\r\n"
				+ "<table style=\"width:40%\">\r\n" + "  <tr>\r\n" + "    <td>Name</td>\r\n" + "     <td>" + name
				+ "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>EmailId</td>\r\n" + "    <td>" + email
				+ "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>AssetRequest</td>\r\n" + "    <td>" + aR
				+ "</td>\r\n" + "  </tr>\r\n" + "  <tr>\r\n" + "    <td>Remarks</td>\r\n" + "    <td>" + remarks
				+ "</td>\r\n" + "  </tr>\r\n" + "</table>\r\n" + "<p><a href=\"" + siteLink
				+ "\">	Go to WebSite</a></p>" + "\r\n" + "</body>\r\n" + "</html>\r\n" + "", html);

		mailSender.send(message);
		model.addAttribute("title", "AssetRequest is returned");
		model.addAttribute("message", "Mail successfully sent to HR and USER");

		return new ModelAndView("mail");
	}

}