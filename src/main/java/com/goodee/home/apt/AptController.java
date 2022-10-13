package com.goodee.home.apt;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.home.interested.InterestedDTO;
import com.goodee.home.interested.InterestedService;
import com.goodee.home.realEstate.RealEstateDTO;
import com.goodee.home.realEstate.RealEstateService;
import com.goodee.home.region.RegionDTO;
import com.goodee.home.region.RegionService;
import com.goodee.home.review.HouseReviewDTO;
import com.goodee.home.review.HouseReviewService;
import com.goodee.home.util.MaemulPager;


@Controller
@RequestMapping("/apt/**")
public class AptController {

	@Autowired
	private AptService aptService;
	@Autowired
	private RegionService regionService;
	@Autowired
	private HouseReviewService houseReviewService;
	@Autowired
	private InterestedService interestedService;
	@Autowired
	private RealEstateService realEstateService;
	
	
	@ModelAttribute("zigbang")
	public String getBuilding() {
		return "아파트";
	}
	
	@GetMapping("map")
	public ModelAndView getAptRoadName(ModelAndView mv, AptDTO aptDTO) throws Exception{
		//String path = servletContext.getRealPath("resources/upload/realestate");
		//System.out.println(path);
		//List<RealEstateDTO> arr = aptService.getAptRoadName(aptDTO);
	
		//mv.addObject("list",arr);
		mv.setViewName("/zigbang/map");
		return mv;
	}
	
	@PostMapping("setAddReal")
	@ResponseBody
	public int setAdd(RealEstateDTO realEstateDTO)throws Exception{
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
		
		return result;
	}
	
	@PostMapping("getHaddress")
	@ResponseBody
	public List<RealEstateDTO> getHaddress(String search)throws Exception{
		System.out.println("getHaddress"+' '+search);
		List<RealEstateDTO> arr = realEstateService.getHaddress(search);
		return arr;
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
		System.out.println("getaptroadname"+aptDTO.getSigungu());
		
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
			arr = regionService.getEmd(sigunguDTO);
		}else if(sigunguDTO.getMapLevel()>=7 && sigunguDTO.getMapLevel()<11) {
			arr = regionService.getSigungu(sigunguDTO);
		}else {
			arr = regionService.getSido(sigunguDTO);
		}
		
		return arr;
	}
	
	@GetMapping("getList")
	@ResponseBody
	public Map<String, Object> getList(MaemulPager maemulPager) throws Exception{
		System.out.println("getList"+maemulPager.getRoadName() + "page: "+maemulPager.getPage() + "totalpage: "+maemulPager.getTotalPage());
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
		System.out.println("getHouseReview" + maemulPager.getRoadName() + "page"+maemulPager.getPage() + " totalpage: "+maemulPager.getTotalPage());
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
