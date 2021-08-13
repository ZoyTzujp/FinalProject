package tw.eeit131.first.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.eeit131.first.model.OrderList;
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

}
