package com.goodee.home.member;

import java.util.List;

import org.springframework.stereotype.Component;



public class MemberDTO {

	private String userId;
	private String password;
	private String nickname;
	private String userName;
	private String phone;
	private String email;
	private Long mileage;
	private List<RoleDTO> roleDTOs;
	private MemberFileDTO memberFileDTO;
	
	private RoleDTO roleDTO;
	private Long roleNum;
	private Long iNum;
	private Long cNum;
	
	
	
	
	
	
	
	
	
	
	
	public Long getMileage() {
		if(this.mileage == null)
			mileage = 0L;
		
		return mileage;
	}
	public void setMileage(Long mileage) {
		this.mileage = mileage;
	}
	public Long getiNum() {
		return iNum;
	}
	public void setiNum(Long iNum) {
		this.iNum = iNum;
	}
	public Long getcNum() {
		return cNum;
	}
	public void setcNum(Long cNum) {
		this.cNum = cNum;
	}
	public Long getRoleNum() {
		return roleNum;
	}
	public void setRoleNum(Long roleNum) {
		this.roleNum = roleNum;
	}
	public RoleDTO getRoleDTO() {
		return roleDTO;
	}
	public void setRoleDTO(RoleDTO roleDTO) {
		this.roleDTO = roleDTO;
	}
	
	public MemberFileDTO getMemberFileDTO() {
		return memberFileDTO;
	}
	public void setMemberFileDTO(MemberFileDTO memberFileDTO) {
		this.memberFileDTO = memberFileDTO;
	}
	public List<RoleDTO> getRoleDTOs() {
		return roleDTOs;
	}
	public void setRoleDTOs(List<RoleDTO> roleDTOs) {
		this.roleDTOs = roleDTOs;
	}
	public String getUserId() {
		if(userId == null)userId = "";
		
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		if(nickname == null)nickname = "";
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPhone() {
		if(phone == null)phone = "";
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		if(email == null)email = "";
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
