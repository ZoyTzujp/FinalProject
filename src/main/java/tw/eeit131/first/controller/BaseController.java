package tw.eeit131.first.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import tw.eeit131.first.model.Cart;
import tw.eeit131.first.model.Product;
import tw.eeit131.first.model.ProductTypeList;
import tw.eeit131.first.model.ShopBean;
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
    public String showProductCart(HttpSession session) {
		//鄧2021/09/07
		//將購物車產品來自多少商家寫入session
		//取出在session中的ShoppingCart物件
		Cart cart = (Cart)session.getAttribute("Cart");
		if (cart != null) { //避免購物車為空
			//建立set存放所有商家ID
			Set<Integer> shopIdSet = new HashSet<>();
			//遍歷全部orderproduct shopid加進set(避免重複）
			Map<Integer, Integer> orderProductMap = cart.getOrderProductByCart();
			for(Map.Entry entry:orderProductMap.entrySet()){
				Integer productID = (Integer)entry.getKey();//產品ID
				Product product = productService.getProductById(productID);
				System.err.println("product"+product);
//				Integer shopId = product.getShopID();
				ShopBean shop = product.getShop();
				Integer shopId = shop.getShopID();
				shopIdSet.add(shopId);
				System.err.println("shopIdSet"+shopIdSet);
				
				
			}//end of 遍歷全部orderproduct
			Integer shopCount = shopIdSet.size();
			session.setAttribute("shopCount",shopCount);//寫進session
			System.err.println("shopCount:"+shopCount);
		}
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
