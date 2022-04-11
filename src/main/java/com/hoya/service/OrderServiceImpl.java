package com.hoya.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hoya.domain.OrderDetailList;
import com.hoya.domain.OrderInfoVO;
import com.hoya.domain.OrderVO;
import com.hoya.mapper.CartMapper;
import com.hoya.mapper.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Inject
	private OrderMapper mapper;
	
	@Override
	public List<OrderInfoVO> orderInfo(String hmal_id) {
		
		return mapper.orderInfo(hmal_id);
	}

	@Override
	public void orderInsert(OrderVO order, OrderDetailList orderDetail) {
		
		// 1) 주문작업
		mapper.orderInsert(order); // vo안에 ord_code 변수값을 이용하여, 시퀀스값을 참조할수가 있다.
		
		Integer ord_code = order.getOrd_code();
		String hmal_id = order.getHmal_id();
		
		// 2) 주문상세작업		
		orderDetail.getOrderDetailList().forEach(oDetail -> {
			oDetail.setOrd_code(ord_code);
			mapper.orderDetailInsert(oDetail);
		});
				
		
	}

	@Override
	public List<OrderInfoVO> directOrderInfo(Integer pro_num) {
		
		return mapper.directOrderInfo(pro_num);
	}

}
