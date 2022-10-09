package com.goodee.home.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StoreController {
	
	@GetMapping("/store")
	public String store() throws Exception {
		
		return "store/storeHome";
	}
	
	@GetMapping("/todayDeals")
	public String todayDeals() throws Exception {
		
		return "store/todayDeal";
	}
	
	@GetMapping("/error")
	@ResponseBody
	public ModelAndView notFound(ModelAndView mv) throws Exception {
		mv.setViewName("store/notFound");
		return mv;
	}
}