package com.goodee.home.store.exhibition;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/exhibitions/*")
public class ExhibitionController {
	
	@Autowired
	private ExhibitionService exhibitionService;

	@GetMapping("main")
	public String Home() throws Exception {
		return "/store/exhibitions/exhibitionsHome";
	}
	
	@GetMapping("detail")
	public ModelAndView getDetail(ExhibitionDTO exhibitionDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("exhibitionDTO", exhibitionDTO);
		long code = exhibitionDTO.getExhibitionCode();
		
		if(code == 2689) { // 삼성전자 슈퍼세일
			mv.setViewName("/store/exhibitions/exhibitions2689");
		} else if(code == 1433) { // 리퍼마켓
			mv.setViewName("/store/exhibitions/exhibitions1433");
		} else if(code == 2181) { // 오!굿즈
			mv.setViewName("/store/exhibitions/exhibitions2181");
		} else if(code == 1763) { // 빠른배송
			mv.setViewName("/store/exhibitions/exhibitions1763");
		} else if(code == 2394) { // 저스트슬립
			mv.setViewName("/store/exhibitions/exhibitions2394");
		} else if(code == 2393) { // 오트밀하우스
			mv.setViewName("/store/exhibitions/exhibitions2393");
		} else if(code == 1958) { // 조명
			mv.setViewName("/store/exhibitions/exhibitions1958");
		} else if(code == 1552) { // 수납
			mv.setViewName("/store/exhibitions/exhibitions1552");
		} else if(code == 2415) { // 프리미엄
			mv.setViewName("/store/exhibitions/exhibitions2415");
		}
		return mv;
	}
	
	@GetMapping("exhibition")
	@ResponseBody
	public List<ExhibitionDTO> getExhibition() throws Exception {
		return exhibitionService.getExhibition();
	}
}