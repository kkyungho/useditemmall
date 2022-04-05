package com.hoya.web;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hoya.domain.CartListVO;
import com.hoya.domain.CartVO;
import com.hoya.domain.Criteria;
import com.hoya.domain.CustomerVO;
import com.hoya.domain.ProductVO;
import com.hoya.service.CartService;

@Controller
@RequestMapping("/cart/*")
public class CartController {

	@Resource(name = "uploadFolder")
	String uploadFolder;
	
	@Inject
	private CartService service;	
	
	// 로그인 인증된 경우에만 찜하기 가능
	@ResponseBody
	@PostMapping("/cartAdd")
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

	// 찜목록 불러오기.   @RequestParam(value="pro_num", required=false) Integer pro_num
	@GetMapping("/mycart") 
	public void mycart(@ModelAttribute("cri")Criteria cri, HttpSession session, Model model) {
		
		cri.setAmount(4);
		
		String hmal_id = ((CustomerVO) session.getAttribute("loginStatus")).getHmal_id();
				
		List<CartListVO> list = service.mycart(hmal_id);
		
		// 슬래시로 바꾸는 구문.
		for(int i=0; i<list.size(); i++) {
			CartListVO vo = list.get(i);
			vo.setPro_uploadpath(vo.getPro_uploadpath().replace("\\", "/"));
		}
		
		model.addAttribute("mycart", list);		
		
	}
	
	
	// 찜목록	  
	@GetMapping("/cartEmpty")
	public String cartEmpty(Integer cart_code) {
		
		service.cartEmpty(cart_code);		
		
		return "redirect:/cart/mycart";		
	}
}
