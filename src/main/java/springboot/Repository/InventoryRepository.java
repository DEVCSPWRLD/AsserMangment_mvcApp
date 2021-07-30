package springboot.Repository;

 

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

 

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

 

import springboot.model.Inventory;

 

public interface InventoryRepository extends JpaRepository<Inventory,Integer> { 
	
//	Optional<Inventory> findByDevicemodelno(String no);
	Optional<Inventory> findBytag(String no);
 
	public String qury1 = "INSERT INTO master_inventory(id,supplier,brandname,device,deviceserialno,devicemodelno,warrenty,price,tag,ownername,bill_no,po_value,assign,entrydate,bytes,filename,category) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    @Modifying
    @Transactional
    @Query(value = qury1, nativeQuery = true)
    Void saveInventory(Integer id,String supplier,String brandname,String device,String deviceserialno,String devicemodelno,String warrenty,Integer price,String tag,String ownername,String bill_no,String po_value,Integer assign,String entrydate,byte[] bytes,String filename,String category);

public String qury="select * from master_inventory";
@Query(value = qury,nativeQuery = true)
List<Inventory> getinventory(Inventory inventory);
public String qury2="SELECT * FROM master_inventory where device=? AND assign=0 GROUP BY supplier";
@Modifying
@Transactional
@Query(value = qury2,nativeQuery = true)
List<Inventory> getinventorydevice(String device);

public String qury4= "UPDATE master_inventory SET  assign=1 WHERE tag=?";
@Transactional
@Modifying(clearAutomatically = true)
@Query(value = qury4, nativeQuery = true)
void getUpdatemasterinventory(String tag);


public String qury5="SELECT * FROM master_inventory where filename=?";
@Transactional
@Query(value = qury5,nativeQuery = true)
Inventory getfile(String filename);
 
public String qury6= "UPDATE master_inventory SET  assign=0 WHERE tag=?";
@Transactional
@Modifying(clearAutomatically = true)
@Query(value = qury6, nativeQuery = true)
void getUpdatemasterinventoryfortag(String tag);

public String qury7="select device from master_inventory  GROUP BY device";
@Query(value = qury7,nativeQuery = true)
List<Object[]> getinventoryfrommaster();

public String qury8="SELECT COUNT(device),device FROM master_inventory WHERE assign=1 GROUP BY device";
@Transactional
@Query(value = qury8,nativeQuery = true)
List<Object[]> getinventory1();

 


public String qury9="SELECT COUNT(device),device FROM master_inventory WHERE assign=0 GROUP BY device";
@Transactional
@Query(value = qury9,nativeQuery = true)
List<Object[]> getinventory2();



}