package com.hoya.service;

import java.util.List;

import com.hoya.domain.CartListVO;
import com.hoya.domain.CartVO;

public interface CartService {
	
	public void cartAdd(CartVO vo);
	
	public List<CartListVO> mycart(String hmal_id);
	
	public void cartEmpty(Integer cart_code);
	
}
