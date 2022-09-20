package com.goodee.home.house;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.home.realEstate.RealEstateDTO;

@Controller
@RequestMapping("/house/*")
public class HouseController {

	@ModelAttribute("zigbang")
	public String getBuilding() {
		return "단독주택";
	}
	
	@GetMapping("map")
	public ModelAndView getHouseRoadName() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/zigbang/map");
		return mv;
	}
	
}
