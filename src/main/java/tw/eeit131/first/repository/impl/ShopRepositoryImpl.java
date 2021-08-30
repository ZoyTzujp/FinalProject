package tw.eeit131.first.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpSession;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.eeit131.first.model.ShopBean;
import tw.eeit131.first.repository.ShopRepository;

@Repository
public class ShopRepositoryImpl implements ShopRepository {

	@Autowired
	EntityManager entityManager;
	
	@Autowired
	HttpSession session;

	@Override
	public ShopBean findByShopId(int id) {
		String hql = "FROM ShopBean WHERE shopID=:id";
		ShopBean shop = null;
		shop = entityManager.createQuery(hql, ShopBean.class).setParameter("id", id).getSingleResult();
		return shop;

	}

	@Override
	public int saveShopBean(ShopBean shopBean) {
		int n = 0;
//		boolean exist = isMemberExist(shopBean);
		if (shopBean != null) {
			try {
				entityManager.persist(shopBean);
				n = 1;
			} catch (Exception e) {
				n = -2;
			}
		}
		return n;
	}

	@Override
	public ShopBean checkLogin(String email, String password) {
		String hql = "from ShopBean where Email=:email and password=:password";
		Query<ShopBean> query = (Query<ShopBean>) entityManager.createQuery(hql, ShopBean.class);
		query.setParameter("email", email);
		query.setParameter("password", password);
		ShopBean result = query.uniqueResult();
		System.out.println(result);
		return result;

	}

	@Override
	public ShopBean findById(Integer shopID) {

		return entityManager.find(ShopBean.class, shopID);

	}

	@Override
	public void update(ShopBean shopBean) {
		ShopBean shopBean0 = findById(shopBean.getShopID());
		entityManager.detach(shopBean0);
		entityManager.merge(shopBean);

	}

	@Override
	public List<ShopBean> findAll() {
		String hql = "FROM ShopBean";

		return entityManager.createQuery(hql, ShopBean.class).getResultList();

	}
	
	@Override
	public Integer getLogout(HttpSession session) {
		session.invalidate();
		return 0;
	}
	
}
