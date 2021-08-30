package tw.eeit131.first.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tw.eeit131.first.model.Product;
import tw.eeit131.first.model.ProductTypeList;
import tw.eeit131.first.model.ShopBean;
import tw.eeit131.first.service.ProductService;
import tw.eeit131.first.service.ProductTypeListService;
import tw.eeit131.first.service.ShopService;

@Controller
public class ProductController {
			
	@Autowired
	ProductTypeListService productTypeListService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	ShopService shopService;
	
	@GetMapping(value="/getAllProductTypeList.json", produces = { "application/json; charset=UTF-8" })
	public @ResponseBody List<ProductTypeList> getAllProductTypeList(){
		List<ProductTypeList> productTypeList = productTypeListService.getAllProductTypeList();
		return productTypeList;
	}
	
	@GetMapping(value="/getProductTypeListByProductID.json/{productID}", produces = { "application/json; charset=UTF-8" })
	public @ResponseBody List<ProductTypeList> getProductTypeListByProductID(@PathVariable("productID") Integer productID){
		List<ProductTypeList> productTypeList = productTypeListService.getProductTypeListByProductID(productID);
		return productTypeList;
	}
	
	@GetMapping("/getproductDetailsByID/{productID}")
	public String getproductDetailsByID(@PathVariable("productID") Integer productID,
                                     Model m) {
		Product product = productService.getProductById(productID);
		m.addAttribute("product",product);
		return "ProductDetails";		
	}
		
	@GetMapping("/getProductListByTypeID/{productTypeID}")
	public String getProductListByTypeID(@PathVariable("productTypeID") Integer productTypeID,
			                              Model m){
		List<Product> productList = productService.getProductListByTypeID(productTypeID);
		List<ProductTypeList> productTypeList = productTypeListService.getAllProductTypeList();
		System.out.println(productList);
		m.addAttribute("productList",productList);
		m.addAttribute("productTypeList",productTypeList); //給頁面左方商品類型列表使用
		return "Product";
	}
		
	@GetMapping("/singleProductEditForm/{productID}")
	public String singleProductEditForm(@PathVariable("productID") Integer productID,
			                              Model m){
//		System.out.println(productID);
		Product product = productService.getProductById(productID);
		m.addAttribute("product",product);
		return "ProductSingleProductEdit";
	}	
	
	@PostMapping("/editproduct")
	public String editproduct(@RequestParam("shopID")Integer shopID,
			                  @RequestParam("productID")Integer productID,
			                  @RequestParam("saleDate")Timestamp saleDate,
			                  @RequestParam("saleQty")Integer saleQty,
			                  @RequestParam("productName")String productName,
			                  @RequestParam("productTypeIDList")String[] productTypeIDList,
			                  @RequestParam("quantity")Integer quantity,
			                  @RequestParam("price")Integer price,
			                  @RequestParam("standard")String standard,
			                  @RequestParam("capacity")String capacity,
			                  @RequestParam("place")String place,
			                  @RequestParam("preserve")String preserve,
			                  @RequestParam("productDescribe")String productDescribe,
			                  @RequestParam("producImage")MultipartFile multipartFile,
			                  Model m,
			                  HttpServletRequest request) throws SerialException, IOException, SQLException {
		
					
		String saveDirPath = request.getSession().getServletContext().getRealPath("/")+"uploadTempDir\\";
		String fileName;
		String saveFilePathStr;
		
//		String desc = multipartFile.toString();
//		System.out.println("------------:"+desc);		
//		System.out.println(multipartFile.isEmpty());
		
		if(multipartFile.isEmpty()) {
			fileName =productService.getProductById(productID).getFilename();
			saveFilePathStr = saveDirPath+fileName;
		}else {	
			fileName = multipartFile.getOriginalFilename();
			File savefileDir = new File(saveDirPath);
			savefileDir.mkdirs();
			
			File saveFilePath = new File(savefileDir,fileName);
			multipartFile.transferTo(saveFilePath);
			
			saveFilePathStr = saveDirPath+fileName;				
		}
		
		Product product = setFile(shopID,productID,saleDate,saleQty,productName,productTypeIDList,quantity,price,standard,capacity,place,preserve,productDescribe,fileName,saveFilePathStr);
		productService.update(product);
		
		
		//導回ProductEdit.jsp 帶入商品及商品類型資料
		List<Product> productList = productService.getProductListByShopID(shopID);
		List<ProductTypeList> productTypeList = productTypeListService.getAllProductTypeList();
		m.addAttribute("productList",productList);
		m.addAttribute("productTypeList",productTypeList); //給頁面左方商品類型列表使用
				
	    return "ProductEdit";		
	}
	
	private Product setFile(Integer shopID,
			             Integer productID,
			             Timestamp saleDate,
			             Integer saleQty,
			             String productName,
			             String[] productTypeIDList,
			             Integer quantity,
			             Integer price,
			             String standard,
			             String capacity,
			             String place,
			             String preserve,
			             String productDescribe,
			             String fileName,
			             String path) throws IOException, SerialException, SQLException {
		Product product = new Product();
		ShopBean shop = new ShopBean();
		shop = shopService.findByShopId(shopID);		
		product.setShopBean(shop);
		product.setProductID(productID);
		product.setSaleDate(saleDate);
		product.setSaleQty(saleQty);
		product.setProductName(productName);
		product.setQuantity(quantity);
		product.setPrice(price);
		product.setStandard(standard);
		product.setCapacity(capacity);
		product.setPlace(place);
		product.setPreserve(preserve);
		product.setProductDescribe(productDescribe);
		product.setFilename(fileName);		
		
		//將路徑資料夾中圖片上傳至資料庫
		FileInputStream fis1 = new FileInputStream(path);
		byte[] b =new byte[fis1.available()];
		fis1.read(b);
		SerialBlob sb = null;
		fis1.close();
		sb = new SerialBlob(b);
		product.setProducImage(sb);
		
//		Timestamp saleDate =new Timestamp(System.currentTimeMillis());
//		System.out.println(saleDate);
//		product.setSaleDate(saleDate);
		
		int[] productTypeID = new int[productTypeIDList.length];
		
		for(int i = 0; i < productTypeIDList.length;i++) {
			productTypeID[i] = Integer.parseInt(productTypeIDList[i]);
			ProductTypeList productTypeList = new ProductTypeList();
			productTypeList = productTypeListService.getProductTypeListByTypeID(productTypeID[i]);
//			System.out.println("ProductTypeID:"+productTypeList.getProductTypeID());
			product.getProductTypeList().add(productTypeList);
		}				
		return product;		
	}
	
