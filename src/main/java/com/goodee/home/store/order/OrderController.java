package com.goodee.home.store.order;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("orders")
public class OrderController {

	@GetMapping("checkout")
	public String getPage() throws Exception {
		return "store/order/order";
	}
}