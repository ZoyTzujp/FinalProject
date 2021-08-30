package tw.eeit131.first.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.eeit131.first.model.ShopBean;
import tw.eeit131.first.service.ShopService;


@Controller
@SessionAttributes("shopbean")
public class ShopController {
	
	@Autowired
	ShopService service;
	
	@Autowired
	EntityManager entityManager;
	
	@Autowired
	HttpSession session;
		
	public void setService(ShopService service) {
		this.service = service;
	}

	//空白表單頁面
	@GetMapping("/addShopForm")    
	public  String addShopForm() {
		return "ShopAdd";         
	}
	
	@GetMapping("/login")
	public String login() {  //轉至登入頁面
		return "ShopLogin";
	}
	
	@GetMapping("/HomeLogined")    //登入成功
	public  String homeLogin() {
		return "Home";         
	}
	
	@GetMapping("/showAllShopNameInfo")
	public String showAllShopNameInfo() {   //查詢所有商家
		return "ShopShowAllShopName";
	}
		
	@GetMapping("/modifyMemberInfo")   //編輯店家資料
	public String editShopInfo() {
		return "ShopEdit";
	}
		
	@PostMapping("/userLogin")
	public String userLogin(
			@RequestParam("Email") String email,
			@RequestParam("Password") String password,
			Model model,
			HttpSession session
			) {
		
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);

		// 如果 email 欄位為空白，放一個錯誤訊息到 errorMsgMap 之內
		if (email == null || email.length() == 0) {
			errors.put("userName", "帳號欄必須輸入");
		}
		// 如果 password 欄位為空白，放一個錯誤訊息到 errorMsgMap 之內
		if (password == null || password.length() == 0) {
			errors.put("userPwd", "Password is required");
		}
		
		if(errors!=null && !errors.isEmpty()) {
			return "ShopLogin";
		}
		
		ShopBean shopbean = service.checkLogin(email,password);
		
		if(shopbean != null) {
		// OK, 登入成功, 將shopbean物件放入Session範圍內，識別字串為"LoginOK"
		session.setAttribute("LoginOK", shopbean);
		// 建立登出所需的LogoutBean物件
//		LogoutBean logoutBean = new LogoutBean(session);
//		session.setAttribute("logoutBean", logoutBean);
//		System.out.println("會員登入功能之Controller: 登入成功");
		
		}else {
			// NG, 登入失敗, userid與密碼的組合錯誤，放相關的錯誤訊息到 errorMsgMap 之內
			errors.put("LoginError", "該帳號不存在或密碼錯誤");
		}


		
		if(errors.isEmpty()) {
			return "Home";
		}
		
		model.addAttribute("shopEmail", email);
		model.addAttribute("shopPassword", password);

		errors.put("msg", "please input correct username and password");
		
		return "ShopLogin";

	}
	
	//新增店家資料
		@PostMapping("/addNewShop")
		public String addShop(
			@RequestParam("shopName") String shopName,
			@RequestParam("shopKeeper") String shopKeeper,
			@RequestParam("Email") String Email,
			@RequestParam("mobile") String mobile,
			@RequestParam("introduce")String introduce,
			ShopBean shops
			) {	
			
			shops.setShopName(shopName);
			shops.setShopKeeper(shopKeeper);
			shops.setEmail(Email);
			shops.setMobile(mobile);
			shops.setIntroduce(introduce);
			
			int checkResult = service.saveShopBean(shops);
				if(checkResult ==1) {	
						return "Home"; //接註冊成功發驗證信的頁面					
				}		
			return "ShopAdd";   //註冊失敗 回到空白表單		  
		}
	
		@GetMapping("/findSingleShop/{shopID}")
		 public String findSingleShopByTypeID(
				 @PathVariable("shopID") Integer shopID,
		         Model model
		         ){
		  System.out.println(shopID);
		  ShopBean shopBean = service.findById(shopID);
		  model.addAttribute("shopBean",shopBean); 
		  return "ShopInfo";
		 }
	
	@GetMapping(value="/findAllShop.json" , produces = { "application/json; charset=UTF-8" })    
	public  @ResponseBody List<ShopBean> findAllShop() {
		List<ShopBean> shopBeanList =service.findAll();
		return shopBeanList;
	}
	
	
	@GetMapping("/editShop")                //傳出編輯表單
	public @ResponseBody ShopBean editShop(     
			Model model,
			HttpSession session
			) { 
		ShopBean shop = (ShopBean)session.getAttribute("LoginOK");
//		ShopBean shop = (ShopBean)model.getAttribute("shopbean");
		System.out.println("========================");
		System.out.println("shopbean="+shop.getShopID());    
		System.out.println("========================");
		ShopBean shop1 = service.findById(shop.getShopID());   //取得資料庫ID 並傳出
		
		return shop1;
	};
	
	@PutMapping(value ="/updateShop/{shopID}",consumes = { "application/json" }, 
			produces = { "application/json" })
//	@PostMapping(value ="/updateShop")
	public @ResponseBody Map<String, String> update(
			  @RequestBody ShopBean shopBean
			  ,@PathVariable Integer shopID
			) {
		
		shopBean.setEmail(service.findById(shopID).getEmail());
		shopBean.setPassword(service.findById(shopID).getPassword());


		System.out.println(shopBean);
		Map<String, String> map = new HashMap<>();
		try {
		service.update(shopBean);
		map.put("success", "更新成功");
		}catch(Exception e) {
			e.printStackTrace();
			map.put("fail", "更新失敗");
		}
		return map;
	}
	
	//查詢所有店家
	@GetMapping("/showAllShopName")
	public  @ResponseBody List<ShopBean> showAllShopName() {
		List<ShopBean> shopBeanList =service.findAll();
		return shopBeanList;
	}

		
}
