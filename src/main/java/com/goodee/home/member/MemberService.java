package com.goodee.home.member;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.goodee.home.service.QnaDTO;
import com.goodee.home.service.ServiceDAO;
import com.goodee.home.store.product.ProductOptionDTO;
import com.goodee.home.store.review.ProductReviewDTO;
import com.goodee.home.util.FileManger;
import com.goodee.home.util.Pager;

@Service
public class MemberService {

	@Autowired
	MemberDAO memberDAO = new MemberDAO();
	@Autowired
	ServiceDAO serviceDAO = new ServiceDAO();
	
	@Autowired
	FileManger fileManger = new FileManger();
	
	
	
	public MemberDTO getLogin(MemberDTO memberDTO) throws Exception{
		
		return memberDAO.getLogin(memberDTO);
	}
	
	
	public int getJoin(MemberDTO memberDTO) throws Exception{
		
		int result = memberDAO.getJoin(memberDTO);
		memberDAO.setJoinRole(memberDTO);
		
		return result;
	}
	
	
	public MemberDTO getJoinOverlab(MemberDTO memberDTO) throws Exception{
		
		
		
		return memberDAO.getJoinOverlab(memberDTO);
	}
	
	public MemberFileDTO setUpdate(MemberDTO memberDTO,ServletContext servletContext,MultipartFile profileImg) throws Exception{
		
		int result = memberDAO.setUpdate(memberDTO);
		
		
		String path = "resources/upload/member";
		MemberFileDTO memberFileDTO = new MemberFileDTO();
		
		if(!profileImg.isEmpty()) {
			System.out.println(" update 진행 ");
			String fileName = fileManger.saveFile(path, servletContext, profileImg);
			memberFileDTO.setUserId(memberDTO.getUserId());
			memberFileDTO.setFileName(fileName);
			memberFileDTO.setOriName(profileImg.getOriginalFilename());
			
			
			
			
			memberDAO.updateProfileImg(memberFileDTO);
			
		
		}
		
		
		
		
		return memberFileDTO;
	}
	
	public MemberFileDTO setInsert(MemberDTO memberDTO,ServletContext servletContext,MultipartFile profileImg) throws Exception{
		
		int result = memberDAO.setUpdate(memberDTO);
		
		
		String path = "resources/upload/member";
		MemberFileDTO memberFileDTO = new MemberFileDTO();
		
		if(!profileImg.isEmpty()) {
			
			String fileName = fileManger.saveFile(path, servletContext, profileImg);
			
			memberFileDTO.setUserId(memberDTO.getUserId());
			memberFileDTO.setFileName(fileName);
			memberFileDTO.setOriName(profileImg.getOriginalFilename());
			
			
			
			
			memberDAO.setProfileImg(memberFileDTO);
			
			
		}
		
		
		
		return memberFileDTO;
	}
	
	public int setDeleteProfile(MemberDTO memberDTO,ServletContext servletContext) throws Exception{
		String path = "resources/upload/member";
		int result = memberDAO.deleteProfileImg(memberDTO);	
		
		fileManger.deleteFile(memberDTO.getMemberFileDTO().getFileName(), servletContext,path);
		
		
		return result;
	}
	
	
	
	public int setUpdatePw(MemberDTO memberDTO) throws Exception{
		
		return memberDAO.setUpdatePw(memberDTO);
	}
	
	public List<DeliveryDTO> getDelivery(MemberDTO memberDTO) throws Exception{
		
		return memberDAO.getDelivery(memberDTO);
	}
	
	public int setDelivery(DeliveryDTO deliveryDTO) throws Exception{
		
		return memberDAO.setDelivery(deliveryDTO);
	}
	
	public int updateDelivery(DeliveryDTO deliveryDTO) throws Exception{
		
		return memberDAO.updateDelivery(deliveryDTO);
	}
	
	public int deleteDelivery(DeliveryDTO deliveryDTO) throws Exception{
		
		int result =0;
		List<Long> ar =  memberDAO.deleteDeliveryCheck(deliveryDTO);
		
		if(ar.size() == 0 ) {
			
			result = memberDAO.deleteDelivery(deliveryDTO);
		}else {
			
			deliveryDTO.setUserId("");
			result = memberDAO.updateDelivery(deliveryDTO);
		}
		
		
		return result;
	}
	
	public int dropMember(MemberDTO memberDTO)throws Exception{
		
		
		return memberDAO.dropMember(memberDTO);
	}
	
	public MemberDTO findId(MemberDTO memberDTO) throws Exception{
		
		return memberDAO.findId(memberDTO);
	}
	public MemberDTO findPw(MemberDTO memberDTO) throws Exception{
		
		return memberDAO.findPw(memberDTO);
	}
	
	
	public List<CartDTO> getCart(MemberDTO memberDTO) throws Exception{
		
		
		return memberDAO.getCart(memberDTO);
	}
	
	
	
	public List<OrderDTO> getOrder(MemberDTO memberDTO) throws Exception{
		
		
		return memberDAO.getOrder(memberDTO);
	}
	public List<QnaDTO> getMyQna(Pager pager) throws Exception{
		
		
		Long totalCount = memberDAO.getCount(pager);
		
		if(totalCount == 0) {
			totalCount +=1;
		}
		
		pager.getNum(totalCount);
		pager.getRowNum();
		
		
	
		
		
		List<QnaDTO> ar = memberDAO.getMyQna(pager);
		
		for(QnaDTO dto : ar) {
			
			
			Long boardNum = dto.getBoardNum();
			boardNum = serviceDAO.getCheckAnswer(boardNum);
			if(boardNum == 1) {
				dto.setCheckAnswer(true);
				
			}else {
				dto.setCheckAnswer(false);
			}
				
			
		}
		return ar;
	}
	
	
	public List<ProductReviewDTO> getMyPdReview(MemberDTO memberDTO)throws Exception{
		
		
		return memberDAO.getMyPdReview(memberDTO);
	}
	
	
	public int deleteCart(CartDTO cartDTO) throws Exception{
		
		
		return memberDAO.deleteCart(cartDTO);
	}
	
	public int setOrder(OrderDTO orderDTO) throws Exception {
		return memberDAO.setOrder(orderDTO);
	}
	
	public int setOrderOption(Order_OptionDTO order_OptionDTO) throws Exception {
		return memberDAO.setOrderOption(order_OptionDTO);
	}
	
	public Long getOrderNum() throws Exception {
		return memberDAO.getOrderNum();
	}
	
	public int updateMileage(MemberDTO memberDTO) throws Exception {
		return memberDAO.updateMileage(memberDTO);
	}
	
	public Long getMileage(MemberDTO memberDTO) throws Exception {
		return memberDAO.getMileage(memberDTO);
	}
}
