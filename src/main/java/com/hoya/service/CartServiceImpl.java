package com.hoya.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hoya.domain.CartListVO;
import com.hoya.domain.CartVO;
import com.hoya.domain.Criteria;
import com.hoya.domain.ProductVO;
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
	public List<CartListVO> mycart(String hmal_id, Integer pro_num) {
		
		return mapper.mycart(hmal_id, pro_num);
	}

	

}
