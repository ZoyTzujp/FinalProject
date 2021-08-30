package tw.eeit131.first.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.eeit131.first.model.ProductTypeList;
import tw.eeit131.first.repository.ProductTypeListRepository;
import tw.eeit131.first.service.ProductTypeListService;

@Service
@Transactional
public class ProductTypeListServiceImpl implements ProductTypeListService {
	
	@Autowired
	ProductTypeListRepository productTypeListRepository;

	@Override
	public List<ProductTypeList> getAllProductTypeList() {
		return productTypeListRepository.getAllProductTypeList();
	}

	@Override
	public ProductTypeList getProductTypeListByTypeID(Integer productTypeID) {
		return productTypeListRepository.getProductTypeListByTypeID(productTypeID);
	}

	@Override
	public List<ProductTypeList> getProductTypeListByShopID(Integer shopID) {
		return productTypeListRepository.getProductTypeListByShopID(shopID);
	}

	@Override
	public List<ProductTypeList> getProductTypeListByProductID(Integer productID) {
		return productTypeListRepository.getProductTypeListByProductID(productID);
	}

}
