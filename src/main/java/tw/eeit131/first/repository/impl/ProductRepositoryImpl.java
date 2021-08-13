package tw.eeit131.first.repository.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;

//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.eeit131.first.model.Product;
import tw.eeit131.first.model.ProductType;
import tw.eeit131.first.repository.ProductRepository;

@Repository
public class ProductRepositoryImpl implements ProductRepository {
	
	@Autowired
	EntityManager entityManager;
	
	public Product insert(Product product) {
		entityManager.persist(product);//等於 Hibernate 的 Session.save(member)
		return product;
	}

	@Override
	public List<Product> getAllProduct() {		
		String hql = "FROM Product";
		return entityManager.createQuery(hql,Product.class).getResultList(); 		
	}

	@Override
	public Product getProductById(Integer id) {
		String hql = "FROM Product WHERE PRODUCTID=:id";
		Product product = null;
		product= entityManager.createQuery(hql,Product.class)
		                    .setParameter("id", id)
		                    .getSingleResult();	
        return product;
	}

	@Override
	public List<Product> productListSortByTypeID(Integer productTypeID) {
		String hqlType = "FROM ProductType WHERE PRODUCTTYPEID=:productTypeID";
		String hqlProduct = "FROM Product WHERE PRODUCTID=:productID";
		List<ProductType> productType = null;
		productType= entityManager.createQuery(hqlType,ProductType.class)
		                          .setParameter("productTypeID", productTypeID)
		                          .getResultList();
		System.out.println("productListSortByTypeID:"+productType);
		
		List<Product> productList = new ArrayList<>();
		for(int i=0; i < productType.size();i++) { 
			Integer productID  = productType.get(i).getProductID();
			System.out.println("item:"+i+"="+productID);
			Product product = entityManager.createQuery(hqlProduct,Product.class)
                                           .setParameter("productID", productID)
                                          .getSingleResult();
			System.out.println(product);
			productList.add(product);
			System.out.println(productList);
		}
		return productList;
	}

}
