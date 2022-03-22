package com.hoya.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {

	private Integer ord_code;
	private String hmal_id;
	private String ord_name;
	private String ord_zipcode;
	private String ord_addr_basic;
	private String ord_addr_detail;
	private String ord_tel;
	private int ord_price;
	private String ord_message;
	private String ord_depositor;	
	private Date ord_regdate;
}
