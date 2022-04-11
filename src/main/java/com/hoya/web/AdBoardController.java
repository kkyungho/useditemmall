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
import com.hoya.domain.PageDTO;
import com.hoya.service.AdBoardService;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Log
@Controller
@AllArgsConstructor
@RequestMapping("/admin/board/*")
public class AdBoardController {
	
	@Inject	
	private AdBoardService service;
	
	// 게시물목록
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		
		List<BoardVO> list = service.getListWithPaging(cri);
		model.addAttribute("list", list);
		
		int total = service.getTotalCount(cri);
		
		log.info("total: " + total);
		
		PageDTO pageDTO = new PageDTO(cri, total);
		model.addAttribute("pageMaker", pageDTO);
		
	}
	
	// 게시물 읽어오기
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("brd_bno")Long brd_bno, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("get..." + brd_bno);
		
		BoardVO board = service.get(brd_bno);
		model.addAttribute("board", board);
	}
	
	// 문의하기
	@GetMapping("/answer")
	public void answer() {
		
	}

}
