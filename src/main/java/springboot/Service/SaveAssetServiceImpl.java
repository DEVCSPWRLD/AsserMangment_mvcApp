package springboot.Service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springboot.Repository.SaveAssetRepository;
import springboot.model.SaveAsset;

@Service
public class SaveAssetServiceImpl  implements SaveAssetService{
	
	private static final Logger logger=LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Autowired
	private SaveAssetRepository saveAssetRepository;
	

	@Override
	public SaveAsset saveAsset(SaveAsset saveasset) 
	{
		SaveAsset assetVal=null;
		try
		{
			
			assetVal=saveAssetRepository.save(saveasset);
		}catch(Exception e)
		{
			logger.error(e.getMessage());
		}
		return assetVal;
	}


	@Override
	public List<SaveAsset> getsaveasset(String eid) {
		// TODO Auto-generated method stub
		return saveAssetRepository.getsaveasset(eid);
	}


	   @Override
	    public String getUpdate(SaveAsset saveAsset, Integer assetId) {
	        // TODO Auto-generated method stub
	         String result=null;
	         saveAssetRepository.getUpdate(saveAsset.getCategory(),saveAsset.getAsset_request(),saveAsset.getStatus(),assetId);
	        result="Success";
	        return result;
	    }


	@Override
	public int getStatus() {
		// TODO Auto-generated method stub
		return saveAssetRepository.getStatus();
	}


	@Override
	public int getStatus1() {
		// TODO Auto-generated method stub
		return saveAssetRepository.getStatus1();
	}


	@Override
	public int getStatus2() {
		// TODO Auto-generated method stub
		return saveAssetRepository.getStatus2();
	}


	@Override
	public int getStatus3() {
		// TODO Auto-generated method stub
		return saveAssetRepository.getStatus3();
	}


	@Override
	public int getStatus4() {
		// TODO Auto-generated method stub
		return saveAssetRepository.getStatus4();
	}


	@Override
	public int getStatus5() {
		// TODO Auto-generated method stub
		return saveAssetRepository.getStatus5();
	}


	@Override
	public int getStatus6() {
		// TODO Auto-generated method stub
		return saveAssetRepository.getStatus6();
		
	}


	@Override
	public int getStatus7() {
		// TODO Auto-generated method stub
		return saveAssetRepository.getStatus7();
	}


	@Override
	public int getStatus8() {
		// TODO Auto-generated method stub
		return saveAssetRepository.getStatus8();
	}


	@Override
	public int getStatus9() {
		// TODO Auto-generated method stub
		return saveAssetRepository.getStatus9();
	}
	 



	

	
}