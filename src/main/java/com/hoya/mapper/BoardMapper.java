package com.hoya.mapper;

import java.util.List;

import com.hoya.domain.Criteria;
import com.hoya.domain.BoardVO;

public interface BoardMapper {
	
	// 게시판 등록
	public void insert(BoardVO board); 
	
	// 게시판 등록(글번호 bno 필드값이 null상태)
	public Integer insertSelectKey(BoardVO board);
	
	public List<BoardVO> getList();
	
	// 검색기능이 포함된 필드(type, keyword)가 사용하게 됨.
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	// 검색기능 포함.
	public int getTotalCount(Criteria cri);
	
	// 게시물 불러오기
	public BoardVO get(Long brd_bno);
	
	// 게시판 수정하기
	public int modify(BoardVO board);
	
	// 게시판 삭제하기
	public int delete(Long brd_bno);
	
	

}
