package com.hoya.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hoya.domain.CustomerVO;
import com.hoya.domain.OrderDetailList;
import com.hoya.domain.OrderInfoVO;
import com.hoya.domain.OrderVO;
import com.hoya.service.OrderService;
import com.hoya.util.UploadFileUtils;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/order/*")
@Controller
public class OrderController {

	@Resource(name = "uploadFolder")
	String uploadFolder;
	
	@Autowired
	private OrderService oService;
	
	@RequestMapping("/orderInfo")
	public void orderInfo(String type, @RequestParam(value = "pro_num", required = false) Integer pro_num, @RequestParam(value = "pro_amount", required = false) Integer pro_amount, HttpSession session, Model model) {
		
		String hmal_id = ((CustomerVO) session.getAttribute("loginStatus")).getHmal_id();
		
		List<OrderInfoVO> list = null;
		
		if(type.equals("direct")) {
			// 상품1개
			list = oService.directOrderInfo(pro_num, pro_amount); // 1)메인에서 바로구매, 2)상품상세 바로구매
			(list.get(0)).setCart_amount(pro_amount);
		}else if(type.equals("cart_order")) {
			list = oService.orderInfo(hmal_id);  // 장바구니에서 구매
		}
		
		
		// 슬래시를 역슬래시로 바꾸는 구문.
		for(int i=0; i<list.size(); i++) {
			OrderInfoVO vo = list.get(i);
			vo.setPro_uploadpath(vo.getPro_uploadpath().replace("\\", "/"));
		}
		
		// 주문내역정보
		model.addAttribute("orderInfo", list);
		
	}
	
	//상품리스트의 이미지출력(썸네일)
	@ResponseBody
	@GetMapping("/displayFile")  // 클라이언트에서 보내는 특수문자중에 역슬래시 데이타를 스프링에서 지원하지 않는다. 
	public ResponseEntity<byte[]> displayFile(String uploadPath, String fileName) {
		
		ResponseEntity<byte[]> entity = null;
		
		entity = UploadFileUtils.getFileByte(uploadFolder, uploadPath, fileName );
		
		return entity;
	}
	
	@PostMapping("/orderAction")
	public String orderAction(OrderVO order, OrderDetailList orderDetail, HttpSession session) {
		
		order.setHmal_id(((CustomerVO) session.getAttribute("loginStatus")).getHmal_id());
		
		log.info("주문정보: " + order);
		log.info("주문상세정보: " + orderDetail);
		
		oService.orderInsert(order, orderDetail);
		
		return "redirect:/";
	}
	
}
