package tw.eeit131.first.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;

import tw.eeit131.first.model.OrderList;
import tw.eeit131.first.service.OrderService;
import tw.eeit131.first.service.PaypalService;

@Controller
public class PaypalController {
	
	@Autowired
	PaypalService paypalService;
	
	@Autowired
	OrderService orderService;
	
	public static final String SUCCESS_URL = "pay/success";//PaymentSuccess
	public static final String CANCEL_URL = "pay/cancel";//PaymentFailure
	
	

	
//	//方案1	
//	@PostMapping("/pay")
//	public String payment(@ModelAttribute("orderList") OrderList orderList) {
//		System.out.println(orderList);
//		try {
//			Payment payment = paypalService.createPayment(orderList.getPrice(), orderList.getCurrency(),
//														orderList.getMethod(), orderList.getIntent(),
//														orderList.getDescription(),
//														"http://localhost:6060/FinalProject/" + CANCEL_URL,//可能要改
//														"http://localhost:6060/FinalProject/" + SUCCESS_URL);
//			for(Links link:payment.getLinks()) {
//				if (link.getRel().equals("approval_url")) {
//					return "redirect:" + link.getHref();//跳轉至paypal頁面
//				}
//			}
//		} catch (PayPalRESTException e) {
//			e.printStackTrace();
//		}
//		return "redirect:/";//回首頁
//	}
	
	//方案2
	@PostMapping("/pay")
	public String payment(@RequestParam("orderListId") Integer orderListId
							,HttpSession session) {
		OrderList orderList = orderService.getOrderListByOrderListId(orderListId);
		System.err.println(orderList);
		
		try {
			Payment payment = paypalService.createPayment(orderList.getPrice(), orderList.getCurrency(),
														orderList.getMethod(), orderList.getIntent(),
														orderList.getDescription(),
														"http://localhost:6060/FinalProject/" + CANCEL_URL,
														"http://localhost:6060/FinalProject/" + SUCCESS_URL);
			for(Links link:payment.getLinks()) {
				if (link.getRel().equals("approval_url")) {
					System.err.println("1");
					System.err.println("orderListIdGoingToPay payment: "+ session.getAttribute("orderListIdGoingToPay"));
					session.setAttribute("orderListIdGoingToPay",orderListId);
					return "redirect:" + link.getHref();//跳轉至paypal頁面
				}
			}
		} catch (PayPalRESTException e) {
			e.printStackTrace();
		}
		return "redirect:/";//回首頁
	}
	
	@GetMapping(value = CANCEL_URL)
	public String cancelPay() {
		return "PaymentFailure";//原cancel
	}
	
//	//方案1
//	@GetMapping(value = SUCCESS_URL)
//	public String successPay(@RequestParam("paymentId") String paymentId,
//							@RequestParam("PayerID") String payerId//,@ModelAttribute("orderList") OrderList orderList
//							,HttpSession session){
//		try {
//			Payment payment = paypalService.executePayment(paymentId, payerId);
//			System.out.println(payment.toJSON());
//			if (payment.getState().equals("approved")) {
//				Integer orderListId = (Integer)session.getAttribute("orderListIdGoingToPay");
//				System.out.println(orderListId);
//				OrderList orderList = orderService.getOrderListByOrderListId(orderListId);
//				orderList.setOrderStatus("已付款");
//				orderService.updateOrderList(orderList);
////				double orderListId = orderList.getOrderID();
////				return "PaymentSuccess";
//				return "redirect:/OrderContent/" + orderListId;
//			}
//		} catch (PayPalRESTException e){
//			System.out.println(e.getMessage());
//		}
//		return "redirect:/";
//	}
	
	//方案2
	@GetMapping(value = SUCCESS_URL)
	public String successPay(@RequestParam("paymentId") String paymentId,
							@RequestParam("PayerID") String payerId
							,HttpSession session
							,Model m){
		try {
			Payment payment = paypalService.executePayment(paymentId, payerId);
			System.out.println(payment.toJSON());
			if (payment.getState().equals("approved")) {
				System.err.println("orderListIdGoingToPay success1: "+ session.getAttribute("orderListIdGoingToPay"));
				Integer orderListId = (Integer)session.getAttribute("orderListIdGoingToPay");
				System.err.println("orderListIdGoingToPay success2: "+ session.getAttribute("orderListIdGoingToPay"));
//				session.setAttribute("orderListIdGoingToPay", "");
				session.removeAttribute("orderListIdGoingToPay");
				System.err.println("orderListIdGoingToPay success3: "+ session.getAttribute("orderListIdGoingToPay"));
				System.out.println("orderListId=" + orderListId);
				OrderList orderList = orderService.getOrderListByOrderListId(orderListId);
				orderList.setOrderStatus("已付款");
				orderService.updateOrderList(orderList);
//				double orderListId = orderList.getOrderID();
//				return "PaymentSuccess";
				return "redirect:/OrderContent/" + orderListId;
			}
		} catch (PayPalRESTException e){
			System.out.println(e.getMessage());
		}
		return "redirect:/";
	}
}
