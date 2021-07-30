package springboot.Service;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import springboot.Repository.AssetRepository;
import springboot.model.Asset;

 @Service
public class AssetServiceImpl implements AssetService {

	 
	 private static final Logger logger=LoggerFactory.getLogger(AssetServiceImpl.class);
        
        @Autowired
        private AssetRepository assetRepository;
        
        @Override
        public Asset saveAsset(Asset asset)
        {
            Asset assetVal=null;
            try
            {
                assetVal=assetRepository.save(asset);
            }catch(Exception e)
            {
                logger.error(e.getMessage());
            }
            return assetVal;
        }
        
        @Override
        public List<Asset> getAllAssetList() {
            return assetRepository.findAll();
        }
    
        @Override
		public List<Asset> getasset(String eid) {
			// TODO Auto-generated method stub
			return assetRepository.getasset(eid);
		}

		@Override
		public List<Asset> getuser(String eid) {
			// TODO Auto-generated method stub
			return null;
		}

}