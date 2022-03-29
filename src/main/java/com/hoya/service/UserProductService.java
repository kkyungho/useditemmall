package com.hoya.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.hoya.domain.CategoryVO;
import com.hoya.domain.Criteria;
import com.hoya.domain.ProductVO;

public interface UserProductService {
	
	public int productInsert(ProductVO vo);
	
	public List<CategoryVO> mainCategory();
	
	public List<CategoryVO> subCategory(Integer cate_code);
	
	public List<ProductVO> getListWithPaging(@Param("cate_code")Integer cate_code, @Param("cri") Criteria cri);
	
	public int getTotalCount(@Param("cate_code") Integer cate_code);
	
	public ProductVO productDetail(Integer pro_num);
	
	public List<ProductVO> productListByCategory(Integer cate_code);
	
	// 아이디에 따른 등록 게시물 리스트
	public List<ProductVO> myproduct(@Param("hmal_id")String hmal_id, @Param("cri") Criteria cri);
	
	// 상품수정
	public ProductVO productModify(Integer pro_num);
	
	// 상품수정저장
	public int productModifyOk(ProductVO vo);
	
	// 상품삭제
	public int productDelete(Integer pro_num);

}
