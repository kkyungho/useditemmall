package com.hoya.domain;

import lombok.Data;

@Data
public class OrderDetail {

	// 주문상세 : 주문상품이 여러개 존재.(최소 1개이상)
	private Integer ord_code;
	private Integer pro_num;
	private int dt_amount;
	private int dt_price; 
}
