package com.goodee.home.util;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;


@Component
public class FileManger {

	
	public String saveFile(String path,ServletContext servletContext,MultipartFile multipartFile) throws Exception{
		
		String realPath = servletContext.getRealPath(path);
		System.out.println("realPath:" + realPath);
		
		
		File file = new File(realPath);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		String fileName = UUID.randomUUID().toString() + "_" + multipartFile.getOriginalFilename();
		
		file = new File(file,fileName);
		multipartFile.transferTo(file);
		
		return fileName;
	}
	
	public boolean deleteFile(String path, ServletContext servletContext, FileDTO fileDTO) throws Exception {
		String realPath = servletContext.getRealPath(path);
		File file = new File(realPath, fileDTO.getFileName());
		
		return file.delete();
	}
	
	public boolean deleteFile(String path, ServletContext servletContext, String fileName) throws Exception {
		String realPath = servletContext.getRealPath(path);
		File file = new File(realPath, fileName);
		
		return file.delete();
	}
}
