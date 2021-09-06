package tw.eeit131.first.service;

import java.util.List;

import tw.eeit131.first.model.OrderList;
import tw.eeit131.first.model.OrderProduct;

public interface OrderService {
	public OrderList findByOrderId(int id);

	OrderList insertOrderList(OrderList orderList);

	void updateOrderList(OrderList orderList);

	OrderProduct insertOrderProduct(OrderProduct orderProduct);
	
	List<OrderList> getOrderListByCustomerId(Long customerId);
	
	List<OrderProduct> getOrderProductByOrderListId(Integer id);

	OrderList getOrderListByOrderListId(Integer id);
	
	List<OrderList> getOrderListByShopId(Integer id);
}
