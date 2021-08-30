package tw.eeit131.first.controller;

import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.view.RedirectView;

import tw.eeit131.first.exception.PwdNotMatchedException;
import tw.eeit131.first.exception.TwoPwdNotMatchedException;
import tw.eeit131.first.exception.UserAlreadySignedUpException;

import tw.eeit131.first.model.Customer;
import tw.eeit131.first.model.ShopBean;
import tw.eeit131.first.model.SignUpRequestDTO;
import tw.eeit131.first.service.CustomerService;


@Controller
public class CustomerController {
	
	@Autowired
	CustomerService customerService;

	
	@GetMapping("/customerLoginPage")
	public String customerLoginPage() { 
		return "CustomerLogin";
	}
	
	
	@PostMapping("/customerLogin")
	public String customerLogin(@RequestParam("Email") String email, @RequestParam("Password") String password,	Model model, HttpSession session) {
		
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);

		if (email == null || email.length() == 0) {
			errors.put("userName", "帳號欄必須輸入");
		}

		if (password == null || password.length() == 0) {
			errors.put("userPwd", "Password is required");
		}
		
		if(errors!=null && !errors.isEmpty()) {
			return "CustomerLogin";
		}
		
		Customer customer = customerService.checkLogin(email,password);
		
		if(customer != null) {
			
		session.setAttribute("Customer", customer);
		
		} else {
			errors.put("LoginError", "該帳號不存在或密碼錯誤");
			}
		
		if(errors.isEmpty()) {
			return "Home";
		}
		
		model.addAttribute("customerEmail", email);
		model.addAttribute("customerPassword", password);

		errors.put("msg", "please input correct username and password");
		
		return "CustomerLogin";

	}
	
	
	@GetMapping("/customerLogout")
    public String customerLogout(HttpServletRequest request) {

		HttpSession session = request.getSession(false);  
	    session.invalidate();  
		
		return "Home";
	}
	
	
	@GetMapping("/customer/profile")
	public String customerProfile_Page(HttpServletRequest request, Model m) {
		
		HttpSession session = request.getSession(false);  
		Customer customerFromSession = (Customer) session.getAttribute("Customer");
		Customer customerFromDB = customerService.findByIdReturnCustomer(customerFromSession.getId());
		
	    m.addAttribute("customerToBind", customerFromDB);
	      
        return "CustomerProfile";
	}
	
	
	@GetMapping("/customer/profile/edit")
	public String customerProfileEdit_Page(HttpServletRequest request, Model m) {
		
		HttpSession session = request.getSession(false);  
		Customer customerFromSession = (Customer) session.getAttribute("Customer");
		Customer customerFromDB = customerService.findByIdReturnCustomer(customerFromSession.getId());
		
	    m.addAttribute("customerToBind", customerFromDB);
	      
        return "CustomerProfile_Edit";
	}
	
	
	@PostMapping("/customer/profile/edit/send")
	public String customerProfileEditSend(@ModelAttribute("customerToBind") Customer customer, Model m, HttpSession session) {
		
		if(customerService.updateCustomer(customer.getName(), customer.getGender(), customer.getBirthday(), customer.getCellphone(), customer.getAddress(), customer.getEmail()) != 0) {
			
		Map<String, String> successMessage = new HashMap<String, String>();
		m.addAttribute("successMessage", successMessage);
    	successMessage.put("message", "會員資料更新成功。");
    	
    	
		Customer customerFromDB = customerService.findByIdReturnCustomer(customer.getId());

		session.removeAttribute("Customer");
		session.setAttribute("Customer", customerFromDB);
		
		
        return "CustomerProfile";
			
		}
		
		Map<String, String> errorMessage = new HashMap<String, String>();	
		m.addAttribute("errorMessage", errorMessage);
		errorMessage.put("message", "更新失敗。");
		
		return "CustomerProfile";
		
	}
	
	
	@GetMapping("/customer/profile/changePassword")
	public String changePassword_Page() {
			
		return "CustomerPassword_Edit";
		
	}
	
	
	@PostMapping("/customer/profile/changePassword/send")
	public String changePasswordSend(Model m, HttpSession session, @RequestParam(name = "oldPwdEnteredByUser") String oldPwdEnteredByUser, @RequestParam(name = "newPassword") String newPassword, @RequestParam(name = "newPwdToBeConfirmed") String newPwdToBeConfirmed) {
		
		Customer customerFromSession = (Customer) session.getAttribute("Customer");
		Customer customerFromDB = customerService.findByIdReturnCustomer(customerFromSession.getId());
		
		try {
			customerService.checkPassword(oldPwdEnteredByUser, customerFromDB.getPassword(), newPassword, newPwdToBeConfirmed, customerFromDB);
			
			Map<String, String> successMessage = new HashMap<String, String>();
			m.addAttribute("successMessage", successMessage);
			successMessage.put("message", "密碼修改成功");
			
			return "CustomerProfile_Edit";
			
		} catch (TwoPwdNotMatchedException e) {
			Map<String, String> errorMessage = new HashMap<String, String>();
			m.addAttribute("errorMessage", errorMessage);
			errorMessage.put("message", "新密碼與確認新密碼兩欄位輸入值不相符");
			
			return "CustomerProfile_Edit";

		} catch (PwdNotMatchedException e) {
			Map<String, String> errorMessage2 = new HashMap<String, String>();
			m.addAttribute("errorMessage2", errorMessage2);
			errorMessage2.put("message", "舊密碼錯誤");
			
			return "CustomerProfile_Edit";
		}
		
	}
	
	
	@GetMapping("/customer/profile/delete")
	public String deleteUser(HttpServletRequest request, Model m) {
		
		HttpSession session = request.getSession(false);
		Customer customer = (Customer) session.getAttribute("Customer");

		customerService.deleteById(customer.getId());
		
	    session.invalidate();  
		

	    Map<String, String> successMessage = new HashMap<String, String>();
		m.addAttribute("successMessage", successMessage);
    	successMessage.put("message", "會員資料已刪除，歡迎您隨時再度光臨。");
	    
	    
	    return "CustomerDeleteSuccess";
		
	}
	
	
	@GetMapping(path = "/customer/signUpPage") 						
    public String customerSignUp_Page(Model m) {
		
		SignUpRequestDTO signUpRequest = new SignUpRequestDTO();
    	m.addAttribute("signUpRequest", signUpRequest);		
    	
        return "CustomerSignUp";
    }
	
	
	@PostMapping(path = "/customer/signUpPage/send")
    public String signUp(@ModelAttribute("signUpRequest") SignUpRequestDTO signUpRequest, Model m) {
        
    	try {
    		customerService.signUp(signUpRequest);
			
			Map<String, String> successMessage = new HashMap<String, String>();
	    	m.addAttribute("successMessage", successMessage);
	    	successMessage.put("message", "會員註冊成功");
	    	
	        return "CustomerSignUpTurnToPage";
	        
		} catch (UserAlreadySignedUpException e) {
			Map<String, String> errorMessage = new HashMap<String, String>();	
			m.addAttribute("errorMessage2", errorMessage);
			errorMessage.put("message", "會員已存在。");
			
			return "CustomerSignUpTurnToPage";
			
			}
     }
	

    @InitBinder
    public void initBinder(WebDataBinder binder, WebRequest request) {
        DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
	
	
	
	
	
	
	
	
	
	
	
	
	
}
