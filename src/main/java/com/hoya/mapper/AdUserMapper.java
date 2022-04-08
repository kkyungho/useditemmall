package com.hoya.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hoya.domain.Criteria;
import com.hoya.domain.CustomerVO;

public interface AdUserMapper {
	
	// 회원목록 불러오기
	public List<CustomerVO> getList();
	
	// 검색기능이 포함된 필드(type, keyword)가 사용하게 됨.
	public List<CustomerVO> getListWithPaging(@Param("hmal_id") String hmal_id, @Param("cri") Criteria cri);
	
	// 검색기능 포함.
	public int getTotalCount(String hmal_id);
	
	// 회원 불러오기
	public CustomerVO get(String hmal_id);

}
