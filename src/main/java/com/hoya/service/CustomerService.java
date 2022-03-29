package com.hoya.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.hoya.domain.CustomerVO;

public interface CustomerService {

	// 회원가입
	public int join(CustomerVO vo);
	
	// ID중복체크
	public String reID(String hmal_id);
	
	// 로그인
	public CustomerVO login(String hmal_id);
	
	// 2월11일 작업
	// 회원수정
	public int alterUser(CustomerVO vo);
	
	// 아이디찾기(이름,핸드폰)
	public CustomerVO findId(String hmal_name, String hmal_phone);
	
	// 2월11일 작업
	// 비밀번호 찾기(이메일)
	public String findPwByEmail(String hmal_email);
	
	// 2월11일 작업
	// 새로운 비밀번호 생성(이메일)
	public int alterPw(String hmal_email,String hmal_pw);
	
	// 2월11일 작업
	// 비밀번호변경
	public String presentPwConfirm(String hmal_id, PasswordEncoder cryptPassEnc, String ori_hmal_pw, String alter_hmal_pw);
	
	// 회원삭제
	public int userDelete(String hmal_id, String hmal_pw, PasswordEncoder cryptPassEnc);
}