	@PostMapping("/addNewProduct")
	public String addNewProduct(@RequestParam("shopID")Integer shopID,
//			                    @RequestParam("saleDate")Timestamp saleDate,
			                    @RequestParam("productName")String productName,			                   
			                    @RequestParam("productTypeIDList")String[] productTypeIDList,
			                    @RequestParam("quantity")Integer quantity,
			                    @RequestParam("price")Integer price,
			                    @RequestParam("standard")String standard,
			                    @RequestParam("capacity")String capacity,
			                    @RequestParam("place")String place,
			                    @RequestParam("preserve")String preserve,
			                    @RequestParam("productDescribe")String productDescribe,
			                    @RequestParam("producImage")MultipartFile multipartFile,
			                    HttpServletRequest request) throws IllegalStateException, IOException, SerialException, SQLException {
		String fileName = multipartFile.getOriginalFilename();
//		System.out.println("OriginalFilename:"+fileName );
//		System.out.println("addNewProduct=shopID:"+shopID+";productName:"+productName+";quantity:"+quantity);
//		System.out.println("productTypeIDList:"+Arrays.toString(productTypeIDList));
	    
		//抓出圖片路徑(含建立)
		String saveDirPath = request.getSession().getServletContext().getRealPath("/")+"uploadTempDir\\";
		File savefileDir = new File(saveDirPath);
		savefileDir.mkdirs();
		
		File saveFilePath = new File(savefileDir,fileName);
		multipartFile.transferTo(saveFilePath);
		System.out.println("saveFilePath:"+saveFilePath);
		
		if(fileName!=null && fileName.length()!=0) {
			String saveFilePathStr = saveDirPath+fileName;
			saveFile(shopID,productName,productTypeIDList,quantity,price,standard,capacity,place,preserve,productDescribe,fileName,saveFilePathStr);
		}		
		return "success";
	}
		
	private void saveFile(Integer shopID,String productName,String[] productTypeIDList,Integer quantity,Integer price,String standard,String capacity,String place,String preserve,String productDescribe,String fileName,String path) 
			throws IOException, SerialException, SQLException {
		Product product = new Product();
		ShopBean shop = new ShopBean();
		shop = shopService.findByShopId(shopID);
		product.setShopBean(shop);
//		product.setSaleDate(saleDate);
		product.setProductName(productName);
		product.setQuantity(quantity);
		product.setPrice(price);
		product.setStandard(standard);
		product.setCapacity(capacity);
		product.setPlace(place);
		product.setPreserve(preserve);
		product.setProductDescribe(productDescribe);
		product.setFilename(fileName);		
		
		//將路徑資料夾中圖片上傳至資料庫
		FileInputStream fis1 = new FileInputStream(path);
		byte[] b =new byte[fis1.available()];
		fis1.read(b);
		SerialBlob sb = null;
		fis1.close();
		sb = new SerialBlob(b);
		product.setProducImage(sb);
		
		Timestamp saleDate =new Timestamp(System.currentTimeMillis());
		System.out.println(saleDate);
		product.setSaleDate(saleDate);
		
		int[] productTypeID = new int[productTypeIDList.length];
		
		for(int i = 0; i < productTypeIDList.length;i++) {
			productTypeID[i] = Integer.parseInt(productTypeIDList[i]);
			ProductTypeList productTypeList = new ProductTypeList();
			productTypeList = productTypeListService.getProductTypeListByTypeID(productTypeID[i]);
//			System.out.println("ProductTypeID:"+productTypeList.getProductTypeID());
			product.getProductTypeList().add(productTypeList);
		}
				
		productService.insert(product);
		
	}
			
	@GetMapping(value = "/getAllProduct.json", produces = { "application/json; charset=UTF-8" })
	public @ResponseBody List<Product> getAllProduct(){
		List<Product> productList = productService.getAllProduct();
//		System.out.println(productList);
		return productList;
	}	
	
	@GetMapping("/getAllProductInfo")
	public String getAllProductInfo(Model m){
		List<Product> productList = productService.getAllProduct();
		List<ProductTypeList> productTypeList = productTypeListService.getAllProductTypeList();
//		System.out.println(productList);
		m.addAttribute("productList",productList);
		m.addAttribute("productTypeList",productTypeList);
		return "Product";
	}
	
	@Autowired
	ServletContext ctx;
	
	@GetMapping(value = "/getProductImage", produces = { "application/json; charset=UTF-8" })
	public ResponseEntity<byte[]> getProductImage(@RequestParam("id") Integer id) {
		ResponseEntity<byte[]> re = null;
		Product productbean = productService.getProductById(id);
		String filename = productbean.getFilename();
		Blob blob = productbean.getProducImage();
		String mimeType = ctx.getMimeType(filename);
//		System.out.println(mimeType);
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
	
}

