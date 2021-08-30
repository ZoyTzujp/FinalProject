package tw.eeit131.first.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.eeit131.first.model.ShopBean;
import tw.eeit131.first.repository.ShopRepository;
import tw.eeit131.first.service.ShopService;

@Service
@Transactional
public class ShopServiceImpl implements ShopService {

	@Autowired
	ShopRepository shopRepository;

	@Override
	public ShopBean findByShopId(int id) {
		return shopRepository.findByShopId(id);
	}

	@Override
	public int saveShopBean(ShopBean shopBean) {
		int n = shopRepository.saveShopBean(shopBean);
		return n;
	}

	@Override
	public ShopBean checkLogin(String email, String password) {
		ShopBean checkResult = shopRepository.checkLogin(email, password);

		return checkResult;
	}

	@Override
	public ShopBean findById(Integer shopID) {
		return shopRepository.findById(shopID);

	}

	@Override
	public void update(ShopBean shopBean) {
		shopRepository.update(shopBean);

	}

	@Override
	public List<ShopBean> findAll() {
		return shopRepository.findAll();
	}

	@Override
	public Integer getLogout(HttpSession session) {
		return shopRepository.getLogout(session);
	}

}
