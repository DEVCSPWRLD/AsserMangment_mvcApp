package springboot.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import springboot.Repository.InventoryRepository;
import springboot.model.Inventory;

@Service
public class InventoryServiceImpl implements InventoryService {

	private static final Logger logger = LoggerFactory.getLogger(ReportServiceImpl.class);

	@Autowired
	private InventoryRepository inventoryRepository;

	

	@Override
	public List<Inventory> getinventory(Inventory inventory) {
		return inventoryRepository.getinventory(inventory);
	}

	@Override
	public List<Inventory> getinventorydevice(String device) {
		return inventoryRepository.getinventorydevice(device);
	}

	@Override
	public String getUpdatemasterinventory(String tag) {
		String result=null;
        try
        {    
            inventoryRepository.getUpdatemasterinventory(tag);
            
                result="Success";
            
        }catch(Exception e)
        {
            logger.error(e.getMessage());
        }
        return result;
	}

	@Override
	public String saveInventory(Inventory inventory, MultipartFile multipartFile) {
		String result = null;
        try {
            inventoryRepository.saveInventory(inventory.getId(), inventory.getSupplier(),inventory.getBrandname(), inventory.getDevice(),
                    inventory.getDeviceserialno(), inventory.getDevicemodelno(), inventory.getWarrenty(),
                    inventory.getPrice(),inventory.getTag(),inventory.getOwnername(),inventory.getBill_no(),inventory.getPo_value(),inventory.getAssign(),inventory.getEntrydate(),multipartFile.getBytes(),multipartFile.getOriginalFilename(),inventory.getCategory());
        } catch (Exception e) {
        }
        return result;
	}

	@Override
	public Inventory getfile(String filename) {
		// TODO Auto-generated method stub
		return  inventoryRepository.getfile(filename);

	}

	@Override
	public String getUpdatemasterinventoryfortag(String tag) {
		String result=null;
        try
        {    
            inventoryRepository.getUpdatemasterinventoryfortag(tag);
            
                result="Success";
            
        }catch(Exception e)
        {
            logger.error(e.getMessage());
        }
        return result;
	}

	@Override
	public List<Object[]> getinventoryfrommaster() {
		// TODO Auto-generated method stub
		return inventoryRepository.getinventoryfrommaster();
	}

	@Override
	public List<Object[]> getinventory1() {
		// TODO Auto-generated method stub
		return inventoryRepository.getinventory1();
	}

	@Override
	public List<Object[]> getinventory2() {
		// TODO Auto-generated method stub
		return inventoryRepository.getinventory2();
	}

}