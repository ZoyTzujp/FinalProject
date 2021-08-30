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
				
//		String hqlProduct = "FROM Product WHERE shopID=:shopID";   //By shopID 搜尋productList (table=Product)
//		List<Product> productList = null;		
//		productList= entityManager.createQuery(hqlProduct,Product.class)
//                                  .setParameter("shopID", shopID)
//                                  .getResultList();
//		System.out.println("--------------->"+productList);	
//		
//		String hqlType = "FROM UnProductType WHERE PRODUCTID=:productID";  //By productList.prodcutID 搜尋productType (table=UnProductType)
//		List<UnProductType> productType = null;		
//		for(Product pd:productList){
//			Integer productID = pd.getProductID();
//			UnProductType pdt =entityManager.createQuery(hqlType,UnProductType.class)
//                                                .setParameter("productID",productID)
//                                                .getSingleResult();
//			System.out.println("--------------->"+pdt);
//			productType.add(pdt);
//		}
//				
//		String hqlTypeList = "FROM ProductTypeList WHERE PRODUCTTYPEID=:productTypeID";  //By UnProductType.ProductTypeID 搜尋productTypeList 不重複(table=ProductTypeList)
//		List<ProductTypeList> productTypeList0 = null;
//		   for(UnProductType pdt:productType){
//			   ProductTypeList pdtl = entityManager.createQuery(hqlTypeList,ProductTypeList.class)
//                                                   .setParameter("productID", pdt.getProductTypeID())
//                                                   .getSingleResult();
//			   productTypeList0.add(pdtl);
//		   }
//		   
//	    Set<ProductTypeList> productTypeList1= null;
//		List<ProductTypeList> productTypeList = null;
//		   for(ProductTypeList pdtl:productTypeList0){
//			   if(productTypeList1.add(pdtl)) {
//				   productTypeList.add(pdtl);
//			   }
//		   }

	}

	@Override
	public List<ProductTypeList> getProductTypeListByProductID(Integer productID) {
		String hql = "select t from Product p left Join p.productTypeList t where p.productID=:productID";
		List<ProductTypeList> productTypeList = entityManager.createQuery(hql,ProductTypeList.class)
                                                             .setParameter("productID", productID)
                                                             .getResultList();		
		return productTypeList;
	}

}
