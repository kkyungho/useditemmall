package com.hoya.domain;

import java.util.List;

import lombok.Data;

@Data
public class OrderDetailList {

	// 중요하다
	// 주문페이지에서 주문상품정보를 여러개 입력받고자 할때 사용목적
	// 클라이언트에서 파라미터정보를 아래와 같이 구성해야 한다. 예> List<OrderDetail> orderDetailList;
	// <input name파라미터 : orderDetailList[0].속성명, orderDetailList[1].속성명
	private List<OrderDetail> orderDetailList;
}
