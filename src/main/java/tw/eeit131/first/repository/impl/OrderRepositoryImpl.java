package tw.eeit131.first.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.eeit131.first.model.OrderList;
import tw.eeit131.first.model.OrderProduct;
import tw.eeit131.first.repository.OrderRepository;

@Repository
public class OrderRepositoryImpl implements OrderRepository{
	
	@Autowired
	EntityManager entityManager;

	//測試用
	@Override
	public OrderList findByOrderId(int id) {
		String hql = "FROM Order WHERE orderID=:id";
		OrderList order = null;
		order= entityManager.createQuery(hql,OrderList.class)
		                    .setParameter("id", id)
		                    .getSingleResult();	
        return order;
	}
	
	// 鄧
	// 新增orderList
	@Override
	public OrderList insertOrderList(OrderList orderList) {
		entityManager.persist(orderList);//等於 Hibernate 的 Session.save()
		return orderList;
	}
		
	// 修改orderList(更新訂單狀態用)
	@Override
	public void updateOrderList(OrderList orderList) {
		entityManager.merge(orderList);		
	}
		
	//藉使用者ID尋找其訂單
	@Override
	public List<OrderList> getOrderListByCustomerId(Long id) {
		String hql = "FROM OrderList WHERE customerID=:id";
		List<OrderList> orderList = null;
		orderList = entityManager.createQuery(hql, OrderList.class)
			                    .setParameter("id", id)
			                    .getResultList();	
	    return orderList;
	}
	
	//藉商家ID尋找其訂單
	@Override
	public List<OrderList> getOrderListByShopId(Integer id) {
		String hql = "FROM OrderList WHERE shopID=:id";
		List<OrderList> orderList = null;
		orderList = entityManager.createQuery(hql, OrderList.class)
				                 .setParameter("id", id)
				                 .getResultList();	
		return orderList;
	}
	
	//藉訂單ID尋找訂單
	@Override
	public OrderList getOrderListByOrderListId(Integer id) {
		String hql = "FROM OrderList WHERE orderID=:id";
		OrderList orderList = null;
		orderList = entityManager.createQuery(hql, OrderList.class)
								.setParameter("id", id)
								.getSingleResult();	
		return orderList;
	}
		
	//藉訂單ID尋找其訂單內容
	@Override
	public List<OrderProduct> getOrderProductByOrderListId(Integer id) {
		String hql = "FROM OrderProduct WHERE ORDERID=:id";
		List<OrderProduct> orderProduct = null;
		orderProduct = entityManager.createQuery(hql, OrderProduct.class)
									.setParameter("id", id)
									.getResultList();	
		return orderProduct;
	}
		
	// 新建購物車內產品
	@Override
	public OrderProduct insertOrderProduct(OrderProduct orderProduct) {
		entityManager.persist(orderProduct);//等於 Hibernate 的 Session.save()
		return orderProduct;
	}
	
}
