package com.goodee.home.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StoreController {
	
	@GetMapping("/store")
	public String store() throws Exception {
		
		return "store/storeHome";
	}
}