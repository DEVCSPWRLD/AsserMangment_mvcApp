package springboot.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import springboot.model.Report;

public interface ReportRepository extends JpaRepository<Report, Integer> {
	public String qury1 = "select eid from asset_inventory where email=? ";

	@Query(value = qury1, nativeQuery = true)
	Integer checkReport(Integer asset_id);

	public String qury2 = "UPDATE asset_inventory SET  name=?,category=?,asset_request=?,dept=?,desk=?,remarks=?,status=? WHERE asset_id=?";

	@Transactional
	@Modifying(clearAutomatically = true)
	@Query(value = qury2, nativeQuery = true)
	

	void updateReport(String name,String category,String asset_request,String dept, String desk, String remarks,String status, Integer asset_id );

	Report getReportByEmail(String from);
	public String qury3 = "select status from asset_inventory where asset_id=?";
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query(value = qury3, nativeQuery = true)
	Report getReportData(String var);

	public String qury4 = "UPDATE asset_inventory SET status='Approved' WHERE asset_id=?";
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query(value = qury4, nativeQuery = true)
	Integer updateStatus(int var1);
	
	public String qury5 = "UPDATE asset_inventory SET status='Reject by Reporting Manager' WHERE asset_id=?";
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query(value = qury5, nativeQuery = true)
	Integer updateStatus1(int var2);
	
	public String qury6 = "UPDATE asset_inventory SET status='Pending To Reporting Manager(ON HOLD)' WHERE asset_id=?";
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query(value = qury6, nativeQuery = true)
	Integer updateStatus2(int var3);
	
	public String qury7 = "UPDATE asset_inventory SET status='Return By Reporting Manager' WHERE asset_id=?";
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query(value = qury7, nativeQuery = true)
	Integer updateStatus3(int var4);
	
	
	public String qury8 = "select * from asset_inventory WHERE status=? AND notification='unread'";
    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(value = qury8, nativeQuery = true)
    List<Report> getuniqueid(String status);
    
    public String qury10 = "UPDATE asset_inventory SET  notification='read' WHERE asset_id=?";

    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(value = qury10, nativeQuery = true)
    
    void updateNotification(Integer asset_id);
        
    
    public String qury11 = "UPDATE asset_inventory SET feedback = ? WHERE asset_id =?";
     
      @Transactional
      @Modifying(clearAutomatically = true)
      @Query(value = qury11, nativeQuery = true)
      Integer savefeedback(Integer feedback, Integer asset_id);
    
      public String qury12 = "select * from asset_inventory where status='Closed' OR status='Sent To Requester'";
     
      @Transactional
      @Modifying(clearAutomatically = true)
      @Query(value = qury12, nativeQuery = true)
      List<Report> viewfeedback();
     
     
      public String qury13 = "select feedback from asset_inventory where asset_id=?";
      @Transactional
      @Query(value = qury13, nativeQuery = true)
      String viewreportdetailof(Integer asset_id);
     
     
      public String qury14 = "select * from asset_inventory WHERE status=? AND notification='read'";
      @Transactional
      @Query(value = qury14, nativeQuery = true)
      List<Report> getuniqueidpending(String status);
   
      public String qury15 = "UPDATE asset_inventory SET  notification1='read' WHERE asset_id=?";

      @Transactional
      @Modifying(clearAutomatically = true)
      @Query(value = qury15, nativeQuery = true)
      
      void updateNotification1(Integer asset_id);
	    
}