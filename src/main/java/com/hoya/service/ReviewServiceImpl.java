package com.hoya.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoya.domain.Criteria;
import com.hoya.domain.ReviewVO;
import com.hoya.mapper.ReviewMapper;

import lombok.Setter;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Setter(onMethod_= @Autowired)
	private ReviewMapper mapper;
		
	// 상품문의불러오기
	@Override
	public List<ReviewVO> getReviewListWithPaging(Criteria cri, Integer pro_num) {
		
		return mapper.getReviewListWithPaging(cri, pro_num);
	}

	// 상품문의개수
	@Override
	public int getTotalCount(Integer pro_num) {
		
		return mapper.getTotalCount(pro_num);
	}

	// 상품문의쓰기
	@Override
	public void reviewInsert(ReviewVO vo) {
		
		mapper.reviewInsert(vo);
	}

	// 상품문의수정
	@Override
	public void reviewEdit(ReviewVO vo) {
		
		mapper.reviewEdit(vo);
	}

	// 상품문의삭제
	@Override
	public void reviewDel(Integer rew_num) {
		
		mapper.reviewDel(rew_num);
	}

	

}
