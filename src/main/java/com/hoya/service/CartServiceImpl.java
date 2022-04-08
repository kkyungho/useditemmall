package com.hoya.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hoya.domain.CartListVO;
import com.hoya.domain.CartVO;
import com.hoya.mapper.CartMapper;

@Service
public class CartServiceImpl implements CartService {
	
	@Inject
	private CartMapper mapper;

	@Override
	public void cartAdd(CartVO vo) {
		
		mapper.cartAdd(vo);
	}

	@Override
	public List<CartListVO> mycart(String hmal_id) {
		
		return mapper.mycart(hmal_id);
	}

	@Override
	public void cartEmpty(Integer cart_code) {
		
		mapper.cartEmpty(cart_code);
	}

	@Override
	public int getCartCount(String hmal_id) {
		
		return mapper.getCartCount(hmal_id);
	}

	

}
