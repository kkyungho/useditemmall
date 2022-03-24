package com.hoya.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AdminVO {

	private String ad_userid;
	private String ad_userpw;
	private String ad_name;
	private Date ad_logintime;
}
