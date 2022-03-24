package com.hoya.web;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hoya.domain.AdminVO;
import com.hoya.service.AdminService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@RequestMapping("/admin/*")
@Controller
public class AdminController {

	private AdminService service;
	
	private PasswordEncoder cryptPassEnc;
	
	// 관리자 로그인
	@GetMapping("/adminLogin")
	public void adLoginForm() {
		
	}
	
	// 관리자 로그인 인증
	
	
	// 관리자 등록폼
	@GetMapping("/adminJoin")
	public void adminRegister() {
		
	}
	
	// 관리자 저장
	@PostMapping("/adminJoin")
	public String adminJoin(AdminVO vo, RedirectAttributes rttr) {
		
		vo.setAd_userpw(cryptPassEnc.encode(vo.getAd_userpw()));
		
		int result = service.adminJoin(vo);
		
		if(result == 1) {
			rttr.addFlashAttribute("msg", "success");
		}else {
			rttr.addFlashAttribute("msg", "fail");
		}
		
		return "redirect:/admin/main";
	}
	
	// 아이디중복체크
	@ResponseBody
	@GetMapping("/reID")
	public ResponseEntity<String> reID(@RequestParam("ad_userid") String ad_userid) throws Exception{
		
		String result = "";
		ResponseEntity<String> entity = null;
		
		result = StringUtils.isEmpty(service.reID(ad_userid)) ? "Y" : "N";
		
		entity = new ResponseEntity<String>(result, HttpStatus.OK);
		
		return entity;
	}
	
}
