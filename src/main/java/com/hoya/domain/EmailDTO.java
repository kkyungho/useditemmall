package com.hoya.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class EmailDTO {

	private String senderName;
	private String senderMail;
	private String receiveMail;
	private String subject;
	private String message;
}
