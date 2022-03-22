package com.hoya.service;

import java.util.List;

import com.hoya.domain.OrderDetailList;
import com.hoya.domain.OrderInfoVO;
import com.hoya.domain.OrderVO;

public interface OrderService {
	
	public List<OrderInfoVO> orderInfo(String hmal_id);
	
	public void orderInsert(OrderVO vo, OrderDetailList vo2);
}
