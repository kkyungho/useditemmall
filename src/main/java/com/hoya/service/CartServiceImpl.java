package com.hoya.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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

}
