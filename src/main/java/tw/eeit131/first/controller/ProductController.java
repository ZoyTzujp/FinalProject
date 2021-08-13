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
	
	@GetMapping(value="/getAllProductTypeList", produces = { "application/json; charset=UTF-8" })
	public @ResponseBody List<ProductTypeList> getAllProductTypeList(){
		List<ProductTypeList> productTypeList = productTypeListService.getAllProductTypeList();
		System.out.println(productTypeList);
		return productTypeList;
	}
	
	@GetMapping("/productListSortByTypeID/{productTypeID}")
	public String productListSortByTypeID(@PathVariable("productTypeID") Integer productTypeID,
			                              Model m){
//		System.out.println(productTypeID);
		List<Product> productList = productService.productListSortByTypeID(productTypeID);
		List<ProductTypeList> productTypeList = productTypeListService.getAllProductTypeList();
		System.out.println(productList);
		m.addAttribute("productList",productList);
		m.addAttribute("productTypeList",productTypeList);
		return "Shop";
	}
	
	@PostMapping("/addnewproduct")
//	@ResponseBody
	public String addNewProduct(@RequestParam("shopID")Integer shopID,
			                    @RequestParam("productName")String productName,
			                    @RequestParam("productTypeIDList")String productTypeIDList,
			                    @RequestParam("quantity")Integer quantity,
			                    @RequestParam("price")Integer price,
			                    @RequestParam("productDescribe")String productDescribe,
			                    @RequestParam("producImage")MultipartFile multipartFile,
			                    HttpServletRequest request) throws IllegalStateException, IOException, SerialException, SQLException {
		String fileName = multipartFile.getOriginalFilename();
		System.out.println("OriginalFilename:"+fileName );
		System.out.println("shopID:"+shopID+";productTypeIDList:"+productTypeIDList+";productName:"+productName+";quantity:"+quantity);
		
		String saveDirPath = request.getSession().getServletContext().getRealPath("/")+"uploadTempDir\\";
		File savefileDir = new File(saveDirPath);
		savefileDir.mkdirs();
		
		File saveFilePath = new File(savefileDir,fileName);
		multipartFile.transferTo(saveFilePath);
		System.out.println("saveFilePath:"+saveFilePath);
		
		if(fileName!=null && fileName.length()!=0) {
			String saveFilePathStr = saveDirPath+fileName;
			saveFile(shopID,productTypeIDList,productName,quantity,price,productDescribe,fileName,saveFilePathStr);
		}		
		return "success";
	}
		
	private void saveFile(Integer shopID,String productTypeIDList,String productName,Integer quantity,Integer price,String productDescribe,String fileName,String path) 
			throws IOException, SerialException, SQLException {
		Product product = new Product();
		ShopBean shop = new ShopBean();
		shop = shopService.findByShopId(shopID);
		product.setShop(shop);
		product.setProductName(productName);

		product.setQuantity(quantity);
		product.setPrice(price);
		product.setProductDescribe(productDescribe);
		product.setFilename(fileName);		
		
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
		
		String[] productTypeID0 = productTypeIDList.split(",");
		int[] productTypeID = new int[productTypeID0.length];
		
		for(int i = 0; i < productTypeID0.length;i++) {
			productTypeID[i] = Integer.parseInt(productTypeID0[i]);
			ProductTypeList productTypeList = new ProductTypeList();
//			productTypeList.setProductTypeID(productTypeID[i]);
			productTypeList = productTypeListService.findByProductTypeListID(productTypeID[i]);
			System.out.println("ProductTypeID:"+productTypeList.getProductTypeID());
			product.getProductTypeList().add(productTypeList);
//			productTypeList.getProducts().add(product);
		}		
		productService.insert(product);
		
	}
			
	@GetMapping(value = "/getAllProduct", produces = { "application/json; charset=UTF-8" })
	public @ResponseBody List<Product> getAllProduct(){
		List<Product> productList = productService.getAllProduct();
		System.out.println(productList);
		return productList;
	}	
	
	@GetMapping("/getAllProductInfo")
	public String getAllProduct0(Model m){
		List<Product> productList = productService.getAllProduct();
		List<ProductTypeList> productTypeList = productTypeListService.getAllProductTypeList();
		System.out.println(productList);
		m.addAttribute("productList",productList);
		m.addAttribute("productTypeList",productTypeList);
		return "Shop";
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
	
}

