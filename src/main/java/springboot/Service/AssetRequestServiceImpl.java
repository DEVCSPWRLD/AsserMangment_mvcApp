package springboot.Service;

 

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

 


import springboot.Repository.AssetRequestRepository;
import springboot.model.AssetRequest;
@Service
public class AssetRequestServiceImpl implements AssetRequestService
{
    private static final Logger logger=LoggerFactory.getLogger(ReportServiceImpl.class);
    @Autowired
    private AssetRequestRepository assetRequestRepository;

 

    @Override
    public String saveAssetRequest(AssetRequest assetRequest) {
        String result=null;
        try {
            
         assetRequestRepository.saveAssetRequest(assetRequest.getAsset_id(),assetRequest.getAsset_request(), 
                 assetRequest.getModel_no(), assetRequest.getSerial_no(), assetRequest.getCondition1(),
                 assetRequest.getDescriptions(),assetRequest.getInformation(),assetRequest.getDate(),assetRequest.getSupplier(),
                 assetRequest.getIssue_date(),assetRequest.getWarranty_expiration(),assetRequest.getReturn_date(),
                 assetRequest.getUnit_price(),assetRequest.getQuantity(),assetRequest.getValue(),assetRequest.getTag());
         
        }catch(Exception e) {
            
        }
        return result;
        }

 

    @Override
    public List<AssetRequest> getAllAssetrequest() {
        // TODO Auto-generated method stub
        return assetRequestRepository.findAll();
    }

 

    @Override
    public List<AssetRequest> getAssetrequest(Integer assetId) {
        // TODO Auto-generated method stub
        return assetRequestRepository.getAssetrequest(assetId);
    }
    @Override
    public String getUpdatechild(AssetRequest assetRequest, Integer asset_id) {
        String result=null;
        try
        {    
   

 

            assetRequestRepository.getUpdatechild(assetRequest.getModel_no(),assetRequest.getSerial_no(),
                    assetRequest.getCondition1(),assetRequest.getDescriptions(),assetRequest.getInformation(),
                    assetRequest.getDate(),assetRequest.getSupplier(),
                    assetRequest.getIssue_date(),assetRequest.getWarranty_expiration(),
                    assetRequest.getReturn_date(),assetRequest.getUnit_price(),assetRequest.getQuantity(),assetRequest.getValue(),assetRequest.getTag(),asset_id,assetRequest.getAsset_request());
            System.out.println(assetRequestRepository.count());
                result="Success";
            
        }catch(Exception e)
        {
            logger.error(e.getMessage());
        }
        return result;
    }
    
    
    

 

    @Override
    public String getUpdatechildreturndate(AssetRequest assetRequest, Integer asset_id) {
        String result=null;
        try
        {    
   

 

            assetRequestRepository.getUpdatechildreturndate(assetRequest.getModel_no(),assetRequest.getSerial_no(),
                    assetRequest.getCondition1(),assetRequest.getDescriptions(),assetRequest.getInformation(),
                    assetRequest.getDate(),assetRequest.getSupplier(),
                    assetRequest.getIssue_date(),assetRequest.getWarranty_expiration(),
                    assetRequest.getReturn_date(),assetRequest.getUnit_price(),assetRequest.getQuantity(),assetRequest.getValue(),assetRequest.getTag(),asset_id,assetRequest.getAsset_request());
           
                result="Success";
            
        }catch(Exception e)
        {
            logger.error(e.getMessage());
        }
        return result;
    }



	@Override
	public List<AssetRequest> getallexcel(String id1, String id2) {
		// TODO Auto-generated method stub
		return assetRequestRepository.getallexcel(id1, id2);
	}
    }