package com.goodee.home.villa;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/villa/*")
public class VillaController {
	@ModelAttribute("zigbang")
	public String getBuilding() {
		return "빌라";
	}
	
	@GetMapping("map")
	public ModelAndView getVillaRoadName() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/zigbang/map");
		return mv;
	}
}
