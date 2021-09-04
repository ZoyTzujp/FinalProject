package tw.eeit131.first.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.eeit131.first.model.OrderList;
import tw.eeit131.first.model.OrderProduct;
import tw.eeit131.first.repository.OrderRepository;
import tw.eeit131.first.service.OrderService;

@Service
@Transactional
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	OrderRepository orderRepository ;

	@Override
	public OrderList findByOrderId(int id) {
		return orderRepository.findByOrderId(id);
	}

	@Override
	public OrderList insertOrderList(OrderList orderList) {
		return orderRepository.insertOrderList(orderList);
	};
	
	@Override
	public void update(OrderList orderList) {
		orderRepository.update(orderList);
	};	
	
	@Override
	public OrderProduct insertOrderProduct(OrderProduct orderProduct) {
		return orderRepository.insertOrderProduct(orderProduct);
	}

	@Override
	public List<OrderList> getOrderListByCustomerId(Long id) {
		return orderRepository.getOrderListByCustomerId(id);
	}

	@Override
	public List<OrderProduct> getOrderProductByOrderListId(Integer id) {
		return orderRepository.getOrderProductByOrderListId(id);
	}
}
