package com.hoya.mapper;

import java.util.List;

import com.hoya.domain.BoardVO;
import com.hoya.domain.Criteria;

public interface AdBoardMapper {

	// 게시판 목록 불러오기
	public List<BoardVO> getList();
	
	// 검색기능이 포함된 필드(type, keyword)가 사용하게 됨.
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	// 검색기능 포함.
	public int getTotalCount(Criteria cri);
	
	// 게시물 불러오기
	public BoardVO get(Long brd_bno);
}
