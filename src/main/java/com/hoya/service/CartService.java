package com.hoya.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hoya.domain.CartListVO;
import com.hoya.domain.CartVO;
import com.hoya.domain.Criteria;
import com.hoya.domain.ProductVO;

public interface CartService {
	
	public List<CartListVO> mycart(@Param("hmal_id")String hmal_id, @Param("pro_num") Integer pro_num);

	public void cartAdd(CartVO vo);
}
