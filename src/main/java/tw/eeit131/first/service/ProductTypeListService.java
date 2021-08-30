package tw.eeit131.first.service;

import java.util.List;

import tw.eeit131.first.model.ProductTypeList;

public interface ProductTypeListService {

	List<ProductTypeList> getAllProductTypeList();

	ProductTypeList getProductTypeListByTypeID(Integer productTypeID);

	List<ProductTypeList> getProductTypeListByShopID(Integer shopID);

	List<ProductTypeList> getProductTypeListByProductID(Integer productID);

}
