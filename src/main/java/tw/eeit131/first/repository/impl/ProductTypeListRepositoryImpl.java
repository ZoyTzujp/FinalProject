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
	public ProductTypeList findByProductTypeListID(int i) {
		String hql = "FROM ProductTypeList WHERE PRODUCTTYPEID=:id";
		ProductTypeList productTypeList = null;
		productTypeList= entityManager.createQuery(hql,ProductTypeList.class)
		                    .setParameter("id", i)
		                    .getSingleResult();	
        return productTypeList;
	}

}
