package com.hoya.web;

import javax.servlet.http.HttpSession;

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
import com.hoya.domain.CustomerVO;
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
	@ResponseBody
	@PostMapping("/adminLogin")
	public ResponseEntity<String> adminLogin(@RequestParam("ad_userid") String ad_userid, @RequestParam("ad_userpw") String ad_userpw, HttpSession session) throws Exception{
		
		String result = "";
		ResponseEntity<String> entity = null;
		
		AdminVO vo = service.adminLogin(ad_userid);
				
		if(vo == null) { // id가 존재안하는 의미.
			result = "idFail";			
		}else { // id가 존재하는 의미.
			
			if(cryptPassEnc.matches(ad_userpw, vo.getAd_userpw())) {
				result = "success";
				
				session.setAttribute("loginStatus", vo); // 로그인 성공 상태정보를 세션으로 저장
			}else {
				result = "pwFail";
			}
		}
		
		entity = new ResponseEntity<String>(result, HttpStatus.OK);
		
		return entity;
	}
	
	// 로그아웃
	@RequestMapping("/adminLogout")
	public String adminLogout(HttpSession session, RedirectAttributes rttr) {
		
		session.invalidate();
		
		return "redirect:/admin/adminLogin";
	}
	
	// 관리자 메인페이지
	@GetMapping("/main")
	public void main() {
		
	}
	
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
