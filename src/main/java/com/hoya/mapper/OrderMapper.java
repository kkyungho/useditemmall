package com.hoya.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hoya.domain.OrderDetail;
import com.hoya.domain.OrderInfoVO;
import com.hoya.domain.OrderVO;

public interface OrderMapper {

	public List<OrderInfoVO> orderInfo(String hmal_id);
	
	public List<OrderInfoVO> directOrderInfo(@Param("pro_num") Integer pro_num, @Param("ord_amount") Integer ord_amount);
	
	public void orderInsert(OrderVO vo);
	
	public void orderDetailInsert(OrderDetail vo);
}
