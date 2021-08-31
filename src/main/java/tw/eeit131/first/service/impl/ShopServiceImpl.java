package tw.eeit131.first.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.bytebuddy.utility.RandomString;
import tw.eeit131.first.model.ShopBean;
import tw.eeit131.first.model.ShopComment;
import tw.eeit131.first.repository.ShopRepository;
import tw.eeit131.first.service.ShopService;

@Service
@Transactional
public class ShopServiceImpl implements ShopService {

	@Autowired
	ShopRepository shopRepository;
	
	@Autowired
	private JavaMailSender mailSender;

	@Override
	public ShopBean findByShopId(int id) {
		return shopRepository.findByShopId(id);
	}

	@Override
	public ShopBean saveShopBean(ShopBean shopBean) {
		shopBean.setEnabled(false);
		
		String randomCode = RandomString.make(64);
		shopBean.setCode(randomCode);
		
		return shopRepository.saveShopBean(shopBean);
		
	}

	public void sendVerificationEmail(ShopBean shopBean, String siteURL) 
			throws UnsupportedEncodingException, MessagingException {
		String subject= "註冊成功通知，請確認!!";
		String senderName = "shopme team";
		String mailContent ="<p>Dear"+shopBean.getShopName()+",<p>";
		mailContent += "<p>請點選下面連結，確認以此信箱註冊並開通:</P>";
		
		String verifyURL ="http://localhost:6060"+siteURL +"/verify?code="+shopBean.getCode();
		System.out.println(shopBean.getCode());
		mailContent +="<h3><a href=\""+verifyURL+"\">http://localhost:6060/FinalProject/verify</a></h3>";
		
		mailContent +="<p>Thank you<br>The Shopme Team</p>";
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
	
		helper.setFrom("a0926611416@gmail.com",senderName);
		helper.setTo(shopBean.getEmail());
		helper.setSubject(subject);
		
		helper.setText(mailContent,true);
	
		mailSender.send(message);
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

	public Boolean verify(String code) {
		ShopBean shopBean = shopRepository.findByVerificationCode(code);
		
		if(shopBean ==null || shopBean.isEnabled()) {
			return false;
		}else {
			shopBean.setEnabled(true);
			shopRepository.enabled(shopBean);
//			shopRepository.enabled(shopBean.getShopID());
			return true;
		}
	}

	@Override
	public ShopBean findByEmail(String email) {
		return shopRepository.findByShopEmail(email);
	}

	
	//評論專用
	@Override
	public List<ShopComment> findCommentsById(Integer shopID) {
		return shopRepository.findCommentsById(shopID);
	}
	//評論專用
	@Override
	public ShopComment saveComments(ShopComment shopComment) {
		return shopRepository.saveComments(shopComment);
	}
	
	

}

