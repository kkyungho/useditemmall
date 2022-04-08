package com.hoya.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.hoya.domain.CustomerVO;
import com.hoya.mapper.CustomerMapper;

import lombok.Setter;

@Service
public class CustomerServiceImpl implements CustomerService{

	@Setter(onMethod_= @Autowired)
	private CustomerMapper mapper;
	
	// 회원가입
	@Override
	public int join(CustomerVO vo) {
		
		return mapper.join(vo);
	}

	// ID중복체크
	@Override
	public String reID(String hmal_id) {
		
		return mapper.reID(hmal_id);
	}

	// 로그인
	@Override
	public CustomerVO login(String hmal_id) {
		
		return mapper.login(hmal_id);
	}

	// 2월11일 작업
	// 회원수정
	@Override
	public int alterUser(CustomerVO vo) {
		
		return mapper.alterUser(vo);
	}
	
	// 아이디찾기
	@Override
	public String findId(String hmal_name, String hmal_phone) {
		
		String result = "";
		
		try {
			result = mapper.findId(hmal_name, hmal_phone);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
		
	// 2월11일 작업
	// 비밀번호 찾기(이메일)
	@Override
	public String findPwByEmail(String hmal_name, String hmal_email) {
		
		return mapper.findPwByEmail(hmal_name, hmal_email);
	}

	// 2월11일 작업
	// 새로운 비밀번호 생성(이메일)
	@Override
	public int alterPw(String hmal_email, String hmal_pw) {
		
		return mapper.alterPw(hmal_email, hmal_pw);
	}

	// 2월11일 작업
	// 비밀번호 변경
	@Override
	public String presentPwConfirm(String hmal_id, PasswordEncoder cryptPassEnc, String ori_hmal_pw, String alter_hmal_pw) {
		
		String result = "noPw";
		
		if(cryptPassEnc.matches(ori_hmal_pw, mapper.presentPwConfirm(hmal_id))) {
			mapper.alterNewPw(hmal_id, alter_hmal_pw);
			result = "success";
		}
		
		
		return result;
	}

	// 회원삭제
	@Override
	public int userDelete(String hmal_id, String hmal_pw, PasswordEncoder cryptPassEnc) {
		
		int count = 0;
		
		if(cryptPassEnc.matches(hmal_pw, mapper.presentPwConfirm(hmal_id))) {
			count = mapper.userDelete(hmal_id);
		}
		
		
		return count;
	}
	

}
