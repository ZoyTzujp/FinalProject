package tw.eeit131.first.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpSession;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;

import tw.eeit131.first.model.Product;
import tw.eeit131.first.model.ShopBean;
import tw.eeit131.first.model.ShopComment;
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
	public ShopBean findByShopEmail(String email) {
		String hql = "FROM ShopBean WHERE Email=:email";
		ShopBean shop = null;
		shop = entityManager.createQuery(hql, ShopBean.class).setParameter("email", email).getSingleResult();
		return shop;

	}

	@Override
	public void enabled(ShopBean shop) {
		entityManager.merge(shop);
	};
	
	public ShopBean findByVerificationCode(String code) {
		
		String hql = "FROM ShopBean WHERE code=:code";
		ShopBean shop = null;
		shop = entityManager.createQuery(hql, ShopBean.class).setParameter("code",code).getSingleResult();
		return shop;
	}

	@Override
	public ShopBean saveShopBean(ShopBean shopBean) {
		
		entityManager.persist(shopBean);

		return shopBean;
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
		
		String hql = "FROM ShopBean WHERE shopID=:shopID";
		ShopBean shopBean = null;
		shopBean= entityManager.createQuery(hql,ShopBean.class)
		                    .setParameter("shopID", shopID)
		                    .getSingleResult();	
//		return entityManager.find(ShopBean.class, shopID);
		return shopBean;
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


	@Override
	public List<ShopComment> findCommentsById(Integer shopID) {
		String hql = "FROM ShopComment WHERE shopID=:shopID";
		List<ShopComment> shopComment = null;
		shopComment= entityManager.createQuery(hql,ShopComment.class)
                .setParameter("shopID", shopID)
                .getResultList();	
		return shopComment;
	}


	@Override
	public ShopComment saveComments(ShopComment shopComment) {
		entityManager.persist(shopComment);
		return shopComment;
	}
	
}
