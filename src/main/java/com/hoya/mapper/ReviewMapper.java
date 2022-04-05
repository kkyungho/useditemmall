package com.hoya.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hoya.domain.Criteria;
import com.hoya.domain.ReviewVO;

public interface ReviewMapper {

	// 상품문의보여주기
	public List<ReviewVO> getReviewListWithPaging(@Param("cri") Criteria cri, @Param("pro_num") Integer pro_num);
	
	// 상품문의개수
	public int getTotalCount(Integer pro_num);
	
	// 상품문의쓰기
	public void reviewInsert(ReviewVO vo);
	
	// 상품문의수정
	public void reviewEdit(ReviewVO vo);
	
	// 상품문의삭제
	public void reviewDel(Integer rew_num);
}
