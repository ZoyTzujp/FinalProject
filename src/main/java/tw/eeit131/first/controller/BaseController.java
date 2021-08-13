package tw.eeit131.first.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import tw.eeit131.first.model.ProductTypeList;
import tw.eeit131.first.model.ShopBean;
import tw.eeit131.first.service.ProductTypeListService;
import tw.eeit131.first.service.ShopService;

@Controller
public class BaseController {
	
//	@GetMapping("/")
//	public String GoToHomePage() {
//		return"Home(login)";
//		return"Home";
//	}
	
	@Autowired
	ShopService shopservice;
	
	@Autowired
	ProductTypeListService productTypeListService;
	
	@GetMapping("/")    
	public  String mainController(
			Model model) {
		List<ShopBean> shopBeanList=shopservice.findAll();
		List<ProductTypeList> productTypeList = productTypeListService.getAllProductTypeList();
		System.out.println(shopBeanList);
//		model.addAttribute("shopBeanList",shopBeanList);
//		model.addAttribute("productTypeList",productTypeList);
		return "Home(login)"; 	
	}
	
	@GetMapping("/showProductCooperateForm")
    public String showProductCooperateForm() {
    	return "ProductCooperate";
	}
	
	@GetMapping("/shopLoginForm")
    public String shopLoginForm() {
    	return "login";
	}
	
	@GetMapping("/logOut")
    public String logOut() {
		shopservice.getLogout();
    	return "Home(login)";
	}
	
}
