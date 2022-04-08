package com.hoya.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.hoya.domain.Criteria;
import com.hoya.domain.CustomerVO;
import com.hoya.domain.PageDTO;
import com.hoya.domain.ReviewVO;
import com.hoya.service.ReviewService;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/review/*")
@Controller
public class ReviewController {
	
	@Resource(name = "uploadFolder")
	String uploadFolder;

	@Autowired
	private ReviewService service;	
	
	// 상품문의목록, 페이징구현정보
	@GetMapping("/productReview")
	public void productReview(@ModelAttribute("cri") Criteria cri, @RequestParam("pro_num") Integer pro_num, Model model) {
				
		log.info("productReview");
		
		cri.setAmount(4);		
		
		int total = service.getTotalCount(pro_num);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));	
		model.addAttribute("reviewVO", service.getReviewListWithPaging(cri, pro_num));
	}
		
	
	// 상품문의등록
	@ResponseBody
	@PostMapping("/productReviewWrite")
	public ResponseEntity<String> productReviewWrite(ReviewVO vo, HttpSession session){
		
		log.info("상품문의: " + vo);
		
		// 아이디 가져오기
		vo.setHmal_id(((CustomerVO) session.getAttribute("loginStatus")).getHmal_id());		
				
		ResponseEntity<String> entity = null;
		
		try {
			service.reviewInsert(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception ex) {
			ex.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}			
		
		return entity;
	}
	
	// 상품문의수정
	@ResponseBody
	@PostMapping("/productReviewEdit")
	public ResponseEntity<String> productReviewEdit(ReviewVO vo, HttpSession session){
		
		log.info("상품문의: " + vo);
		
		// 아이디 가져오기
		vo.setHmal_id(((CustomerVO) session.getAttribute("loginStatus")).getHmal_id());		
				
		ResponseEntity<String> entity = null;
		
		try {
			service.reviewEdit(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception ex) {
			ex.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}		
		
		return entity;
	}
	
	// 상품문의삭제
	@ResponseBody
	@PostMapping("/productReviewDel")
	public ResponseEntity<String> productReviewDel(Integer rew_num){
					
		ResponseEntity<String> entity = null;				
		
		try {
			service.reviewDel(rew_num);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception ex) {
			ex.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}		
		
		return entity;
	}
}
