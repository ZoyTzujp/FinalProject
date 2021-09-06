package tw.eeit131.first.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import tw.eeit131.first.model.OrderList;
import tw.eeit131.first.model.OrderProduct;

@Repository
public interface OrderRepository {

	OrderList findByOrderId(int id);
	
	OrderList insertOrderList(OrderList orderList);

	void updateOrderList(OrderList orderList);	
	
	public OrderProduct insertOrderProduct(OrderProduct orderProduct);

	List<OrderList> getOrderListByCustomerId(Long id);

	List<OrderProduct> getOrderProductByOrderListId(Integer id);

	OrderList getOrderListByOrderListId(Integer id);

	List<OrderList> getOrderListByShopId(Integer id);
}
