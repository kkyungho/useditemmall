package com.hoya.web;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hoya.domain.BoardVO;
import com.hoya.domain.Criteria;
import com.hoya.domain.CustomerVO;
import com.hoya.domain.PageDTO;
import com.hoya.service.AdUserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@Controller
@RequestMapping("/admin/user/*")
public class AdUserController {
	
	@Inject
	private AdUserService service;
	
	// 게시물목록
	@GetMapping("/list") 
	public void list(@ModelAttribute("cri") Criteria cri, @RequestParam(value = "hmal_id", required = false) String hmal_id, Model model) {
		
		cri.setAmount(5);
		
		List<CustomerVO> list = service.getListWithPaging(cri);
		model.addAttribute("list", list);
		
		int total = service.getTotalCount(hmal_id);
		
		log.info("total: " + total);
		
		PageDTO pageDTO = new PageDTO(cri, total);
		model.addAttribute("pageMaker", pageDTO);
		
	}

}
