package com.hoya.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoya.domain.BoardVO;
import com.hoya.domain.Criteria;
import com.hoya.mapper.AdBoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AdBoardServiceImpl implements AdBoardService {
	
	@Setter(onMethod_= @Autowired)
	private AdBoardMapper mapper;

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

}
