package com.hoya.mapper;

import com.hoya.domain.AdminVO;

public interface AdminMapper {

	// 관리자 로그인
	public AdminVO adminLogin(String ad_userid);
	
	// 관리자 가입
	public int adminJoin(AdminVO vo);
	
	// ID중복체크
	public String reID(String ad_userid);
}
