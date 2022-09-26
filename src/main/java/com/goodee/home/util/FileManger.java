package com.goodee.home.util;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.goodee.home.member.MemberDTO;


@Component
public class FileManger {

	
	public String saveFile(String path,ServletContext servletContext,MultipartFile multipartFile) throws Exception{
		
		String realPath = servletContext.getRealPath(path);
		System.out.println("realePath:" + realPath);
		
		
		File file = new File(realPath);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		String fileName = UUID.randomUUID().toString() + "_" + multipartFile.getOriginalFilename();
		
		file = new File(file,fileName);
		multipartFile.transferTo(file);
		
		
		return fileName;
			
		
		
	}
	
	//delete
    public boolean deleteFile(MemberDTO memberDTO,ServletContext servletContext,String path) throws Exception{
       String realPath = servletContext.getRealPath(path);
       System.out.println(realPath);
       
       File file = new File(realPath, memberDTO.getMemberFileDTO().getFileName());
       
       return file.delete();
    }
	
	
}
