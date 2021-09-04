package tw.eeit131.first.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;

import tw.eeit131.first.model.OrderList;
import tw.eeit131.first.service.PaypalService;

@Controller
public class PaypalController {
	
	@Autowired
	PaypalService paypalService;
	
	public static final String SUCCESS_URL = "pay/success";
	public static final String CANCEL_URL = "pay/cancel";
	
	

	
	@PostMapping("/pay")
	public String payment(@ModelAttribute("orderList") OrderList orderList) {
		try {
			Payment payment = paypalService.createPayment(orderList.getPrice(), orderList.getCurrency(),
														orderList.getMethod(), orderList.getIntent(),
														orderList.getDescription(),
														"http://localhost:6060/" + CANCEL_URL,//可能要改
														"http://localhost:6060/" + SUCCESS_URL);
			for(Links link:payment.getLinks()) {
				if (link.getRel().equals("approval_url")) {
					return "redirect:" + link.getHref();
				}
			}
		} catch (PayPalRESTException e) {
			e.printStackTrace();
		}
		return "redirect:/";//可能要改
	}
	
	@GetMapping(CANCEL_URL)
	public String cancelPay() {
		return "cancel";
	}
	
	@GetMapping(SUCCESS_URL)
	public String successPay(@RequestParam("paymentId") String paymentId,
							@RequestParam("payerID") String payerId){//ID大小寫不一致?
		try {
			Payment payment = paypalService.executePayment(paymentId, payerId);
			System.out.println(payment.toJSON());
			if (payment.getState().equals("approved")) {
				return "success";
			}
		} catch (PayPalRESTException e){
			System.out.println(e.getMessage());
		}
		return "redirect:/";
	}
}
