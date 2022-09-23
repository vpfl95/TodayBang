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
		
		if(code == 2689) {
			mv.setViewName("/store/exhibitions/exhibitions2689");
		} else if(code == 1433) {
			mv.setViewName("/store/exhibitions/exhibitions1433");
		}
		return mv;
	}
	
	@GetMapping("exhibition")
	@ResponseBody
	public List<ExhibitionDTO> getExhibition() throws Exception {
		return exhibitionService.getExhibition();
	}
}