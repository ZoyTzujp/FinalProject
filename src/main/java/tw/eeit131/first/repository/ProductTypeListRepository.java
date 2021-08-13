package tw.eeit131.first.repository;

import java.util.List;

import tw.eeit131.first.model.ProductTypeList;

public interface ProductTypeListRepository {

	List<ProductTypeList> getAllProductTypeList();

	ProductTypeList findByProductTypeListID(int i);

}
