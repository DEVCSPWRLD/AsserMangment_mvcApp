/*
 * package springboot.Repository;
 * 
 * import java.util.List;
 * 
 * import javax.transaction.Transactional;
 * 
 * import org.springframework.data.jpa.repository.JpaRepository; import
 * org.springframework.data.jpa.repository.Modifying; import
 * org.springframework.data.jpa.repository.Query;
 * 
 * import springboot.model.AssetRequest;
 * 
 * public interface AssetRequestRepository extends
 * JpaRepository<AssetRequest,Integer> { public String qury1 =
 * "INSERT INTO child_asset_inventory(asset_id,asset_request,model_no,serial_no,condition1,"
 * +
 * "descriptions,information,date,supplier,issue_date,warranty_expiration,return_date,unit_price,quantity,value) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"
 * ;
 * 
 * @Modifying
 * 
 * @Transactional
 * 
 * @Query(value = qury1, nativeQuery = true)
 * 
 * 
 * Void saveAssetRequest(Integer asset_id, String asset_request, String
 * model_no, String serial_no, String condition1, String descriptions,String
 * information, String date, String supplier,String issue_date,String
 * warranty_expiration, String return_date,String unit_price, String quantity,
 * String value);
 * 
 * 
 * public String qury2 = "select * from child_asset_inventory where asset_id=?";
 * 
 * @Modifying
 * 
 * @Transactional
 * 
 * @Query(value = qury2, nativeQuery = true) List<AssetRequest>
 * getAssetrequest(Integer assetId); public String qury3=
 * "UPDATE child_asset_inventory SET  model_no=?,serial_no=?,condition1=?,descriptions=?,information=?,date=?,supplier=?,issue_date=?,warranty_expiration=?,return_date=?,unit_price=?,quantity=?,value=? WHERE asset_id=? AND information='Not available' AND asset_request=?"
 * ;
 * 
 * @Transactional
 * 
 * @Modifying(clearAutomatically = true)
 * 
 * @Query(value = qury3, nativeQuery = true) void getUpdatechild(String
 * model_no,String serial_no,String condition1,String descriptions,String
 * information,String date,String supplier,String issue_date,String
 * warranty_expiration,String return_date,String unit_price,String
 * quantity,String value,Integer asset_id,String asset_request);
 * 
 * public String qury4=
 * "UPDATE child_asset_inventory SET  model_no=?,serial_no=?,condition1=?,descriptions=?,information=?,date=?,supplier=?,issue_date=?,warranty_expiration=?,return_date=?,unit_price=?,quantity=?,value=? WHERE asset_id=? AND information='Available' AND asset_request=?"
 * ;
 * 
 * @Transactional
 * 
 * @Modifying(clearAutomatically = true)
 * 
 * @Query(value = qury4, nativeQuery = true) void
 * getUpdatechildreturndate(String model_no,String serial_no,String
 * condition1,String descriptions,String information,String date,String
 * supplier,String issue_date,String warranty_expiration,String
 * return_date,String unit_price,String quantity,String value,Integer
 * asset_id,String asset_request);
 * 
 * }
 */
package springboot.Repository;

 

import java.util.List;

 

import javax.transaction.Transactional;

 

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

 

import springboot.model.AssetRequest;

 

public interface AssetRequestRepository extends JpaRepository<AssetRequest,Integer> 
{
    public String qury1 = "INSERT INTO child_asset_inventory(asset_id,asset_request,model_no,serial_no,condition1,"
            + "descriptions,information,date,supplier,issue_date,warranty_expiration,return_date,unit_price,quantity,value,tag) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
     @Modifying
     @Transactional
    @Query(value = qury1, nativeQuery = true)

 


    Void saveAssetRequest(Integer asset_id, String asset_request, String model_no, String serial_no, String condition1,
            String descriptions,String information, String date, String supplier,String issue_date,String warranty_expiration,
            String return_date,String unit_price, String quantity, String value,String tag);
     
    
      public String qury2 = "select * from child_asset_inventory where asset_id=?";
      
      @Modifying
      
      @Transactional
      
      @Query(value = qury2, nativeQuery = true)
      List<AssetRequest> getAssetrequest(Integer assetId);
      public String qury3= "UPDATE child_asset_inventory SET  model_no=?,serial_no=?,condition1=?,descriptions=?,information=?,date=?,supplier=?,issue_date=?,warranty_expiration=?,return_date=?,unit_price=?,quantity=?,value=?,tag=? WHERE asset_id=? AND information='Not available' AND asset_request=?";
         @Transactional
         @Modifying(clearAutomatically = true)
         @Query(value = qury3, nativeQuery = true)
         void getUpdatechild(String model_no,String serial_no,String condition1,String descriptions,String information,String date,String supplier,String issue_date,String warranty_expiration,String return_date,String unit_price,String quantity,String value,String tag,Integer asset_id,String asset_request);
    
         public String qury4= "UPDATE child_asset_inventory SET  model_no=?,serial_no=?,condition1=?,descriptions=?,information=?,date=?,supplier=?,issue_date=?,warranty_expiration=?,return_date=?,unit_price=?,quantity=?,value=?,tag=? WHERE asset_id=? AND information='Available' AND asset_request=?";
         @Transactional
         @Modifying(clearAutomatically = true)
         @Query(value = qury4, nativeQuery = true)
         void getUpdatechildreturndate(String model_no,String serial_no,String condition1,String descriptions,String information,String date,String supplier,String issue_date,String warranty_expiration,String return_date,String unit_price,String quantity,String value,String tag,Integer asset_id,String asset_request);
    
         
         
         public String qury5 = "SELECT * FROM child_asset_inventory WHERE DATE BETWEEN ? AND ?";
         @Modifying
         @Transactional
         @Query(value = qury5, nativeQuery = true)
         List<AssetRequest> getallexcel(String id1,String id2);
}

