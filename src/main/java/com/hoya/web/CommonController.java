package com.hoya.web;

import javax.inject.Inject;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.hoya.service.UserProductService;

import lombok.extern.log4j.Log4j;

@Log4j
@ControllerAdvice(basePackages = {"com.hoya.web"})
public class CommonController {

	@Inject
	private UserProductService service;
	
	@ModelAttribute
	public void commonCategoryData(Model model) {
		
		log.info("공통모델 데이터 참조");
		
		model.addAttribute("userCategory", service.mainCategory());
	}
}
