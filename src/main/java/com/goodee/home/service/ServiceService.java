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
	
	
	public List<BoardDTO> getList(Pager pager) throws Exception{
		
		Long totalCount = serviceDAO.getCount(pager);
		pager.getNum(totalCount);
		pager.getRowNum();
		
		
		return serviceDAO.getList(pager);
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
	
	public int updateBoard(BoardDTO boardDTO) throws Exception{	
		
		return serviceDAO.updateBoard(boardDTO);
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
	
	public int updateAnswer(BoardDTO boardDTO) throws Exception{
		
		return serviceDAO.updateAnswer(boardDTO);
	}
	
	public int addBoardFile(BoardFileDTO boardFileDTO) throws Exception{
		
		return serviceDAO.addBoardFile(boardFileDTO);
	}
}
