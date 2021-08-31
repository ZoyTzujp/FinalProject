package tw.eeit131.first.repository;

import java.util.List;

import javax.servlet.http.HttpSession;

import tw.eeit131.first.model.ShopBean;
import tw.eeit131.first.model.ShopComment;

public interface ShopRepository {

	ShopBean findByShopId(int id);
	

	ShopBean findById(Integer shopID);
	
	ShopBean saveShopBean(ShopBean shopBean);


	ShopBean checkLogin(String email, String password);

	void update(ShopBean shopBean);

	List<ShopBean> findAll();

	Integer getLogout(HttpSession session);


	ShopBean findByShopEmail(String email);


	void enabled(ShopBean shopBean);
	
	ShopBean findByVerificationCode(String code);


	List<ShopComment> findCommentsById(Integer shopID);


	ShopComment saveComments(ShopComment shopComment);
}
