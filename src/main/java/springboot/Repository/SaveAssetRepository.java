package springboot.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import springboot.model.SaveAsset;

public interface SaveAssetRepository extends JpaRepository<SaveAsset, Integer> {
	public String qury = "select * from asset_inventory where email=? ";

	@Query(value = qury, nativeQuery = true)
	List<SaveAsset> getsaveasset(String eid);

	public String qury1 = "select * from asset_inventory where asset_id=? ";

	@Query(value = qury1, nativeQuery = true)
	SaveAsset getSaveAssetByAssetId(String assetname);

	public String qury3 = "UPDATE asset_inventory SET  category=?,asset_request=?,status=? WHERE asset_id=?";

	@Transactional
	@Modifying(clearAutomatically = true)
	@Query(value = qury3, nativeQuery = true)
	void getUpdate(String category, String asset_request, String status, Integer asset_id);

	List<SaveAsset> findByName(String name);

	public String qury4 = "select count(*) from asset_inventory where status='Approved'";

	@Query(value = qury4, nativeQuery = true)
	int getStatus();

	public String qury5 = "select count(*) from asset_inventory where status='Rejected by HR'";

	@Query(value = qury5, nativeQuery = true)
	int getStatus1();

	public String qury6 = "select count(*) from asset_inventory where status='Sent to HR'";

	@Query(value = qury6, nativeQuery = true)
	int getStatus2();

	public String qury7 = "select count(*) from asset_inventory where status='Return by HR'";

	@Query(value = qury7, nativeQuery = true)
	int getStatus3();

	public String qury8 = "select count(*) from asset_inventory where status='Sent To Requester'";

	@Query(value = qury8, nativeQuery = true)
	int getStatus4();

	public String qury9 = "select count(*) from asset_inventory where status='Sent To HR(ON HOLD)'";

	@Query(value = qury9, nativeQuery = true)
	int getStatus5();

	public String qury10 = "select count(*) from asset_inventory where status='partially select'";

	@Query(value = qury10, nativeQuery = true)
	int getStatus6();

	public String qury11 = "select count(*) from asset_inventory where status='Partially update'";

	@Query(value = qury11, nativeQuery = true)
	int getStatus7();

	public String qury12 = "select count(*) from asset_inventory where status='Closed'";

	@Query(value = qury12, nativeQuery = true)
	int getStatus8();

	public String qury13 = "select count(*) from asset_inventory where status='Finally Closed'";

	@Query(value = qury13, nativeQuery = true)
	int getStatus9();

}