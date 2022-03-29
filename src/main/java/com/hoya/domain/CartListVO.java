package com.hoya.domain;

import lombok.Data;

//장바구니테이블과 상품테이블의 조인한 결과를 저장.
@Data
public class CartListVO {
		
	private Long cart_code;
	private Integer pro_num;
	private String hmal_id;	
	private String pro_name;
	private String pro_img;
	private String pro_uploadpath;
	private int pro_price;	

}
