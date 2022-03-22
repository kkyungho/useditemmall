package com.hoya.mapper;

import java.util.List;

import com.hoya.domain.OrderDetail;
import com.hoya.domain.OrderInfoVO;
import com.hoya.domain.OrderVO;

public interface OrderMapper {

	public List<OrderInfoVO> orderInfo(String hmal_id);
	
	public void orderInsert(OrderVO vo);
	
	public void orderDetailInsert(OrderDetail vo);
}
