package tw.eeit131.first.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.eeit131.first.model.Artical;
import tw.eeit131.first.model.Customer;
import tw.eeit131.first.model.ShopBean;
import tw.eeit131.first.service.ArticalService;
@Controller
public class ArticalController {
	
	@Autowired
	ArticalService service;
	
	@Autowired
	HttpSession session;
	
	Logger log = LoggerFactory.getLogger(ArticalController.class);
	
	//所有文章
	@GetMapping("/allartical")
	public String findAllArticals(Model model) {
		List<Artical> artical = service.findAllArticals();
		model.addAttribute("allArtical",artical);
//		System.out.println(artical);
//		String test = "aabbcc" ;
//		model.addAttribute("test",test);
		return "ArticalIndex";
	}
	
	
	
	
	
	@GetMapping("/artical/{id}")
	public String showAritcalSelectById(
			@PathVariable Integer id,
			Model m) {
		Artical artical = service.selectById(id);
		m.addAttribute("artical",artical);
		return "ArticalById";		
	}
	
	@GetMapping("/artical/editform/{id}")
	public String editFormAritcalSelectById(
			@PathVariable Integer id,
			Model m) {
		Artical artical = service.selectById(id);
		m.addAttribute("artical",artical);
		return "ArticalEditForm";		
	}
	
	
	@GetMapping("/artical/edit/{id}")
	public String editAritcal(
			@RequestParam("subject") String subject,
			@RequestParam("content") String content,
			@PathVariable Integer id,
			Artical artical) {
		
		
		System.out.println("id======"+id);
		System.out.println("id======"+id);
		System.err.println("subject======="+subject);
		System.err.println("content======="+content);
		artical.setArticalID(id);
		artical.setSubject(subject);
		artical.setContent(content);
		artical.setMemberID(2); //假會員，到時候再連結會員資料表
		artical.setPicture(null);
		Artical edit = service.updateArtical(artical);

		//		Artical editArtical = service.updateArtical(artical);
		System.out.println(edit);
		System.out.println("~~~~~~Artical in controller"+artical);
		System.out.println("~~~~~~Artical in controller"+artical.getArticalID());
		System.out.println(id+"~~~~~~~id");
		
		return "ArticalIndex";		//之後改成return 成功修改頁面
	}
	
	
	
	@GetMapping("/artical/delete/{id}")
	public String deleteAritcal(			
			@PathVariable Integer id,
			Artical artical) {
		System.out.println("id============"+id);
		service.deleteArtical(id);
			
		
		return "ArticalIndex";		//之後改成return 成功修改頁面
	}
	
	
	//新增文章
	@PostMapping("/save")
	public String save(
			@RequestParam("subject") String subject,
			@RequestParam("content") String content,
			//@RequestParam("puctire") Byte[] picture,
			Model model,
			Artical artical){
		
		Customer member = (Customer)session.getAttribute("Customer");
		Long m = member.getId();
		if (m != null) {
		Integer i = m == null ? null : Math.toIntExact(m);
		artical.setMemberID(i);  //假會員，到時候再連結會員資料表
		}
		artical.setSubject(subject);
		artical.setContent(content);
		artical.setPicture(null);
		System.out.println(artical);
		
		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:s");
//		long syscurTime = System.currentTimeMillis();
//		System.out.println("syscurTime======"+sdf.format(syscurTime));
//		Date curDateTime = Date.valueOf(sdf.format(syscurTime));
//		System.out.println("curDateTime========"+curDateTime);
//		Timestamp commentTime = Timestamp.valueOf(sdf.format(syscurTime));
//		System.out.println("commentTime======"+commentTime);
//		Timestamp commentTime= new Timestamp(System.currentTimeMillis());
		
		long currentTime = System.currentTimeMillis();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:s");
		String commentTime = sdf.format(currentTime);
		artical.setCommentTime(commentTime);
		Map<String, String> map = new HashMap<>();
		String result = "";
		try {
			service.save(artical);
			result = "Create Successfully";
			map.put("success", result);
		}catch(Exception e){
			result = e.getMessage();
			map.put("fail", result);
		}
		
		List<Artical> allArtical = service.findAllArticals();	
		model.addAttribute("allArtical",allArtical);		
		return "ArticalCreate";
		
	}
	
	



	@GetMapping("/ajax/listAllArtical")
	public @ResponseBody List<Artical> listAllArtical() {
		return service.findAllArticals();
	}
	
	
	@GetMapping("/create")
	public  String create() {
		
		
		ShopBean shop = (ShopBean)session.getAttribute("LoginOK");
		Customer member = (Customer)session.getAttribute("Customer");
		System.err.println("shop========="+shop);
		System.err.println("member========="+member);
		System.err.println("member========="+member.getId());
		Long m = member.getId();
		System.err.println(m);
		
		return "ArticalCreate";
	}
	
	
	@ModelAttribute("artical")
	public Artical getArtical() {
		Artical artical = new Artical();
		return artical;
	}
	
	
	
}





