package tw.eeit131.first.repository.impl;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.eeit131.first.model.OrderList;
import tw.eeit131.first.repository.OrderRepository;

@Repository
public class OrderRepositoryImpl implements OrderRepository{
	
	@Autowired
	EntityManager entityManager;

	@Override
	public OrderList findByOrderId(int id) {
		String hql = "FROM Order WHERE orderID=:id";
		OrderList order = null;
		order= entityManager.createQuery(hql,OrderList.class)
		                    .setParameter("id", id)
		                    .getSingleResult();	
        return order;
        
	}
	
}
