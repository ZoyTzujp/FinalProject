package tw.eeit131.first.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import tw.eeit131.first.model.OrderList;
import tw.eeit131.first.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	OrderService orderService;

	@GetMapping("/showOrderForm")
    public String showForm(Model m) {
		OrderList order = new OrderList();
    	m.addAttribute("orders", order);
    	return "orderSelect";
    }
			
	//查詢訂單By訂單編號
	@PostMapping("/orderQueryController")
	public String findByOrderID(@ModelAttribute("orders")OrderList orderList,
			                    Model m) {
		OrderList order = orderService.findByOrderId(orderList.getOrderID());
		m.addAttribute("orders",order);
		return "showOrders";
	}	
	

}
