package com.goodee.home.service;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.goodee.home.util.FileManger;
import com.goodee.home.util.Pager;


@Service
public class ServiceService {

	@Autowired
	private ServiceDAO serviceDAO;
	@Autowired
	private FileManger fileManger;
	
	
	public List<QnaDTO> getList(Pager pager) throws Exception{
		
		Long totalCount = serviceDAO.getCount(pager);
		pager.getNum(totalCount);
		pager.getRowNum();
		
		List<QnaDTO> ar = serviceDAO.getList(pager);
		
		if(pager.getBoard() == "QNA") {
			for(QnaDTO dto : ar) {
				
				
				Long boardNum = dto.getBoardNum();
				boardNum = serviceDAO.getCheckAnswer(boardNum);
				if(boardNum == 1) {
					System.out.println(" 답변 있음"+ boardNum);
					dto.setCheckAnswer(true);
					
				}else {
					System.out.println(" 답변 없음" + boardNum);
					dto.setCheckAnswer(false);
				}
					
				
			}
		}
		
		
		return ar;
	}
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception{
		
		return serviceDAO.getDetail(boardDTO);
	}
	
	public int addBoard(BoardDTO boardDTO,MultipartFile [] files,ServletContext servletContext) throws Exception{	
		
		int result = serviceDAO.addBoard(boardDTO);
		
		
		String path = "resources/upload/" +boardDTO.getBoard();
		
		if(files.length !=0) {
			for(MultipartFile file : files) {
				
				if(!file.isEmpty()) {
					
					
					String fileName = fileManger.saveFile(path, servletContext, file);
					BoardFileDTO boardFileDTO = new BoardFileDTO();
					boardFileDTO.setBoardNum(boardDTO.getBoardNum());
					boardFileDTO.setFileName(fileName);
					boardFileDTO.setOriName(file.getOriginalFilename());
					boardFileDTO.setBoard(boardDTO.getBoard());
					serviceDAO.addBoardFile(boardFileDTO);
					
				}
			}
		}
		
		return result;
	}
	
	public int deleteBoard(BoardDTO boardDTO,ServletContext servletContext) throws Exception{	
	
		String path = "resources/upload/"+boardDTO.getBoard();
		if(boardDTO.getBoardFileDTOs() != null) {
			for(BoardFileDTO boardFileDTO : boardDTO.getBoardFileDTOs()) {
				
				fileManger.deleteFile(boardFileDTO.getFileName(), servletContext, path);
				serviceDAO.deleteBoardFile(boardDTO);
			}
		}
		
		
		return serviceDAO.deleteBoard(boardDTO);
	}
	
	public int addQnaAnswer(BoardDTO boardDTO,MultipartFile [] files,ServletContext servletContext) throws Exception{	
		
		
			int result = serviceDAO.addQnaAnswer(boardDTO);
		
		String path = "resources/upload/" +boardDTO.getBoard();
		
		if(files.length !=0) {
			for(MultipartFile file : files) {
				
				if(!file.isEmpty()) {
					
					String fileName = fileManger.saveFile(path, servletContext, file);
					BoardFileDTO boardFileDTO = new BoardFileDTO();
					boardFileDTO.setBoardNum(boardDTO.getBoardNum());
					boardFileDTO.setFileName(fileName);
					boardFileDTO.setOriName(file.getOriginalFilename());
					boardFileDTO.setBoard(boardDTO.getBoard());
					serviceDAO.addBoardFile(boardFileDTO);
					
				}
			}
		}
		return result;
	}
	
	public int updateBoard(BoardDTO boardDTO,MultipartFile [] files,ServletContext servletContext,Integer number) throws Exception{	
		
		String board = boardDTO.getBoard();
		int result = serviceDAO.updateBoard(boardDTO);
		boardDTO = getDetail(boardDTO);
		
		System.out.println("결과 : " + result);
		String path = "resources/upload/" +board;
		// boardDTO.getBoardFileDTOs() 기존 파일
		// files < 새롭게 추가된 파일
		//boardDTO.getBoardFileDTOs().size() >> title 총 수
		
		if(number != null) {
			String[] ar = number.toString().split("");
		
			for(String num : ar) {
				int i = Integer.parseInt(num);
				
				System.out.println("삭제 num = " + num);
				BoardFileDTO boardFileDTO = boardDTO.getBoardFileDTOs().get(i-1);
				boardFileDTO.setBoard(board);
				serviceDAO.deleteFile(boardFileDTO);
				fileManger.deleteFile(boardFileDTO.getFileName(), servletContext, path);
			}
		}
		
		if(files.length !=0) {
			for(MultipartFile file : files) {
				
				
				if(!file.isEmpty()) {
					System.out.println("새 파일 추가");
					String fileName = fileManger.saveFile(path, servletContext, file);
					BoardFileDTO boardFileDTO = new BoardFileDTO();
					boardFileDTO.setBoardNum(boardDTO.getBoardNum());
					boardFileDTO.setFileName(fileName);
					boardFileDTO.setOriName(file.getOriginalFilename());
					boardFileDTO.setBoard(board);
					serviceDAO.addBoardFile(boardFileDTO);
					
				}
			}
		}
		return result;
		 
	}
	
	public int deleteAnswer(BoardDTO boardDTO,ServletContext servletContext) throws Exception{
		
		
		String path = "resources/upload/"+boardDTO.getBoard();
		if(boardDTO.getBoardFileDTOs() != null) {
			for(BoardFileDTO boardFileDTO : boardDTO.getBoardFileDTOs()) {
				
				fileManger.deleteFile(boardFileDTO.getFileName(), servletContext, path);
				serviceDAO.deleteBoardFile(boardDTO);
			}
		}
		return serviceDAO.deleteAnswer(boardDTO);
	}
	

	
	public int addBoardFile(BoardFileDTO boardFileDTO) throws Exception{
		
		return serviceDAO.addBoardFile(boardFileDTO);
	}
	
	public int deleteFile(BoardFileDTO boardFileDTO) throws Exception{
		
		
		return serviceDAO.deleteFile(boardFileDTO);
	}
	
	
}
