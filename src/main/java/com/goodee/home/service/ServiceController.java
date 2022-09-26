package com.goodee.home.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.home.util.Pager;

@Controller
@RequestMapping(value = { "/service/notice/*", "/service/qna/*"})
public class ServiceController {

	@Autowired
	private ServiceService service;
	
	@Autowired
	private HttpServletRequest request;
	
	@ModelAttribute("board")
	public String getBoardName() throws Exception{
		
		
		String [] spList = request.getServletPath().split("/");
		if(spList[2].equals("notice")) {
			return "NOTICE";
		}else {
			return "QNA";
		}
	}
	
	
	
	
	@GetMapping("list")
	public ModelAndView getBoard(Pager pager) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		
		List<BoardDTO> ar = null;
		// getBoardName()
		
		
		ar = service.getList(pager);
		
		mv.addObject("boardList",ar);
		mv.setViewName("/service/list");
		
		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView getDetail(BoardDTO boardDTO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		boardDTO.setBoard(getBoardName());
		boardDTO  = service.getDetail(boardDTO);
		
		
		mv.addObject("boardList",boardDTO);
		mv.setViewName("/service/detail");
		
		return mv;
	}
	
	
	
	
}
