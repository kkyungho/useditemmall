package com.hoya.web;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hoya.domain.BoardVO;
import com.hoya.domain.Criteria;
import com.hoya.domain.PageDTO;
import com.hoya.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	@Inject	
	private BoardService service;
	
	// 게시판 글쓰기 폼
	@GetMapping("/insert")
	public void insert() {
		
	}
	
	// 게시판 글쓰기 저장. 
	@PostMapping("/insert")
	public String insert(BoardVO board, RedirectAttributes rttr) {
		
		log.info("BoardVO..." + board);
		
		if(board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		
		service.insert(board);
		
		return "redirect:/board/list";
	}
	
	// 게시물 목록
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		
		cri.setAmount(5);
		
		log.info("list: " + cri);
		
		List<BoardVO> list = service.getListWithPaging(cri);
		model.addAttribute("list", list);
		
		int total = service.getTotalCount(cri);
		
		log.info("total:" + total);
		
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
	
	// 게시물 수정 저장
	@PostMapping("/modify")
	public String modify(BoardVO board, Criteria cri, RedirectAttributes rttr) {
		
		service.modify(board);
		
		return "redirect:/board/list" + cri.getListLink();
	}
	
	// 게시물 삭제
	@PostMapping("/delete")
	public String delete(@RequestParam("brd_bno") Long brd_bno, Criteria cri, RedirectAttributes rttr) {
		
		service.delete(brd_bno);
		
		return "redirect:/board/list" + cri.getListLink();
	}

}
