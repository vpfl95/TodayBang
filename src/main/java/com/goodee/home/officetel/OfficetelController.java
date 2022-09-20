package com.goodee.home.officetel;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/officetel/*")
public class OfficetelController {
	
	
	@ModelAttribute("zigbang")
	public String getBuilding() {
		return "오피스텔";
	}
	
	@GetMapping("map")
	public ModelAndView getOfficetelRoadName() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/zigbang/map");
		return mv;
	}
}
