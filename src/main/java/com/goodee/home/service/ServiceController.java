package com.goodee.home.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.home.util.Pager;

import oracle.jdbc.proxy.annotation.Post;

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
		
		pager.setBoard(getBoardName());
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
		
		
		if(getBoardName() == "QNA") {
			System.out.println("답변 소환");
			boardDTO.setBoard("QNAANSWER");
			boardDTO  = service.getDetail(boardDTO);
			if(boardDTO != null)
				mv.addObject("qnaAnswer",boardDTO);
			
		}
		
		
		mv.setViewName("/service/detail");
		
		return mv;
	}
	
	@GetMapping("add")
	public ModelAndView addBoard() throws Exception{
		
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/service/add");
		return mv;
	}
	@PostMapping("add")
	public String addBoard(BoardDTO boardDTO) throws Exception{
	
		
		boardDTO.setBoard(getBoardName());
		service.addBoard(boardDTO);
		
		return "redirect:./list";
	}
	
	
	
	@GetMapping("delete")
	public String deleteBoard(BoardDTO boardDTO) throws Exception{
		
		boardDTO.setBoard(getBoardName());
		service.deleteBoard(boardDTO);
		
		return "redirect:./list";
	}
	
	@PostMapping("answer")
	public String addQnaAnswer(BoardDTO boardDTO) throws Exception{
		
		service.addQnaAnswer(boardDTO);
		
		
		
		//일단 리스트로 해놈
		return "redirect:./list";
	}
	
	@GetMapping("update")
	public ModelAndView updateBoard(BoardDTO boardDTO,ModelAndView mv) throws Exception{
		
		
		
		boardDTO.setBoard(getBoardName());
		boardDTO = service.getDetail(boardDTO);
		
		
		mv.addObject("update", boardDTO);
		mv.setViewName("/service/add");
		
		return mv;
	}
	
	@PostMapping("update")
	public String updateBoard(BoardDTO boardDTO) throws Exception{
		
		boardDTO.setBoard(getBoardName());
		service.updateBoard(boardDTO);
		
		
		return "redirect:./list";
	}
	
	
	
	
}
