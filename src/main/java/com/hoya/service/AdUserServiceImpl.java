package com.hoya.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoya.domain.Criteria;
import com.hoya.domain.CustomerVO;
import com.hoya.mapper.AdUserMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AdUserServiceImpl implements AdUserService {
	
	@Setter(onMethod_= @Autowired)	
	private AdUserMapper mapper;

	@Override
	public List<CustomerVO> getList() {
		
		return mapper.getList();
	}

	@Override
	public List<CustomerVO> getListWithPaging(String hmal_id, Criteria cri) {
		
		return mapper.getListWithPaging(hmal_id, cri);
	}

	@Override
	public int getTotalCount(String hmal_id) {
		
		return mapper.getTotalCount(hmal_id);
	}

	@Override
	public CustomerVO get(String hmal_id) {
		
		return mapper.get(hmal_id);
	}
	
	

}
