package com.hoya.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoya.domain.BoardVO;
import com.hoya.domain.Criteria;
import com.hoya.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_= @Autowired)
	private BoardMapper mapper;
	
	@Override
	public void insert(BoardVO board) {
		
		log.info("insert..." + board);	
		
		mapper.insertSelectKey(board);
		
		log.info("bno: " + board.getBrd_bno());
		
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}		
		
	}

	@Override
	public List<BoardVO> getList() {
		
		return mapper.getList();
	}

	@Override
	public List<BoardVO> getListWithPaging(Criteria cri) {
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		
		return mapper.getTotalCount(cri);
	}

	@Override
	public BoardVO get(Long brd_bno) {
		
		return mapper.get(brd_bno);
	}

	@Override
	public int modify(BoardVO board) {
		
		return mapper.modify(board);
	}

}
