package com.goodee.home.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
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
		
		if(totalCount == 0) {
			totalCount +=1;
		}
		
		pager.getNum(totalCount);
		pager.getRowNum();
		
		List<QnaDTO> ar = serviceDAO.getList(pager);
		
		if(pager.getBoard() == "QNA") {
			for(QnaDTO dto : ar) {
				
				
				Long boardNum = dto.getBoardNum();
				boardNum = serviceDAO.getCheckAnswer(boardNum);
				if(boardNum == 1) {
					dto.setCheckAnswer(true);
					
				}else {
					dto.setCheckAnswer(false);
				}
					
				
			}
			
			
		}
		
		
		return ar;
	}
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception{
		
		
		if(boardDTO.getBoard() != "QNAANSWER") {
			serviceDAO.hitBoard(boardDTO);
			
		}
		
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
		
		String path = "resources/upload/" +board;
		// boardDTO.getBoardFileDTOs() 기존 파일
		// files < 새롭게 추가된 파일
		//boardDTO.getBoardFileDTOs().size() >> title 총 수
		System.out.println("number" + number);
		if(number !=null && number !=0) {
			for(int i = 0 ; i < number ; i ++) {
				
				
				
				BoardFileDTO boardFileDTO = boardDTO.getBoardFileDTOs().get(i);
				if(boardFileDTO.getSort()) {
					continue;
				}
				
				boardFileDTO.setBoard(board);
				serviceDAO.deleteFile(boardFileDTO);
				fileManger.deleteFile(boardFileDTO.getFileName(), servletContext, path);
			}
		}
		
		if(files.length !=0) {
			for(MultipartFile file : files) {
				
				
				if(!file.isEmpty()) {
					System.out.println("update 파일추가");
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
	
	public List<QnaDTO> getOftenQna() throws Exception{
		
		
		return serviceDAO.getOftenQna();
	}
	
	public void saveTempFIle(BoardDTO boardDTO,ServletContext servletContext) throws Exception{
		
		String path = "resources/upload/temp/"+boardDTO.getUserId();
		String realpath = servletContext.getRealPath(path);
		String [] contents = boardDTO.getContents().split("src=\"/");
		String [] split = null;
		ArrayList<String> src = new ArrayList<String>();
		
		for(int i = 1; i < contents.length ; i++) {
			split = contents[i].split("\"");
			src.add(split[0]); ///resources/upload/QNA/filename
		}
		
		for(String ar : src){
				String copyFilePath = servletContext.getRealPath(ar); // upload/QNA
			    String oriFilePath = copyFilePath.replace(boardDTO.getBoard(),"temp\\"+boardDTO.getUserId()); // upload\temp\id
			    File copyfile = new File(copyFilePath);
			    System.out.println("======파일 복사 실행 전");
			    if(!copyfile.exists()) {
			    	System.out.println("======파일 복사");
			    	FileInputStream fis = new FileInputStream(oriFilePath); //읽을파일
			        FileOutputStream fos = new FileOutputStream(copyFilePath); //복사할파일
			        
			    	
			        int data = 0;
			        while((data=fis.read())!=-1) {
			         fos.write(data);
			        }
			        fis.close();
			        fos.close();
			    }
			    String [] fileNames = ar.split("/");
			    String fileName = fileNames[fileNames.length-1];
			    String [] fileOriNames = fileName.split("_",2);
			    String fileOriName = fileOriNames[1];
			    System.out.println("fileOriName = " + fileOriName);
			    
			    BoardFileDTO boardFileDTO = new BoardFileDTO();
				boardFileDTO.setBoardNum(boardDTO.getBoardNum());
				boardFileDTO.setFileName(fileName);
				boardFileDTO.setOriName(fileOriName);
				boardFileDTO.setBoard(boardDTO.getBoard());
				boardFileDTO.setSort(true);
				serviceDAO.addBoardFile(boardFileDTO);
		        
		}
		File folder = new File(realpath);
        if(folder.exists()) {
        	File[] files = folder.listFiles();
        	
        	for(File file : files) {
        		System.out.println("list File ! =" + file.getName());
        		file.delete();
        	}
        	
            folder.delete();
                
        }
		
		
	}
}
	
	
	
	
	
	
	

