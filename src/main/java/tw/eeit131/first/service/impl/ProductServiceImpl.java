package tw.eeit131.first.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.eeit131.first.model.Product;
import tw.eeit131.first.repository.ProductRepository;
import tw.eeit131.first.service.ProductService;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	 ProductRepository productRepository;

	@Override
	public Product insert(Product product) {
		return productRepository.insert(product);		
	}
	
	@Override
	public void update(Product product) {
		productRepository.update(product);		
	}

	@Override
	public List<Product> getAllProduct() {
		return productRepository.getAllProduct();
	}

	@Override
	public Product getProductById(Integer productID) {
		return productRepository.getProductById(productID);
	}

	@Override
	public List<Product> getProductListByTypeID(Integer productTypeID) {
		return productRepository.getProductListByTypeID(productTypeID);
	}

	@Override
	public List<Product> getProductListByShopID(Integer shopID) {
		return productRepository.getProductListByShopID(shopID);
	}





}
