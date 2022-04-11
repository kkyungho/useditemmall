package com.hoya.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	// 주문상세
	@RequestMapping("/orderInfo")
	public void orderInfo(String type, @RequestParam(value = "pro_num", required = false) Integer pro_num, HttpSession session, Model model) {
		
		String hmal_id = ((CustomerVO) session.getAttribute("loginStatus")).getHmal_id();
		
		List<OrderInfoVO> list = null;
		
		if(type.equals("direct")) {
			// 상품1개
			list = oService.directOrderInfo(pro_num); // 상품상세 바로구매	
			
		}else if(type.equals("cart_order")) {
			list = oService.directOrderInfo(pro_num);  // 찜목록 구매
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
	public String orderAction(OrderVO order, OrderDetailList orderDetail, HttpSession session, RedirectAttributes rttr) {
		
		order.setHmal_id(((CustomerVO) session.getAttribute("loginStatus")).getHmal_id());
		
		log.info("주문정보: " + order);
		log.info("주문상세정보: " + orderDetail);
		
		oService.orderInsert(order, orderDetail);
		
		// 예> 주문번호:100 [상품 5 건]
		String pro_name = String.format("주문번호:%d [상품 %d 건]", order.getOrd_code(), orderDetail.getOrderDetailList().size());
		
		// 카카오페이 결제시 필요한 정보.
		rttr.addAttribute("ord_name", order.getOrd_name()); // 주문자
		rttr.addAttribute("ord_price", order.getOrd_price()); // 주문가격
		rttr.addAttribute("ord_zipcode", order.getOrd_zipcode()); // 주문자 우편번호
		rttr.addAttribute("pro_name", pro_name ); // 상품명
		
		return "redirect:/order/orderPayView";
	}
	
	@GetMapping("/orderPayView")
	public void orderPayView(@ModelAttribute("order") OrderVO order, @ModelAttribute("pro_name") String pro_name) {
		
	}
	
}
