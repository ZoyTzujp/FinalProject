package tw.eeit131.first.repository;

import java.util.List;

import tw.eeit131.first.model.ProductTypeList;

public interface ProductTypeListRepository {

	List<ProductTypeList> getAllProductTypeList();

	ProductTypeList getProductTypeListByTypeID(Integer productTypeID);

	List<ProductTypeList> getProductTypeListByShopID(Integer shopID);

	List<ProductTypeList> getProductTypeListByProductID(Integer productID);

}
