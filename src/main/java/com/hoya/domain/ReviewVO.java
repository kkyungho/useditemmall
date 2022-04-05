package com.hoya.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {

	private Integer rew_num;
	private String hmal_id;
	private Integer pro_num;
	private String rew_content;	
	private Date rew_regdate;
}
