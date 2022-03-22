package com.hoya.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoya.domain.CategoryVO;
import com.hoya.domain.Criteria;
import com.hoya.domain.ProductVO;
import com.hoya.mapper.UserProductMapper;

import lombok.Setter;

@Service
public class UserProductServiceImpl implements UserProductService {
	
	@Setter(onMethod_ = @Autowired)
	private UserProductMapper mapper;

	@Override
	public int productInsert(ProductVO vo) {
		
		return mapper.productInsert(vo);
	}

	@Override
	public List<CategoryVO> mainCategory() {
		
		return mapper.mainCategory();
	}

	@Override
	public List<CategoryVO> subCategory(Integer cate_code) {
		 
		return mapper.subCategory(cate_code);
	}

	@Override
	public List<ProductVO> getListWithPaging(Integer cate_code, Criteria cri) {
		
		return mapper.getListWithPaging(cate_code, cri);
	}

	@Override
	public int getTotalCount(Integer cate_code) {
		
		return mapper.getTotalCount(cate_code);
	}

	@Override
	public ProductVO productDetail(Integer pro_num) {
		
		return mapper.productDetail(pro_num);
	}

	@Override
	public List<ProductVO> productListByCategory(Integer cate_code) {
		
		return mapper.productListByCategory(cate_code);
	}

	@Override
	public List<ProductVO> mystore(String hmal_id, Criteria cri) {
		
		return mapper.mystore(hmal_id, cri);
	}

	@Override
	public ProductVO productModify(Integer pro_num) {
		// TODO Auto-generated method stub
		return mapper.productModify(pro_num);
	}

	@Override
	public int productModifyOk(ProductVO vo) {
		
		return mapper.productModifyOk(vo);
	}

	

	

}
