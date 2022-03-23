package com.hoya.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hoya.domain.CartListVO;
import com.hoya.domain.CartVO;
import com.hoya.domain.Criteria;

public interface CartMapper {
	
	public List<CartListVO> mycart(@Param("hmal_id")String hmal_id, @Param("pro_num") Integer pro_num);

	public void cartAdd(CartVO vo);
}
