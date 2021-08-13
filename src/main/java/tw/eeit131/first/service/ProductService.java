package tw.eeit131.first.service;

import java.util.List;

import org.springframework.stereotype.Service;

import tw.eeit131.first.model.Product;

@Service
public interface ProductService {

	Product insert(Product product);

	List<Product> getAllProduct();

	Product getProductById(Integer id);

	List<Product> productListSortByTypeID(Integer productTypeID);


}
