package com.hoya.domain;

import lombok.Data;

@Data
public class ReviewListVO {

	private Integer rew_num;
	private String hmal_id;
	private Integer pro_num;
	private String cate_code;	
	private String pro_name;
	private String rew_content;	
	private String rew_regdate;
	private String pro_img;
	private String pro_uploadpath;
	private int pro_price;
	private String pro_con;
	
}