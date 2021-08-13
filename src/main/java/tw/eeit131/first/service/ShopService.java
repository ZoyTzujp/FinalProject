package tw.eeit131.first.service;

import java.util.List;

import tw.eeit131.first.model.ShopBean;

public interface ShopService {

	ShopBean findByShopId(int id);
	
	int saveShopBean(ShopBean shopBean);

	ShopBean checkLogin(String email, String password);

	ShopBean findById(Integer shopID);

	void update(ShopBean shopBean);

	List<ShopBean> findAll();

	Integer getLogout();

}
