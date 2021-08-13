package tw.eeit131.first.repository;

import java.util.List;

import tw.eeit131.first.model.Product;

public interface ProductRepository {

	Product insert(Product product);

	List<Product> getAllProduct();

	Product getProductById(Integer id);

	List<Product> productListSortByTypeID(Integer productTypeID);


}
