package springboot.Service;

import java.util.List;

import springboot.model.AssetRequest;

public interface AssetRequestService 
{
String saveAssetRequest(AssetRequest assetRequest);

List<AssetRequest> getAllAssetrequest();

List<AssetRequest> getAssetrequest(Integer assetId);
String getUpdatechild(AssetRequest assetRequest,Integer asset_id); 

String getUpdatechildreturndate(AssetRequest assetRequest,Integer asset_id);



List<AssetRequest> getallexcel(String id1,String id2);

}
