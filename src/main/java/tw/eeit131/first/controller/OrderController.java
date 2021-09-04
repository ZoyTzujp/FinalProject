package tw.eeit131.first.controller;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.eeit131.first.model.Cart;
import tw.eeit131.first.model.Customer;
import tw.eeit131.first.model.OrderList;
import tw.eeit131.first.model.OrderProduct;
import tw.eeit131.first.model.Product;
import tw.eeit131.first.service.OrderService;
import tw.eeit131.first.service.ProductService;

@Controller
public class OrderController {
	
	@Autowired
	OrderService orderService;

	@Autowired
	ProductService productService;
	
//	//測試用
//	@GetMapping("/showOrderForm")
//    public String showForm(Model m) {
//		OrderList order = new OrderList();
//    	m.addAttribute("orders", order);
//    	return "orderSelect";
//    }
			
//	//測試用
//	//查詢訂單By訂單編號
//	@PostMapping("/orderQueryController")
//	public String findByOrderID(@ModelAttribute("orders")OrderList orderList,
//			                    Model m) {
//		OrderList order = orderService.findByOrderId(orderList.getOrderID());
//		m.addAttribute("orders",order);
//		return "showOrders";
//	}	
	
	@GetMapping("/OrderContent")
	public String showOrderContent() {
		return "OrderContent";
	}

	//登入客戶的訂單列表
	@GetMapping("/getCustomersAllOrder")
	public String getCustomersAllOrder(Model m, HttpSession session){
		Customer customer = (Customer)session.getAttribute("Customer");
		Long customerId = customer.getId();
		List<OrderList> allOrderList = orderService.getOrderListByCustomerId(customerId);
		System.out.println(allOrderList);
		m.addAttribute("allOrderList", allOrderList);
		System.out.println("--------");
		return "OrderList";
	}
	
	//購物車轉訂單送出鈕，新增訂單
		@PostMapping("/addOrderList")
		public @ResponseBody Cart addOrderList(@ModelAttribute("orderAddress")String orderAddress,
									@ModelAttribute("orderEmail")String orderEmail,
									@ModelAttribute("orderPhone")String orderPhone,
				                    Model m,
				                    HttpSession session) {//接收訂單資訊電話、地址、Email、cart)
			//檢查前端傳送來的訂單訊息
			System.out.println("訂單運送聯絡資訊");
			System.out.println("地址:" + orderAddress);
			System.out.println("電子郵件:" + orderEmail);
			System.out.println("連絡電話:" + orderPhone);
			// 取出session中的使用者
			Customer customer = (Customer)session.getAttribute("Customer");
			// 取出在session中的ShoppingCart物件
		    Cart cart = (Cart)session.getAttribute("Cart");
		    // 剛建立狀態預設為"未付款"
		    String orderStatus = "未付款";
		    // 時間
		    Timestamp checkoutDate =new Timestamp(System.currentTimeMillis());
			System.out.println(checkoutDate);
			//產品
			
			if (cart != null) { //避免購物車為空
				//建立orderList
				OrderList orderList = new OrderList();
				orderList.setCustomer(customer);
				orderList.setOrderAddress(orderAddress);
				orderList.setOrderEmail(orderEmail);
				orderList.setOrderPhone(orderPhone);
				orderList.setOrderDate(checkoutDate); //當下時間
				orderList.setOrderStatus(orderStatus);
//				orderList.setOrderID(orderID); //ID自增
				
				orderList.setPrice(0);//暫時寫0，待確定訂單金額後再補
				orderList.setCurrency("台幣");
				orderList.setMethod("Paypal");
				orderList.setIntent("sale");//?再看看這欄位做啥的
				orderList.setDescription("");
				
				
//				orderList.setProducts(products);//欄位不進資料庫
				orderService.insertOrderList(orderList);//存進資料庫
				System.out.println(orderList);
				
				Integer orderID = orderList.getOrderID();
//				System.out.println(orderID);
				
				//建立orderProduct並關聯至orderList
				//接收要建立訂單的<產品ID,數量>
			    Map<Integer, Integer> orderProductMap = cart.getOrderProductByCart();
			    System.out.println(orderProductMap);
//			    迴圈遍歷orderProductMap
			    Integer total = 0;
			    for(Map.Entry entry:orderProductMap.entrySet()){
			    	//輸出每個entry的鍵和值
			    	
			    	System.out.println("產品ID:" + entry.getKey());
			    	System.out.println("購物車數量:" + entry.getValue());
			    	Integer productID = (Integer)entry.getKey();//產品ID
			    	Integer newSaleQty = (Integer)entry.getValue();//數量
			    	
			    	//建立OrderProduct物件
			    	OrderProduct orderProduct = new OrderProduct();
			    	Product product = productService.getProductById(productID);
			    	
			    	orderProduct.setProductID(productID);
			    	orderProduct.setNewSaleQty(newSaleQty);
			    	orderProduct.setProductName(product.getProductName());
			    	orderProduct.setPrice(product.getPrice());
			    	orderProduct.setOrderID(orderID);//與剛建立的訂單關聯
//			    	orderProduct.setSaleQty(product.getSaleQty());
//			    	orderProduct.setQuantity(product.getQuantity());
//			    	orderProduct.setStandard(product.getStandard());
//			    	orderProduct.setId();//ID自增
				    System.out.println(orderProduct);
				    total += newSaleQty * product.getPrice();
				    //存進資料庫
				    orderService.insertOrderProduct(orderProduct);
			    	}
			    //迴圈外，if內
			    Integer price = total + 70;//(小計加上運費)
			    orderList.setPrice(price);//更新訂單總額
			    orderService.insertOrderList(orderList);//存進資料庫
			    
			  //刪除session中的cart物件中的資訊
			    cart.deleteCart();
			}
			System.out.println("跳轉至訂單列表");
			return cart;//轉跳至訂單列表
		}
		
		//藉訂單ID找出訂單內容
		@GetMapping("/OrderContent/{orderListId}")
		public String getOrderProductByOrderListId(@PathVariable("orderListId")Integer orderListId 
											,Model m, HttpSession session){
//			Customer customer = (Customer)session.getAttribute("Customer");
//			System.out.println("1");
//			Long customerId = customer.getId();
			System.out.println("orderListId:" + orderListId);
			List<OrderProduct> allOrderProduct = orderService.getOrderProductByOrderListId(orderListId);
			System.out.println(allOrderProduct);
			//再帶產品名稱與金額
			
			m.addAttribute("allOrderProduct", allOrderProduct);
			System.out.println("------");
			return "OrderContent";
		}
		
}
