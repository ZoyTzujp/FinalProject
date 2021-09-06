package tw.eeit131.first.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;

//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.eeit131.first.model.Product;
import tw.eeit131.first.repository.ProductRepository;

@Repository
public class ProductRepositoryImpl implements ProductRepository {
	
	@Autowired
	EntityManager entityManager;
	
	@Override
	public Product insert(Product product) {
		entityManager.persist(product);//等於 Hibernate 的 Session.save(member)
		return product;
	}
	
	@Override
	public void update(Product product) {
		entityManager.merge(product);		
	}

	@Override
	public List<Product> getAllProduct() {		
		String hql = "FROM Product";
		return entityManager.createQuery(hql,Product.class).getResultList(); 		
	}

	@Override
	public Product getProductById(Integer productID) {
		String hql = "FROM Product WHERE PRODUCTID=:productID";
		Product product = null;
		product= entityManager.createQuery(hql,Product.class)
		                    .setParameter("productID", productID)
		                    .getSingleResult();	
        return product;
	}

	@Override
	public List<Product> getProductListByTypeID(Integer productTypeID) {
		String hql = "select p from ProductTypeList t left Join t.products p where t.productTypeID=:productTypeID";
		List<Product> product = entityManager.createQuery(hql,Product.class)
                                             .setParameter("productTypeID", productTypeID)
                                             .getResultList();		
		return product;
	}

	@Override
	public List<Product> getProductListByShopID(Integer shopID) {
		String hql = "FROM Product WHERE shopID=:shopID";
		List<Product> productList = null;
		productList= entityManager.createQuery(hql,Product.class)
                     .setParameter("shopID", shopID)
                     .getResultList();		
		return productList;
	}

}
