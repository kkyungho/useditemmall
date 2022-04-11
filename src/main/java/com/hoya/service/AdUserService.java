package com.hoya.service;

import java.util.List;

import com.hoya.domain.Criteria;
import com.hoya.domain.CustomerVO;

public interface AdUserService {
	
	// 회원목록 불러오기
	public List<CustomerVO> getList();
	
	// 검색기능이 포함된 필드(type, keyword)가 사용하게 됨.
	public List<CustomerVO> getListWithPaging(Criteria cri);
	
	// 검색기능 포함.
	public int getTotalCount(String hmal_id);
	
	// 회원 불러오기
	public CustomerVO get(String hmal_id);


}
