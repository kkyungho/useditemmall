package com.hoya.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.hoya.domain.CustomerVO;

public interface CustomerMapper {

	public int join(CustomerVO vo);
	
	// ID중복체크
	public String reID(String hmal_id);
	
	// 로그인
	public CustomerVO login(String hmal_id);
	
	// 2월11일 작업
	// 회원수정
	public int alterUser(CustomerVO vo);
	
	// 2월11일 작업
	// 비밀번호 찾기(이메일)
	public String findPwByEmail(String hmal_email);
	
	// 2월11일 작업
	// 새로운 비밀번호 생성(이메일)
	public int alterPw(@RequestParam("hmal_email") String hmal_email, @RequestParam("hmal_pw") String hmal_pw);
	
	// 2월11일 작업
	// 비밀번호 변경1
	public String presentPwConfirm(String hmal_id);
	
	// 2월11일 작업
	// 비밀번호 변경2
	public int alterNewPw(@Param("hmal_id") String hmal_id, @Param("alter_hmal_pw") String alter_hmal_pw);
	
	// 회원삭제
	public int userDelete(@Param("hmal_id") String hmal_id);
}
