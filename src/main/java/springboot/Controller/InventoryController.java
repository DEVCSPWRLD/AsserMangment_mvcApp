package springboot.Controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import springboot.Service.AssetsService;
import springboot.Service.InventoryService;
import springboot.model.Assetstype;
import springboot.model.Inventory;


@Controller
public class InventoryController {

	
	@Autowired
    private InventoryService inventoryService;
	
    @Autowired
    private AssetsService assetsservice;
    
	//inventory form view page 
	@RequestMapping(value = "/admin/inventoryform", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView registerview(@ModelAttribute("inventory") Inventory inventory,Model model) {
	List<Assetstype> assetslist = assetsservice.getAllAssetsList();
	Map<String, String> var = new LinkedHashMap<>();
	for (int i = 0; i < assetslist.size(); i++) {
	var.put(assetslist.get(i).getAssetstype(), assetslist.get(i).getAssetstype());
	model.addAttribute("assetslist", var.values());
	}
	ModelAndView mav= new ModelAndView("/admin/inventoryform");
	return mav;
	}
	//inventory form save mathod 
	@RequestMapping(value = "/admin/saveinventory", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView register(@ModelAttribute("inventory") Inventory inventory,
            @RequestParam("file") MultipartFile multipartFile) throws IOException {
        // byte file[]=multipartFile.getBytes();

 

        inventoryService.saveInventory(inventory, multipartFile);
        System.out.println(multipartFile.getOriginalFilename());
        File f = new File(multipartFile.getOriginalFilename());
        String absolute = f.getAbsolutePath();
        System.out.println(absolute);
        ModelAndView mav = new ModelAndView("redirect:/admin/inventory");
        return mav;
    }
	// inventory data show page 
	@RequestMapping(value = "/admin/inventory", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView inventory(@ModelAttribute("inventory") Inventory inventory,Model model) {
	List<Inventory> data=inventoryService.getinventory(inventory);
	System.out.println(data);
	model.addAttribute("data",data);
	//assigned
    List<Object[]> data1= inventoryService.getinventory1();
    List<String> ft=new  ArrayList<String>();
    List<String> ft1=new  ArrayList<String>();
    for( int i = 0;i<data1.size();i++) {
        Object[] userDetails = data1.get(i);        
        String First = String.valueOf(userDetails[0]);
        String First1 = String.valueOf(userDetails[1]);
        ft.add(First);
        ft1.add(First1);
        
        model.addAttribute("userDetails",ft);
        model.addAttribute("userDetails1",ft1);
    }
    //not assigned    
        List<Object[]> data2=inventoryService.getinventory2();
        List<String> ft2=new ArrayList<String>();
        List<String> ft3=new ArrayList<String>();
        
        for(int i1 = 0;i1<data2.size();i1++)
        {
            Object[] userDetails2=data2.get(i1);
            String first3 = String.valueOf(userDetails2[0]);
            String first4 = String.valueOf(userDetails2[1]);
            ft2.add(first3);
            ft3.add(first4);            
            model.addAttribute("userDetails2", ft2);
            model.addAttribute("userDetails3", ft3);
            
        }

 

    ModelAndView mav= new ModelAndView("/admin/inventory");
    return mav;
	}
	@RequestMapping("/admin/{fileName}")
    public void getFile(@PathVariable("fileName") String fileName, HttpServletResponse response) throws IOException {

 

        System.out.println(fileName);
        Inventory downloadDocument = inventoryService.getfile(fileName);
        System.out.println(downloadDocument);
        response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
        response.getOutputStream().write(downloadDocument.getBytes());
        
    }

	
	
}
