package springboot.Service;

 

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import springboot.model.Inventory;

 

public interface InventoryService {

    String saveInventory(Inventory inventory,MultipartFile multipartFile); 
    List<Inventory> getinventory(Inventory inventory);
    List<Inventory> getinventorydevice(String device);
    String getUpdatemasterinventory(String tag);
    Inventory getfile(String filename);
    String getUpdatemasterinventoryfortag(String tag); 
    List<Object[]> getinventoryfrommaster();

    List<Object[]> getinventory1();
   List<Object[]> getinventory2();


}