package tw.eeit131.first.repository;

import org.springframework.stereotype.Repository;

import tw.eeit131.first.model.OrderList;

@Repository
public interface OrderRepository {

	OrderList findByOrderId(int id);	
}
