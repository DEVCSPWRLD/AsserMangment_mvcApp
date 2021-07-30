package springboot.Service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import springboot.Repository.ReportRepository;
import springboot.model.Report;
import springboot.model.User;

@Service
public class ReportServiceImpl implements ReportService {
	
	 private static final Logger logger=LoggerFactory.getLogger(ReportServiceImpl.class);

	@Autowired
	private ReportRepository reportRepository;

	@Override
	public List<Report> getAllReportList() {
		// TODO Auto-generated method stub
		return reportRepository.findAll();
	}

	@Override
	public Report getReportData(int asset_id) {
		
		return reportRepository.findById(asset_id).get();
	}

	@Override
	public Report saveReport(Report Report) 
	{
		Report reportVal=null;
        try
        {
            reportVal=reportRepository.save(Report);
        }catch(Exception e)
        {
            logger.error(e.getMessage());
        }
        return reportVal;
	}
	
	
	
	  @Override
	    public String updateReport(Report report, Integer asset_id) {
	        String result=null;
	        try
	        {    
	        reportRepository.checkReport(asset_id);

	                reportRepository.updateReport(report.getName(),report.getCategory(),report.getAsset_request(),report.getDept(),report.getDesk(),report.getRemarks(),report.getStatus(),asset_id);
	                result="Success";
	            
	        }catch(Exception e)
	        {
	            logger.error(e.getMessage());
	        }
	        return result;
	    }
	  @Override
			public Report getReportData(String var) {
				// TODO Auto-generated method stub
				return reportRepository.getReportData(var);
			}


			@Override
			public Integer updateStatus(int var1) {
				// TODO Auto-generated method stub
				return reportRepository.updateStatus(var1);
			}

			@Override
			public Integer updateStatus1(int var2) {
				// TODO Auto-generated method stub
				return reportRepository.updateStatus1(var2);
			}

			@Override
			public Integer updateStatus2(int var3) {
				// TODO Auto-generated method stub
				return reportRepository.updateStatus2(var3);
			}

			@Override
			public Integer updateStatus3(int var4) {
				// TODO Auto-generated method stub
				return reportRepository.updateStatus3(var4);
			}

			@Override
			public List<Report> getuniqueid(String status) {
				// TODO Auto-generated method stub
				 return reportRepository.getuniqueid(status);
			}
			
			@Override 
			public String updateNotification(Integer asset_id) {
                // TODO Auto-generated method stub
                 
                    String   result=null;
                    try {
                reportRepository.checkReport(asset_id);
              
                reportRepository.updateNotification(asset_id);
                result="Success";
              
                }catch(Exception e) { logger.error(e.getMessage()); } return result; }

			@Override
			public Integer savefeedback(Report report, Integer asset_id) {
				// TODO Auto-generated method stub
				return reportRepository.savefeedback(report.getFeedback(), asset_id);
			}

			@Override
			public List<Report> viewfeedback() {
				// TODO Auto-generated method stub
				return reportRepository.viewfeedback();
			}

			@Override
			public String viewreportdetailof(Integer asset_id) {
				// TODO Auto-generated method stub
			
			    return reportRepository.viewreportdetailof(asset_id);

			}

			@Override
			public List<Report> getuniqueidpending(String status) {
				// TODO Auto-generated method stub
			
			    return reportRepository.getuniqueidpending(status);

			}

			@Override
			public String updateNotification1(Integer asset_id) {
				// TODO Auto-generated method stub
				String   result=null;
                try {
            reportRepository.checkReport(asset_id);
          
            reportRepository.updateNotification1(asset_id);
            result="Success";
          
            }catch(Exception e) { logger.error(e.getMessage()); } return result; 
			}

			

			
			
			
		    
			



			

			
}