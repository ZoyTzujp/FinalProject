package tw.eeit131.first.service;

import java.util.List;

import tw.eeit131.first.model.ProductTypeList;

public interface ProductTypeListService {

	List<ProductTypeList> getAllProductTypeList();

	ProductTypeList findByProductTypeListID(int i);

}
