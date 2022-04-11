package com.hoya.web;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hoya.domain.CustomerVO;
import com.hoya.domain.EmailDTO;
import com.hoya.service.CustomerService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@RequestMapping("/customer/*")
@Controller
public class CustomerController {

	@Inject
	private PasswordEncoder cryptPassEnc;
	
	@Inject
	private CustomerService service;
	
	@Inject
	private JavaMailSender mailSender;
		
	// 주요기능 : 회원기능
	
	
	// 회원가입 폼 : /customer/join -> jsp파일명
	@GetMapping("/join")
	public void join() {
			
	}
		
		
	// 회원가입저장
	@PostMapping("/join")
	public String joinOk(CustomerVO vo, RedirectAttributes rttr) throws Exception{
		
		vo.setHmal_pw(cryptPassEnc.encode(vo.getHmal_pw()));
		
		log.info("CustomerVO: " + vo);
		
		service.join(vo);
		
		return "redirect:/customer/login";
	}
		
		
	// 아이디중복체크
	@ResponseBody
	@GetMapping("/reID")
	public ResponseEntity<String> reID(@RequestParam("hmal_id") String hmal_id) throws Exception{
		
		String result = "";
		ResponseEntity<String> entity = null;
		
		result = StringUtils.isEmpty(service.reID(hmal_id)) ? "Y" : "N";
		
		entity = new ResponseEntity<String>(result, HttpStatus.OK);
		
		return entity;
	}
	
	// 메일인증요청
	@ResponseBody
	@GetMapping("/certiMail")
	public ResponseEntity<String> certiMail(@RequestParam("hmal_email") String hmal_email, HttpSession session){
		
		ResponseEntity<String> entity = null;
		
		String certiCode = makeCertiCode();
		session.setAttribute("certiCode", certiCode);
		
		// 인증코드를 세션에 임시적으로 저장		
		EmailDTO dto = new EmailDTO("H중고마켓", "kyung2643@naver.com", hmal_email, "H중고마켓 회원가입인증메일", "회원가입 인증코드: " + certiCode);
		
		// 메일내용을 구성하는 클래스
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			// 받는 사람 메일설정
			message.addRecipient(RecipientType.TO, new InternetAddress(hmal_email));
			// 보내는 사람 설정(메일, 이름)
			message.addFrom(new InternetAddress[] {new InternetAddress(dto.getSenderMail(), dto.getSenderName())});
			// 제목
			message.setSubject(dto.getMessage(), "utf-8");
			// 본문내용(인증코드)
			message.setText(dto.getMessage(), "utf-8");
			
			mailSender.send(message);
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		
		
		
		return entity;
	}
		
	// 메일인증요청확인
	@ResponseBody
	@GetMapping("/mailCertiConfirm")
	public ResponseEntity<String> MailCertiConfirm(@RequestParam("hCertiCode") String hCertiCode, HttpSession session){
		
		ResponseEntity<String> entity = null;
		
		String certiCode = (String) session.getAttribute("certiCode");
		
		if(certiCode.equals(hCertiCode)) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		
		return entity;
		
	}
	
	
	// 회원가입시 메일인증코드 생성
	private String makeCertiCode() {
		
		String certiCode = "";
		
		for(int i=0; i<6; i++) {
			certiCode += String.valueOf((int) (Math.random() * 9) + 1);
		}
		
		return certiCode;
	}
		
	// 2월11일 작업
	// 마이페이지, 회원수정, 비밀번호변경, 회원탈퇴
	@GetMapping(value = {"/mypage", "/alterUser", "/changePw", "/userOut"})
	public void alterUser(HttpSession session, Model model) {
		
		CustomerVO vo = (CustomerVO) session.getAttribute("loginStatus");
		
		String hmal_id = vo.getHmal_id();
		
		model.addAttribute(service.login(hmal_id));
	}
		
	// 2월11일 작업
	// 2월15일 작업
	// 회원수정 저장
	@PostMapping("/alterUser")
	public String alterUser(CustomerVO vo, HttpSession session, RedirectAttributes rttr) {
		
		log.info("회원수정정보: " + vo);  // "ori_hmal_pw"
		
		CustomerVO session_vo = (CustomerVO) session.getAttribute("loginStatus");
		
		service.alterUser(vo);
		
		return "redirect:/";
	}
	
