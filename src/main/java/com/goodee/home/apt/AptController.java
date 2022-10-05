package com.goodee.home.apt;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.home.realEstate.RealEstateDTO;
import com.goodee.home.region.RegionDTO;
import com.goodee.home.region.RegionService;
import com.goodee.home.review.HouseReviewDTO;
import com.goodee.home.review.HouseReviewService;
import com.goodee.home.util.MaemulPager;


@Controller
@RequestMapping("/apt/*")
public class AptController {

	@Autowired
	private AptService aptService;
	@Autowired
	private RegionService sigunguService;
	@Autowired
	private HouseReviewService houseReviewService;
	
	@ModelAttribute("zigbang")
	public String getBuilding() {
		return "아파트";
	}
	
	@GetMapping("map")
	public ModelAndView getAptRoadName(ModelAndView mv, AptDTO aptDTO) throws Exception{
		
		//List<RealEstateDTO> arr = aptService.getAptRoadName(aptDTO);
	
		//mv.addObject("list",arr);
		mv.setViewName("/zigbang/map");
		return mv;
	}
	
	@PostMapping("getSearchList")
	@ResponseBody
	public Map<String, Object> getSearchList(String search)throws Exception{
		System.out.println(search);
		List<AptDTO> address = aptService.getSearchAddressList(search);
		List<AptDTO> apt = aptService.getSearchAptList(search);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("address",address);
		map.put("apt",apt);
		
		return map;
	}
	
	@PostMapping("getAptRoadName")
	@ResponseBody
	public List<RealEstateDTO> getAptRoadName(AptDTO aptDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println(aptDTO.getSigungu());
		
		List<RealEstateDTO> arr = aptService.getAptRoadName(aptDTO);
		
		return arr;
	}
	
	
	@PostMapping("getRegion")
	@ResponseBody
	public List<RegionDTO> getRegion(RegionDTO sigunguDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
//		System.out.println("swLat:" +sigunguDTO.getSwLat());
//		System.out.println("swLon:" +sigunguDTO.getSwLon());
//		System.out.println("neLat:" +sigunguDTO.getNeLat());
//		System.out.println("neLon:" +sigunguDTO.getNeLon());
//		System.out.println("mapLevel:" +sigunguDTO.getMapLevel());
		List<RegionDTO> arr = new ArrayList<RegionDTO>();
		if(sigunguDTO.getMapLevel()<5) {
			
		}else if(sigunguDTO.getMapLevel()>=5 && sigunguDTO.getMapLevel()<7) {
			arr = sigunguService.getEmd(sigunguDTO);
		}else if(sigunguDTO.getMapLevel()>=7 && sigunguDTO.getMapLevel()<11) {
			arr = sigunguService.getSigungu(sigunguDTO);
		}else {
			arr = sigunguService.getSido(sigunguDTO);
		}
		
		return arr;
	}
	
	@GetMapping("getList")
	@ResponseBody
	public Map<String, Object> getList(MaemulPager maemulPager) throws Exception{
		System.out.println("getList"+maemulPager.getRoadName());
		ModelAndView mv = new ModelAndView();
		
		List<AptDTO> list = aptService.getList(maemulPager);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("maemulPager", maemulPager);
		
//		mv.addObject("list_pager",map);
//		mv.setViewName("common/realEstateList");
//		return mv;
		return map;
	}
	
	@GetMapping("getHouseReview")
	@ResponseBody
	public Map<String, Object>  getHouseReview(MaemulPager maemulPager)throws Exception{
		System.out.println("getHouseReview" + maemulPager.getRoadName() + "page"+maemulPager.getPage());
		ModelAndView mv = new ModelAndView();
		
		List<HouseReviewDTO> list = houseReviewService.getHouseReview(maemulPager);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("maemulPager", maemulPager);
		
		return map;
	}
	
	@PostMapping("addReview")
	@ResponseBody
	public int setAddHouseReview(HouseReviewDTO houseReviewDTO)throws Exception{
		int result = houseReviewService.setAddHouseReview(houseReviewDTO);
		
		return result;
	}
	
}
