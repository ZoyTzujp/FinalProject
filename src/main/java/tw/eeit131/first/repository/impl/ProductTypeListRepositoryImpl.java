package tw.eeit131.first.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import tw.eeit131.first.model.ProductTypeList;
import tw.eeit131.first.repository.ProductTypeListRepository;

@Repository
public class ProductTypeListRepositoryImpl implements ProductTypeListRepository {
	
	@Autowired
	EntityManager entityManager;

	@Override
	public List<ProductTypeList> getAllProductTypeList() {
		String hql = "FROM ProductTypeList";
		return entityManager.createQuery(hql,ProductTypeList.class).getResultList();        
	}

	@Override
	public ProductTypeList getProductTypeListByTypeID(Integer productTypeID) {
		String hql = "FROM ProductTypeList WHERE PRODUCTTYPEID=:productTypeID";
		ProductTypeList productTypeList = null;
		productTypeList= entityManager.createQuery(hql,ProductTypeList.class)
		                              .setParameter("productTypeID", productTypeID)
		                              .getSingleResult();	
        return productTypeList;
	}

	@Override  //By ShopID 搜尋該商店有的 ProductType,未完成
	public List<ProductTypeList> getProductTypeListByShopID(Integer shopID) {
//		             "select t from Product p left Join p.productTypeList t where p.productID=:productID"
//		String hql = "select t from ShopBean s left Join s. " ;
		   List<ProductTypeList> productType= null;
		   return productType;				

	} 
	@Override
	public List<ProductTypeList> getProductTypeListByProductID(Integer productID) {
		String hql = "select t from Product p left Join p.productTypeList t where p.productID=:productID";
		List<ProductTypeList> productTypeList = entityManager.createQuery(hql,ProductTypeList.class)
                                                             .setParameter("productID", productID)
                                                             .getResultList();		
		return productTypeList;
	}

	@Override
	public void addNewProductType(ProductTypeList productTypeList) {
		entityManager.persist(productTypeList);		
	}

}
