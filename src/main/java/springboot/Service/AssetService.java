package springboot.Service;
import java.util.List;

import org.springframework.stereotype.Service;

import springboot.model.Asset;

@Service
public interface AssetService
{
    Asset saveAsset(Asset asset);
    List<Asset> getAllAssetList();
    
    List<Asset> getasset(String eid);
	List<Asset> getuser(String eid);
}