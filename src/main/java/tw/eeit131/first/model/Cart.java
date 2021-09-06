package tw.eeit131.first.model;

import java.util.LinkedHashMap;
import java.util.Map;

public class Cart {
	
	private Map<Integer, OrderProduct> cart = new LinkedHashMap< >();
	
	public Map<Integer, OrderProduct>  getContent() { // ${Cart.content}
		return cart;
	}
	
	//將項目加入購物車
	public void addToCart(int productID, OrderProduct orderProduct) {
		if (orderProduct.getNewSaleQty() <= 0 ) {
			return;
		}
	        // 如果客戶在伺服器端已有此項商品的資料，則客戶『加購』此項商品
		if ( cart.get(productID) == null ) {
		    cart.put(productID, orderProduct);
		}else {
			OrderProduct orderProduct0 = cart.get(productID);
			// 加購的數量：orderProduct.getSaleQty()
			// 原有的購買數量：orderProduct0.getSaleQty()
			System.out.println("-----cartQty------->"+orderProduct.getNewSaleQty()+"+"+orderProduct0.getNewSaleQty());
			orderProduct0.setNewSaleQty(orderProduct.getNewSaleQty()+orderProduct0.getNewSaleQty());
		}
	}
	
	//更新購買數量
	public boolean modifyQty(int productID, int newSaleQty) {
		if ( cart.get(productID) != null ) {
		   OrderProduct  bean = cart.get(productID);
		   bean.setNewSaleQty(newSaleQty);
	       return true;
		} else {
		   return false;
		}
	}
	
	// 刪除某項商品
	public int deleteCartItem(int productID) {
		if ( cart.get(productID) != null ) {
	       cart.remove(productID);  // Map介面的remove()方法
	       return 1;
		} else {
		   return 0;
		}
	}
	
	//查看購物車內容物(鄧)
	public Map<Integer, Integer> getOrderProductByCart(){//List<OrderProduct>
		Map<Integer, Integer> orderProductMap = new LinkedHashMap<>();
		for (OrderProduct orderProduct : cart.values()) {
//			System.out.println("產品名 = " + orderProduct.getProductName());
//			System.out.println("產品ID = " + orderProduct.getProductID();
//			System.out.println("產品數量 = " + orderProduct.getNewSaleQty());
//			String name = orderProduct.getProductName();
			Integer productId = orderProduct.getProductID();
			Integer qty = orderProduct.getNewSaleQty();
			orderProductMap.put(productId,qty);
		}
		return orderProductMap;
	}
		
	//清除購物車(生成訂單後清除購物車)(鄧)
	public void deleteCart() {
		cart.clear(); //移除字典所有鍵值對
	}
	
	//測試用(鄧)
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Cart [cart=");
		builder.append(cart);
		builder.append("]");
		return builder.toString();
	}
	
}
