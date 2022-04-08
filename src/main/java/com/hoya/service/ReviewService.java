package com.hoya.service;

import java.util.List;

import com.hoya.domain.Criteria;
import com.hoya.domain.ReviewVO;

public interface ReviewService {	

	// 상품문의보여주기
	public List<ReviewVO> getReviewListWithPaging(Criteria cri, Integer pro_num);
	
	// 상품문의개수
	public int getTotalCount(Integer pro_num);
	
	// 상품문의쓰기
	public void reviewInsert(ReviewVO vo);
	
	// 상품문의수정
	public void reviewEdit(ReviewVO vo);
	
	// 상품문의삭제
	public void reviewDel(Integer rew_num);
}
