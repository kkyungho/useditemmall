package com.hoya.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	
	private Long brd_bno;
	private String brd_title;
	private String brd_content;
	private String hmal_name;
	private Date brd_regdate;
	private Date brd_updatedate;
	private int brd_replycnt;
	
	private List<BoardAttachVO> attachList;

}
