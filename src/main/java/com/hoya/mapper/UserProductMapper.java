package com.hoya.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hoya.domain.CategoryVO;
import com.hoya.domain.Criteria;
import com.hoya.domain.ProductVO;

public interface UserProductMapper {
	
	public int productInsert(ProductVO vo);
	
	public List<CategoryVO> mainCategory();
	
	public List<CategoryVO> subCategory(Integer cate_code);
	
	public List<ProductVO> getListWithPaging(@Param("cate_code")Integer cate_code, @Param("cri") Criteria cri);
	
	public int getTotalCount(@Param("cate_code") Integer cate_code);
	
	public ProductVO productDetail(Integer pro_num);
	
	public List<ProductVO> productListByCategory(Integer cate_code);
	
	// 내 로그인 아이디에 따른 업로드한 상품 리스트 가져오기
	public List<ProductVO> getMystoreList(@Param("hmal_id") String hmal_id, @Param("cri") Criteria cri);
	
	// 내 로그인 아이디에 따른 업로드한 상품 리스트 가져오기
	public String getMystoreCount(@Param("hmal_id") String hmal_id);

}
