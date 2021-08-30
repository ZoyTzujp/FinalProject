package tw.eeit131.first.repository;

import java.util.List;

import javax.servlet.http.HttpSession;

import tw.eeit131.first.model.ShopBean;

public interface ShopRepository {

	ShopBean findByShopId(int id);
	

	ShopBean findById(Integer shopID);
	
	int saveShopBean(ShopBean shopBean);


	ShopBean checkLogin(String email, String password);

	void update(ShopBean shopBean);

	List<ShopBean> findAll();

	Integer getLogout(HttpSession session);

}
