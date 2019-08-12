package org.sgyy.service.impl;

import org.sgyy.domain.Admin;
import org.sgyy.mapper.AdminMapper;
import org.sgyy.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminMapper adminMapper;
	
	@Transactional(readOnly=true)
	@Override
	public Admin login(Integer aid, String apwd) {
		return adminMapper.findWithUnameAndUpwd(aid, apwd);
	}
}