	// 2월15일 작업
	// 회원삭제
	@ResponseBody
	@PostMapping("/userDelete")
	public ResponseEntity<String> userDelete(@RequestParam("hmal_pw") String hmal_pw, HttpSession session){
		
		ResponseEntity<String> entity = null;
		
		CustomerVO vo = (CustomerVO) session.getAttribute("loginStatus");
		
		String hmal_id = vo.getHmal_id();
		
		entity = new ResponseEntity<String>(String.valueOf(service.userDelete(hmal_id, hmal_pw, cryptPassEnc)), HttpStatus.OK);
		
		session.invalidate();
		
		return entity;
	}
		
		
	// 로그인 틀
	@GetMapping("/login")
	public void login() {
			
	}
		
	// 로그인
	@ResponseBody
	@PostMapping("/login")
	public ResponseEntity<String> login(@RequestParam("hmal_id") String hmal_id, @RequestParam("hmal_pw") String hmal_pw, HttpSession session) throws Exception{
		
		String result = "";
		ResponseEntity<String> entity = null;
		
		CustomerVO vo = service.login(hmal_id);
		
		if(vo == null) { // id가 존재안하는 의미.
			result = "idFail";			
		}else { // id가 존재하는 의미.
			
			if(cryptPassEnc.matches(hmal_pw, vo.getHmal_pw())) {
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
	@GetMapping("/logout")
	public String logout(HttpSession session, RedirectAttributes rttr) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 아이디 찾기 폼
	@GetMapping("/findId")
	public void findId() {
		
	}	
	
	// 아이디 찾기(이름과 핸드폰번호)
	@ResponseBody
	@PostMapping("/findId")
	public ResponseEntity<String> findId(@RequestParam("hmal_name") String hmal_name, @RequestParam("hmal_phone") String hmal_phone){
				
		ResponseEntity<String> entity = null;
		
		String vo = service.findId(hmal_name, hmal_phone);
		
		if(vo != null) {
			entity = new ResponseEntity<String>(vo, HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("no", HttpStatus.OK);
		}	
		
		return entity;
	}
	
	// 아이디찾기 불러오기폼
	@GetMapping("/findIdAction")
	public void findIdAction(@ModelAttribute("hmal_id") String hmal_id) {
		
	}
	
	// 비밀번호 찾기 폼
	@GetMapping("/findPw")
	public void findPwReq() {
		
	}
	
	// 2월11일 작업
	// 비밀번호 찾기(이메일)
	@ResponseBody
	@PostMapping("/findPw")
	public ResponseEntity<String> findPwAction(@RequestParam("hmal_name") String hmal_name, @RequestParam("hmal_email") String hmal_email){
		
		ResponseEntity<String> entity = null;
		
		if(!StringUtils.isEmpty(service.findPwByEmail(hmal_name, hmal_email))) {
			
			String tempPw = makeCertiCode();
			
			EmailDTO dto = new EmailDTO("H중고마켓", "kyung2643@gmail.com", hmal_email, "H중고마켓 임시비밀번호", "임시비밀번호: " + tempPw);
			
			MimeMessage message = mailSender.createMimeMessage();
			
			try {
				// 받는 사람 메일설정
				message.addRecipient(RecipientType.TO, new InternetAddress(hmal_email));
				// 보내는 사람설정(이메일,이름)
				message.addFrom(new InternetAddress[] {new InternetAddress(dto.getSenderMail(), dto.getSenderName())});
				// 제목
				message.setSubject(dto.getSubject(), "utf-8");
				// 본문내용(인증코드)
				message.setText(dto.getMessage(), "utf-8");
				
				mailSender.send(message);
				
				String encryptPw = cryptPassEnc.encode(tempPw);
				service.alterPw(hmal_email, encryptPw);
				
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
				
			}catch(Exception ex){
				ex.printStackTrace();
				
				entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
			}
			
			
		}else {
			
			entity = new ResponseEntity<String>("noMail", HttpStatus.OK);
		}
		
		return entity;
	}
	
	// 2월11일 작업
	// 비밀번호 변경
	@ResponseBody
	@PostMapping("/alterPw")
	public ResponseEntity<String> alterPw(@RequestParam("ori_hmal_pw") String ori_hmal_pw, @RequestParam("alter_hmal_pw") String alter_hmal_pw, HttpSession session){
		
		ResponseEntity<String> entity = null;
		
		CustomerVO vo = (CustomerVO) session.getAttribute("loginStatus");
		
		String hmal_id = vo.getHmal_id();
		
		log.info("아이디: " + hmal_id);
		log.info("현재 비밀번호: " + ori_hmal_pw);
		log.info("변경 비밀번호: " + alter_hmal_pw);
		
		String result = service.presentPwConfirm(hmal_id, cryptPassEnc, ori_hmal_pw, cryptPassEnc.encode(alter_hmal_pw));
		
		entity = new ResponseEntity<String>(result, HttpStatus.OK);		
		
		
		return entity;
	}
		
	
}
