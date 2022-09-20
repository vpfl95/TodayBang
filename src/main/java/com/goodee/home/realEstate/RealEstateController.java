package com.goodee.home.realEstate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/house/*")
public class RealEstateController {
	
//	@Autowired
//	private RealEstateService realEstateService;
//	
//	@GetMapping("map")
//	public ModelAndView getHouseList() throws Exception{
//		ModelAndView mv = new ModelAndView();
//		
//		List<RealEstateDTO> arr = realEstateService.getAptRoadName();
//		for(RealEstateDTO realEstateDTO:arr) {
//			System.out.println(realEstateDTO.getNum());
//		}
//		
//		mv.addObject("list",arr);
//		mv.setViewName("/house/map");
//		return mv;
//	}
}
