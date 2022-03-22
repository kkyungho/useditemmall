package com.hoya.web;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hoya.domain.CartVO;
import com.hoya.domain.CustomerVO;
import com.hoya.service.CartService;

@Controller
public class CartController {

	@Resource(name = "uploadFolder")
	String uploadFolder;
	
	@Inject
	private CartService service;
	
	// 로그인 인증된 경우에만 찜하기 가능
	@ResponseBody
	@PostMapping("/product/mystore/cartAdd")
	public ResponseEntity<String> cartAdd(Integer pro_num, HttpSession session) {
		
		ResponseEntity<String> entity = null;
		
		CartVO vo = new CartVO();
		vo.setPro_num(pro_num);		
		
		// 인증된 사용자 정보
		vo.setHmal_id(((CustomerVO) session.getAttribute("loginStatus")).getHmal_id());
		
		try {
			// 인증된 상태가 풀렸을때.(세션이 소멸시)\
			service.cartAdd(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch (Exception e) {			
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
