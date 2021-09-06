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
import tw.eeit131.first.model.ShopBean;
import tw.eeit131.first.service.OrderService;
import tw.eeit131.first.service.ProductService;
import tw.eeit131.first.service.ShopService;

@Controller
public class OrderController {
	
	@Autowired
	OrderService orderService;

	@Autowired
	ProductService productService;
	
	@Autowired
	ShopService shopService;
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

//	@GetMapping("/OrderPayment")
//	public String OrderPayment() {
//		System.out.println("轉跳支付訊息頁面");
//		return "OrderPayment";
//	}
	
	@GetMapping("/OrderPayment/{orderListId}")
	public String OrderPayment(@PathVariable("orderListId") Integer orderListId,
								HttpSession session, Model m) {
		System.out.println("支付訊息頁面");
		OrderList orderList = orderService.getOrderListByOrderListId(orderListId);
		System.out.println("orderListid:"+orderListId);
		m.addAttribute("orderList", orderList);
		session.setAttribute("orderListIdGoingToPay", orderListId);
		return "OrderPayment";
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
	
	//登入商家的訂單列表
	@GetMapping("/getShopsAllOrder")
	public String getShopsAllOrder(Model m, HttpSession session){
		ShopBean shop = (ShopBean)session.getAttribute("LoginOK");
		Integer shopID = shop.getShopID();
		List<OrderList> allOrderList = orderService.getOrderListByShopId(shopID);
		m.addAttribute("shopAllOrderList", allOrderList);
		return "OrderListForShop";
	}
	
	//購物車轉訂單送出鈕，新增訂單
	@PostMapping("/addOrderList")
	public @ResponseBody Cart addOrderList(@ModelAttribute("orderAddress")String orderAddress,
									@ModelAttribute("orderEmail")String orderEmail,
									@ModelAttribute("orderPhone")String orderPhone,
									@ModelAttribute("orderDescription")String orderDescription,
				                    Model m,
				                    HttpSession session) {//接收訂單資訊電話、地址、Email、cart
		//檢查前端傳送來的訂單訊息
		System.out.println("訂單運送聯絡資訊");
		System.out.println("地址:" + orderAddress);
		System.out.println("電子郵件:" + orderEmail);
		System.out.println("連絡電話:" + orderPhone);
		System.out.println("備註" + orderDescription);
		// 取出session中的使用者
		Customer customer = (Customer)session.getAttribute("Customer");
		// 取出在session中的ShoppingCart物件
		Cart cart = (Cart)session.getAttribute("Cart");
		// 剛建立狀態預設為"未付款"
		String orderStatus = "未付款";
		// 時間
		Timestamp checkoutDate = new Timestamp(System.currentTimeMillis());
		System.out.println(checkoutDate);
			
		if (cart != null) { //避免購物車為空
			//建立orderList
			OrderList orderList = new OrderList();
			orderList.setCustomer(customer);
			orderList.setOrderAddress(orderAddress);
			orderList.setOrderEmail(orderEmail);
			orderList.setOrderPhone(orderPhone);
			orderList.setOrderDate(checkoutDate); //當下時間
			orderList.setOrderStatus(orderStatus);
//			orderList.setOrderID(orderID); //ID自增
			
			orderList.setPrice(0);//暫時寫0，待確定訂單金額後再補
			orderList.setCurrency("TWD");
			orderList.setMethod("paypal");
			orderList.setIntent("sale");//?再看看這欄位做啥的
			if (orderDescription != null) {
				orderList.setDescription(orderDescription);//有寫備註就存備註
			} else {
				orderList.setDescription("");//沒寫備註就存空值
			}
			
//			orderList.setProducts(products);//欄位不進資料庫
			orderService.insertOrderList(orderList);//存進資料庫
			System.out.println(orderList);
				
			Integer orderID = orderList.getOrderID();
				
			//建立orderProduct並關聯至orderList
			//接收要建立訂單的<產品ID,數量>
			Map<Integer, Integer> orderProductMap = cart.getOrderProductByCart();
			System.out.println(orderProductMap);
//			迴圈遍歷orderProductMap
			Integer total = 0;
			Product product = null;
			ShopBean shop = null;
			for(Map.Entry entry:orderProductMap.entrySet()){
			    //輸出每個entry的鍵和值
			    	
			    System.out.println("產品ID:" + entry.getKey());
			    System.out.println("購物車數量:" + entry.getValue());
			    Integer productID = (Integer)entry.getKey();//產品ID
			    Integer newSaleQty = (Integer)entry.getValue();//數量
			    	
			    //建立OrderProduct物件
			    OrderProduct orderProduct = new OrderProduct();
			    product = productService.getProductById(productID);
			    System.out.println(product);
			    
			    shop = product.getShop();
			    orderProduct.setProductID(productID);
			    orderProduct.setNewSaleQty(newSaleQty);
			    orderProduct.setProductName(product.getProductName());
			    orderProduct.setPrice(product.getPrice());
			    orderProduct.setOrderID(orderID);//與剛建立的訂單關聯
				System.out.println(orderProduct);
				//持續累計各產品小計
				total += newSaleQty * product.getPrice();
				//存進資料庫
				orderService.insertOrderProduct(orderProduct);
			    }
			//迴圈外，if內
			Integer price = total + 70;//(產品金額總和+運費)
			orderList.setPrice(price);//更新訂單總額
			orderList.setShop(shop);
			orderService.updateOrderList(orderList);//存進資料庫
			    
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
			System.out.println("orderListId:" + orderListId);
			List<OrderProduct> allOrderProduct = orderService.getOrderProductByOrderListId(orderListId);
			System.out.println(allOrderProduct);
			OrderList orderList = orderService.getOrderListByOrderListId(orderListId);
			double price = orderList.getPrice();
			String orderStatus = orderList.getOrderStatus();
			m.addAttribute("allOrderProduct", allOrderProduct);//所有產品
//			m.addAttribute("orderList", orderList);
			m.addAttribute("orderListId", orderListId);//訂單id
			m.addAttribute("price", price);//訂單總額
			m.addAttribute("orderStatus", orderStatus);//訂單狀態
			System.out.println("------");
			return "OrderContent";
		}
		
		//藉訂單ID找出訂單內容
		@GetMapping("/OrderContentForShop/{orderListId}")
		public String getOrderProductByOrderListIdForShop(@PathVariable("orderListId")Integer orderListId 
													,Model m, HttpSession session){
			System.out.println("orderListId:" + orderListId);
			List<OrderProduct> allOrderProduct = orderService.getOrderProductByOrderListId(orderListId);
			System.out.println(allOrderProduct);
			OrderList orderList = orderService.getOrderListByOrderListId(orderListId);
			double price = orderList.getPrice();
			String orderStatus = orderList.getOrderStatus();
			m.addAttribute("allOrderProductShop", allOrderProduct);//所有產品
//			m.addAttribute("orderList", orderList);
			m.addAttribute("orderListIdShop", orderListId);//訂單id
			m.addAttribute("priceShop", price);//訂單總額
			m.addAttribute("orderStatusShop", orderStatus);//訂單狀態
			System.out.println("------");
			return "OrderContentForShop";
		}
		
		
	//商家寄出商品後續
	@GetMapping("/endOfOrderProcess/{orderListId}")
	public String abc(@PathVariable("orderListId")Integer orderListId) {
		//修改訂單狀態為"交易完成"
		OrderList orderList = orderService.getOrderListByOrderListId(orderListId);
		orderList.setOrderStatus("完成交易");
		orderService.updateOrderList(orderList);//更新資料庫
		//修改產品"庫存"、"已售出"欄位
		List<OrderProduct> orderProductList = orderService.getOrderProductByOrderListId(orderListId);
		//迴圈
		for (int i = 0; i < orderProductList.size(); i++) {
			OrderProduct orderproduct = orderProductList.get(i);
			Integer productID = orderproduct.getProductID();//產品ID
			Integer newSaleQty = orderproduct.getNewSaleQty();//賣出數量
			Product product = productService.getProductById(productID);
			Integer quantity = product.getQuantity();
			Integer saleQty = product.getSaleQty();
			System.out.println("newSaleQty:"+newSaleQty);
			System.out.println("product:"+product);
			product.setQuantity(quantity - newSaleQty);//扣除庫存數量
			product.setSaleQty(saleQty + newSaleQty);//加上累計賣出數量
			productService.update(product);//更新資料庫
		}
		//跳轉頁面
		return "redirect:/OrderContentForShop/" + orderListId;
	}
}
