package tw.eeit131.first.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import tw.eeit131.first.model.ShopBean;
import tw.eeit131.first.model.ShopComment;

public interface ShopService {

	ShopBean findByShopId(int id);
	
	ShopBean saveShopBean(ShopBean shopBean);

	ShopBean checkLogin(String email, String password);

	ShopBean findById(Integer shopID);

	void update(ShopBean shopBean);

	List<ShopBean> findAll();

	Integer getLogout(HttpSession session);
	
	void sendVerificationEmail(ShopBean shopBean, String siteURL) throws UnsupportedEncodingException, MessagingException;

	Boolean verify(String code);

	ShopBean findByEmail(String recipient);

	List<ShopComment> findCommentsById(Integer shopID);

	ShopComment saveComments(ShopComment shopComment);
	
}
