package springboot.Service;

import java.util.List;
import springboot.model.Report;

public interface ReportService {

	List<Report> getAllReportList();

	Report getReportData(int asset_id);
	
	Report saveReport(Report Report); 
	
	String updateReport(Report report, Integer asset_id);
	
	
    String updateNotification(Integer asset_id);

	
	Report getReportData(String var);
	


	Integer updateStatus(int var1);
	
	Integer updateStatus1(int var2);
	
	Integer updateStatus2(int var3);
	
	Integer updateStatus3(int var4);

	List<Report> getuniqueid(String status);
	
	Integer savefeedback(Report report, Integer asset_id);
	   
    List<Report> viewfeedback();
   
     String viewreportdetailof(Integer asset_id);
    
     List<Report> getuniqueidpending(String status);
	
     String updateNotification1(Integer asset_id);
}