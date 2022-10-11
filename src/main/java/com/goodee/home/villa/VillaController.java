package com.goodee.home.villa;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.home.apt.AptDTO;
import com.goodee.home.interested.InterestedDTO;
import com.goodee.home.interested.InterestedService;
import com.goodee.home.realEstate.RealEstateDTO;
import com.goodee.home.region.RegionDTO;
import com.goodee.home.region.RegionService;
import com.goodee.home.review.HouseReviewDTO;
import com.goodee.home.review.HouseReviewService;
import com.goodee.home.util.MaemulPager;

@Controller
@RequestMapping("/villa/**")
public class VillaController {
	
	@Autowired
	private RegionService regionService;
	@Autowired
	private VillaService villaService;
	@Autowired
	private HouseReviewService houseReviewService;
	@Autowired
	private InterestedService interestedService;
	
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
	
	@PostMapping("getSearchList")
	@ResponseBody
	public Map<String, Object> getSearchList(String search)throws Exception{
		System.out.println(search);
		List<VillaDTO> address = villaService.getSearchAddressList(search);
		List<VillaDTO> apt = villaService.getSearchVillaList(search);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("address",address);
		map.put("apt",apt);
		
		return map;
	}
	
	@PostMapping("getRegion")
	@ResponseBody
	public List<RegionDTO> getRegion(RegionDTO sigunguDTO) throws Exception{
		ModelAndView mv = new ModelAndView();

		List<RegionDTO> arr = new ArrayList<RegionDTO>();
		if(sigunguDTO.getMapLevel()<5) {
			
		}else if(sigunguDTO.getMapLevel()>=5 && sigunguDTO.getMapLevel()<7) {
			arr = regionService.getEmd(sigunguDTO);
		}else if(sigunguDTO.getMapLevel()>=7 && sigunguDTO.getMapLevel()<11) {
			arr = regionService.getSigungu(sigunguDTO);
		}else {
			arr = regionService.getSido(sigunguDTO);
		}
		
		return arr;
	}
	
	@PostMapping("getAptRoadName")
	@ResponseBody
	public List<RealEstateDTO> getVillaRoadName(VillaDTO villaDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<RealEstateDTO> arr = villaService.getVillaRoadName(villaDTO);
		
		return arr;
	}
	
	@GetMapping("getList")
	@ResponseBody
	public Map<String, Object> getList(MaemulPager maemulPager) throws Exception{
		System.out.println("getList"+maemulPager.getRoadName());
		ModelAndView mv = new ModelAndView();
		
		List<VillaDTO> list = villaService.getList(maemulPager);
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
	
	@PostMapping("updateReview")
	@ResponseBody
	public int setUpdateReview(HouseReviewDTO houseReviewDTO)throws Exception{
		System.out.println("update Review");
		int result = houseReviewService.setUpdateReview(houseReviewDTO);
		
		return result;
	}
	

	@PostMapping("deleteReview")
	@ResponseBody
	public int setDeleteReview(HouseReviewDTO houseReviewDTO)throws Exception{
		int result = houseReviewService.setDeleteReview(houseReviewDTO);
		
		return result;
	}
	
	@PostMapping("writerCheck")
	@ResponseBody
	public ModelAndView writerCheck(HouseReviewDTO houseReviewDTO)throws Exception{
		System.out.println("컨트롤러"+houseReviewDTO.getUserId());
		ModelAndView mv = new ModelAndView();
		mv.addObject("houseReviewDTO",houseReviewDTO);
		return mv;
	}
	
	@PostMapping("setInterested")
	@ResponseBody
	public int setInterested(InterestedDTO interestedDTO)throws Exception{
		int result = interestedService.setInterested(interestedDTO);
		return result;
	}
	
	@PostMapping("getInterestedUser")
	@ResponseBody
	public List<InterestedDTO> getInterestedUser(InterestedDTO interestedDTO)throws Exception{
		List<InterestedDTO> arr = interestedService.getInterestedUser(interestedDTO);
		
		return arr;
	}
	
	@PostMapping("setDeleteInterested")
	@ResponseBody
	public int setDeleteInterested(InterestedDTO interestedDTO)throws Exception{
		int result = interestedService.setDeleteInterested(interestedDTO);
		return result;
	}
}
