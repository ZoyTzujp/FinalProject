package tw.eeit131.first.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.persistence.EntityManager;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import tw.eeit131.first.model.Product;
import tw.eeit131.first.model.ShopBean;
import tw.eeit131.first.model.ShopComment;
import tw.eeit131.first.model.Utility;
import tw.eeit131.first.service.ShopService;

@Controller
@SessionAttributes("shopbean")
public class ShopController {
	

	
	@Autowired
	HttpServletRequest request;
	
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
		
			if(shopbean.isEnabled() == true) {
					session.setAttribute("LoginOK", shopbean);
					return "Home";
			}
		}else {
			// NG, 登入失敗, userid與密碼的組合錯誤，放相關的錯誤訊息到 errorMsgMap 之內
			errors.put("LoginError", "該信箱不存在或密碼錯誤");
		}

		model.addAttribute("shopEmail", email);
		model.addAttribute("shopPassword", password);

		errors.put("msg", "信箱尚未驗證");
		
		return "ShopLogin";

	}
	

	//新增店家資料
			@PostMapping("/addNewShop")
			public String addShop(
					@RequestParam("shopName") String shopName,
					@RequestParam("shopKeeper") String shopKeeper,
					@RequestParam("shopPhone") String shopPhone,
					@RequestParam("webLink") String webLink,
					@RequestParam("Email") String Email,
					@RequestParam("mobile") String mobile,
					@RequestParam("introduce")String introduce,
					@RequestParam("password")String password,
					@RequestParam("shopImage")MultipartFile multipartFile
					) throws IllegalStateException, IOException, SerialException, SQLException, MessagingException {	
					String fileName = multipartFile.getOriginalFilename();
					System.out.println("OriginalFilename:"+fileName );
					//抓出圖片路徑(含建立)
					String saveDirPath = request.getSession().getServletContext().getRealPath("/")+"uploadTempDir\\";
					File savefileDir = new File(saveDirPath);
					savefileDir.mkdirs();
					
					File saveFilePath = new File(savefileDir,fileName);
					multipartFile.transferTo(saveFilePath);
					System.out.println("saveFilePath:"+saveFilePath);
				
					if(fileName!=null && fileName.length()!=0) {
						
						String saveFilePathStr = saveDirPath+fileName;
						saveFile(shopName,shopKeeper,shopPhone,webLink,Email,mobile,introduce,password,fileName,saveFilePathStr);
						
						return "Shopsuccess";
					}	
				return "ShopAdd";   //註冊失敗 回到空白表單		  
			}
	
			private void saveFile(String shopName,String shopKeeper,String shopPhone,String webLink,String Email,String mobile,String introduce,String password,String fileName,String path) 
					throws IOException, SerialException, SQLException, MessagingException {
				ShopBean shops = new ShopBean();
				shops.setShopName(shopName);
				shops.setShopKeeper(shopKeeper);
				shops.setShopPhone(shopPhone);
				shops.setWebLink(webLink);
				shops.setEmail(Email);
				shops.setMobile(mobile);
				shops.setIntroduce(introduce);
				shops.setPassword(password);
				shops.setFilename(fileName);		
				
				//將路徑資料夾中圖片上傳至資料庫
				FileInputStream fis1 = new FileInputStream(path);
				byte[] b =new byte[fis1.available()];
				fis1.read(b);
				SerialBlob sb = null;
				fis1.close();
				sb = new SerialBlob(b);
				shops.setShopImage(sb);
				
				service.saveShopBean(shops);
				String siteURL = Utility.getSiteURL(request);
				service.sendVerificationEmail(shops,siteURL);
			}
			
			@GetMapping("/verify")
			public String verifyAccount(@Param("code") String code,Model model) {
				boolean verified = service.verify(code);
			
				String pageTitle = verified ? "驗證成功!" : "驗證失敗!";
				model.addAttribute("pageTitle",pageTitle);
				return (verified ? "ShopverifySuccess":"ShopAdd");
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
	public @ResponseBody Map<String, String> update(     //將物件轉成JSON格式
			  @RequestBody ShopBean shopBean             //將JSON格式物件轉為java物件
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

	//將資料傳給 Modal 彈出框
		@GetMapping("/findSingleShop1/{shopID}")               
		public @ResponseBody ShopBean editShop(     
				@PathVariable("shopID") Integer shopID,
		         Model model
		         ){
			System.out.println(shopID);
			ShopBean shopBean = service.findById(shopID);
			model.addAttribute("shopBean",shopBean);
			return shopBean;
		};	
		
		@Autowired
		ServletContext ctx;
		
		@GetMapping(value = "/getShopImage", produces = { "application/json; charset=UTF-8" })
		public ResponseEntity<byte[]> getShopImag(@RequestParam("id") Integer id) {
			ResponseEntity<byte[]> re = null;
			System.out.println("有經過這邊");
			ShopBean shopBean = service.findById(id);
			System.out.println("東西傳出去");
			String filename = shopBean.getFilename();
			Blob blob = shopBean.getShopImage();
			String mimeType = ctx.getMimeType(filename);
			System.out.println(mimeType);
			MediaType mediaType = MediaType.valueOf(mimeType);
			HttpHeaders headers = new HttpHeaders();
			try {
				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				InputStream is = blob.getBinaryStream();
				byte[] b = new byte[81920];
				int len = 0;
				while ((len = is.read(b)) != -1) {
					baos.write(b, 0, len);
				}
				headers.setContentType(mediaType);
				headers.setCacheControl(CacheControl.noCache().getHeaderValue());
				re = new ResponseEntity<byte[]>(baos.toByteArray(), headers, HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
			}	
			return re;
		}
		
		//查看多筆留言
		@GetMapping("/findCommentsById/{shopID}")  
		public @ResponseBody List<ShopComment> findCommentsById(
				@PathVariable Integer shopID				
				){
		
			List<ShopComment> shopCommentList = service.findCommentsById(shopID);
			System.err.println("shopID="+shopID);
			return shopCommentList; 
		}
		
		//新增留言
		@PostMapping("/saveComment/{shopID}")
		public @ResponseBody List<ShopComment> saveComment(
				@RequestParam("Name") String name,
				@RequestParam("email") String email,
				@RequestParam("shopContent") String shopContent,
				@PathVariable Integer shopID,
				ShopComment shopComment
				) {
			System.out.println("name="+name);
			System.out.println("email="+email);
			ShopBean shopBean = service.findByShopId(shopID);
			shopComment.setShopBean(shopBean);
			shopComment.setName(name);
			shopComment.setEmail(email);
			shopComment.setShopContent(shopContent);
			System.out.println(shopComment.toString());
			service.saveComments(shopComment);
			
			List<ShopComment> sc = service.findCommentsById(shopID);
			return sc;
		}
		
}

