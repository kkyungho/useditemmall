package com.hoya.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoya.domain.AdminVO;
import com.hoya.mapper.AdminMapper;

import lombok.Setter;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Setter(onMethod_= @Autowired)
	private AdminMapper mapper;

	@Override
	public AdminVO adminLogin(String ad_userid) {
		
		return mapper.adminLogin(ad_userid);
	}

	@Override
	public int adminJoin(AdminVO vo) {
		
		return mapper.adminJoin(vo);
	}

	@Override
	public String reID(String ad_userid) {
		
		return mapper.reID(ad_userid);
	}

}
