package com.goodee.home.store.exhibition;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/exhibitions/*")
public class ExhibitionController {

	@GetMapping("main")
	public String Home() throws Exception {
		return "/store/exhibitions/exhibitionsHome";
	}
	
	@GetMapping("detail")
	public ModelAndView getDetail(ExhibitionDTO exhibitionDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		if(exhibitionDTO.getExhibitionCode() == 2689) {
			mv.setViewName("/store/exhibitions/exhibitions2689");
		}
		return mv;
	}
}