package com.goodee.home.realEstate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/realestate/*")
public class RealEstateController {
	
	@Autowired
	private RealEstateService realEstateService;
	
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
	@GetMapping("add")
	public ModelAndView setAdd()throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/zigbang/addRealestate");
		
		return mv;
	}
	
	
	@PostMapping("add")
	public String setAdd(RealEstateDTO realEstateDTO)throws Exception{
		System.out.println(realEstateDTO.getBuildType());
		System.out.println(realEstateDTO.getSigungu());
		System.out.println(realEstateDTO.getRoadName());
		System.out.println(realEstateDTO.getBuildingNm());
		System.out.println(realEstateDTO.getDealType());
		System.out.println(realEstateDTO.getDeal());
		System.out.println(realEstateDTO.getDeposit());
		System.out.println(realEstateDTO.getWdeposit());
		System.out.println(realEstateDTO.getMonthly());
		System.out.println(realEstateDTO.getArea());
		System.out.println(realEstateDTO.getFloor());
		int result;
		
		if(realEstateDTO.getDealType().equals("매매")) {
			result = realEstateService.setAddMM(realEstateDTO);			
		}else if(realEstateDTO.getDealType().equals("전세")){
			result = realEstateService.setAddJS(realEstateDTO);			
		}else{
			result = realEstateService.setAddWS(realEstateDTO);			
		}
		
		return "redirect:/apt/map";
	}
	
	@PostMapping("getHaddress")
	@ResponseBody
	public List<RealEstateDTO> getHaddress(String search)throws Exception{
		System.out.println("getHaddress"+' '+search);
		List<RealEstateDTO> arr = realEstateService.getHaddress(search);
		return arr;
	}
}
