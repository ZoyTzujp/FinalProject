package tw.eeit131.first.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import tw.eeit131.first.model.Product;
import tw.eeit131.first.model.ProductTypeList;
import tw.eeit131.first.service.ProductService;
import tw.eeit131.first.service.ProductTypeListService;
import tw.eeit131.first.service.ShopService;

@Controller
public class BaseController {	
	
	@Autowired
	ShopService shopservice;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	ProductTypeListService productTypeListService;
	
	@Autowired
	HttpSession session;
	
	@GetMapping("/")    
	public  String mainController(
			Model model) {
		return "Home"; 	
	}
	
	@GetMapping("/showProductCooperateForm")
    public String showProductCooperateForm() {
    	return "ProductCooperate";
	}
	
	@GetMapping("/shopLoginForm")
    public String shopLoginForm() {
    	return "ShopLogin";
	}
	
	@GetMapping("/logOut")
    public String logOut() {
		shopservice.getLogout(session);
    	return "Home";
	}
	
	@GetMapping("/showProductCart")
    public String showProductCart() {
    	return "ProductCart";
	}
	
	@GetMapping("/showProductEditFormByShopID/{shopID}")
	public String showProductEditFormByShopID(@PathVariable("shopID") Integer shopID,
			                              Model m){
		List<Product> productList = productService.getProductListByShopID(shopID);

		//改成getProductTypeListByShopID，未完成
		List<ProductTypeList> productTypeList = productTypeListService.getAllProductTypeList();   
//		List<ProductTypeList> productTypeList = productTypeListService.getProductTypeListByShopID(shopID);

		
		m.addAttribute("productList",productList);
		m.addAttribute("productTypeList",productTypeList); //給頁面左方商品類型列表使用，未完成
		return "ProductEdit";
	}
	
}
