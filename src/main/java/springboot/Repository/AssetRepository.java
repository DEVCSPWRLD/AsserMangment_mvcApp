package springboot.Repository;

 

import java.util.List;

 

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import springboot.model.Asset;

 

public interface AssetRepository extends JpaRepository<Asset,Integer> {
     Asset findById(int id); 
     List<Asset> findAll(); 
     
     public String qury="select * from asset_inventory where email=? ";
		 @Query(value = qury,nativeQuery = true)
		 List<Asset> getasset(@Param("assetId")String eid);
		 
		 
		 public String qury1="SELECT COUNT(asset_id)FROM asset_inventory WHERE  STATUS='Sent To Reporting Manager' AND notification='unread' AND notification1='unread'";
         @Query(value = qury1,nativeQuery = true)
         Integer countAssetId(int count);
         
         public String qury2="SELECT COUNT(asset_id)FROM asset_inventory WHERE  STATUS='Approved' AND notification1='unread'";
         @Query(value = qury2,nativeQuery = true)
         Integer countApproved(int count1);
}