package springboot.Service;

import java.util.List;

import springboot.model.SaveAsset;

public interface SaveAssetService 
{
	SaveAsset saveAsset(SaveAsset saveasset);

	List<SaveAsset> getsaveasset(String eid);
	
	String getUpdate(SaveAsset saveAsset ,Integer assetId);
	
	 int getStatus();
	 int getStatus1();
	 int getStatus2();
	 int getStatus3();
	 int getStatus4();
	 int getStatus5();
	 int getStatus6();
	 int getStatus7();
     int getStatus8();
     int getStatus9();
}
