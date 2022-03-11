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

}
