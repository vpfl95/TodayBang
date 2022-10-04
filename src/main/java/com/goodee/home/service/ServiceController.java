package com.goodee.home.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.home.member.MemberDTO;
import com.goodee.home.util.FileManger;
import com.goodee.home.util.Pager;
import com.google.gson.JsonObject;

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
		
		
		List<QnaDTO> ar = null;
		// getBoardName()
		pager.setUrl("list");
		pager.setBoard(getBoardName());
		ar = service.getList(pager);
		
		if(getBoardName() == "QNA") {
			
			List<QnaDTO> oftenAr = service.getOftenQna();
			
			mv.addObject("oftenQna",oftenAr);
		}
		
		
		
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
	public String addBoard(BoardDTO boardDTO,MultipartFile [] file,HttpSession session) throws Exception{
	
		
		boardDTO.setBoard(getBoardName());
		
		String contents = boardDTO.getContents();
		boardDTO.setContents(contents.replace("temp/"+boardDTO.getUserId(), boardDTO.getBoard())) ;
		
		service.addBoard(boardDTO,file,session.getServletContext());
		service.saveTempFIle(boardDTO,session.getServletContext());
		
		
		return "redirect:./list";
	}
	
	
	
	@GetMapping("delete")
	public String deleteBoard(BoardDTO boardDTO,HttpSession session) throws Exception{
		
		boardDTO.setBoard(getBoardName());
		boardDTO = service.getDetail(boardDTO);
		boardDTO.setBoard(getBoardName());
		service.deleteBoard(boardDTO,session.getServletContext());
		
		return "redirect:./list";
	}
	
	
	
	@GetMapping("update")
	public ModelAndView updateBoard(BoardDTO boardDTO,ModelAndView mv) throws Exception{
		
		
		
		
		
		boardDTO.setBoard(getBoardName());
		boardDTO = service.getDetail(boardDTO);
		
		mv.addObject("updateSize",boardDTO.getBoardFileDTOs().size());
		mv.addObject("update", boardDTO);
		mv.setViewName("/service/add");
		
		return mv;
	}
	
	@PostMapping("update")
	public String updateBoard(BoardDTO boardDTO,MultipartFile [] file,HttpSession session , Integer number) throws Exception{
		

		
		boardDTO.setBoard(getBoardName());
		
		
		
		String contents = boardDTO.getContents();
		boardDTO.setContents(contents.replace("temp/"+boardDTO.getUserId(), boardDTO.getBoard())) ;
		service.saveTempFIle(boardDTO,session.getServletContext());
		service.updateBoard(boardDTO,file,session.getServletContext(),number);
		
		
		
		
		
		
		return "redirect:./list";
	}
	
	
	@PostMapping("answer")
	public String addQnaAnswer(BoardDTO boardDTO,MultipartFile [] file,HttpSession session) throws Exception{
		boardDTO.setBoard("QNAANSWER");
		service.addQnaAnswer(boardDTO,file,session.getServletContext());
		
		
		
		//일단 리스트로 해놈
		return "redirect:./detail?boardNum="+boardDTO.getBoardNum();
	}
	
	@GetMapping("deleteAnswer")
	public String deleteAnswer(BoardDTO boardDTO,HttpSession session) throws Exception{
		
		
		
		
		boardDTO.setBoard("QNAANSWER");
		boardDTO = service.getDetail(boardDTO);
		boardDTO.setBoard("QNAANSWER");
		service.deleteAnswer(boardDTO,session.getServletContext());
		
		return "redirect:./detail?boardNum="+boardDTO.getBoardNum();
	}
	
	
	@GetMapping("updateAnswer")
	public ModelAndView updateAnswer(BoardDTO boardDTO,ModelAndView mv ) throws Exception{
		
		
		boardDTO.setBoard("QNAANSWER");
		boardDTO = service.getDetail(boardDTO);
		
		mv.addObject("update",boardDTO);
		
		
		boardDTO.setBoard(getBoardName());
		boardDTO = service.getDetail(boardDTO);
		mv.addObject("boardList",boardDTO);
		
		boardDTO.setBoard("QNAANSWER");
		boardDTO = service.getDetail(boardDTO);
		mv.addObject("updateSize",boardDTO.getBoardFileDTOs().size());
		
		mv.setViewName("/service/detail");
		
		return mv;
	}
	@PostMapping("updateAnswer")
	public String updateAnswer(BoardDTO boardDTO,MultipartFile [] file,HttpSession session,Integer number) throws Exception{
		
		
		
		boardDTO.setBoard("QNAANSWER");
		service.updateBoard(boardDTO,file,session.getServletContext(),number);
		
		
		return "redirect:./list";
	}
	
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request,HttpSession session ) throws Exception  {
		System.out.println("AJAX 실행");
		JsonObject jsonObject = new JsonObject();
		
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		
		
			String path = "resources/upload/temp/"+memberDTO.getUserId();
			FileManger fileManger = new FileManger();
			String fileName=null;
			try {
				System.out.println("파일저장");
				String FileName = fileManger.saveFile(path, session.getServletContext(), multipartFile);
				fileName = FileName;
				jsonObject.addProperty("url", "/"+path+"/"+FileName); // contextroot + resources + 저장할 내부 폴더명
				jsonObject.addProperty("responseCode", "success");
					
			} catch (IOException e) {
				//fileManger.deleteFile(fileName, session.getServletContext(), path);
				jsonObject.addProperty("responseCode", "error");
				e.printStackTrace();
				
			}
			
		
		
		
		
		String a = jsonObject.toString();
		return a;
	}
	
	
	
}
