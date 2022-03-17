package com.hoya.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductVO {
		
	private Integer pro_num;
	private String hmal_id;
	private Integer cate_prt_code;
	private Integer cate_code;	
	private String pro_name;		
	private int pro_price;	
	private String pro_content;
	private String pro_img;
	private String pro_uploadpath;
	private int pro_amount;
	private String pro_con;
	private Date pro_date;
	private Date pro_updatedate;
	
	private MultipartFile upload;

}
