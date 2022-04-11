package com.hoya.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CustomerVO {

	private String hmal_id;
	private String hmal_pw;	 
	private String hmal_name;
	private String hmal_email;
	private String hmal_zipcode;
	private String hmal_addr;
	private String hmal_deaddr;
	private String hmal_phone;	
	private Date hmal_datesub;
	private Date hmal_updatedate;
	private Date hmal_lastlogin;		
	
	
}
