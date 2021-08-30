package tw.eeit131.first.repository;

import java.util.List;

import tw.eeit131.first.model.Product;

public interface ProductRepository {

	Product insert(Product product);
	
	void update(Product product);

	List<Product> getAllProduct();

	Product getProductById(Integer productID);

	List<Product> getProductListByTypeID(Integer productID);

	List<Product> getProductListByShopID(Integer shopID);

}
