package org.sgyy.service.impl;

import java.util.List;

import org.sgyy.domain.User;
import org.sgyy.mapper.UserMapper;
import org.sgyy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * User服务层接口实现类
 * @Service("userService")用于将当前类注释为一个Spring的bean，名为userService
 * */
@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service("userService")
public class UserServiceImpl implements UserService {
	
	/**
	 * 自动注入UserMapper
	 * */
	@Autowired
	private UserMapper userMapper;

	/**
	 * UserService接口login方法实现
	 * @see { UserService }
	 * */
	@Transactional(readOnly=true)
	@Override
	public User login(String uname, String upwd) {
		return userMapper.findWithUnameAndUpwd(uname, upwd);
	}
	
	@Override
	public void register(User user) {
		// TODO Auto-generated method stub
		userMapper.addUser(user);
	}
	
	@Override
	public User findByUserName(String uname) {
		// TODO Auto-generated method stub
		return userMapper.findByUserName(uname);
	}
	
	@Override
	public List<User> comment(Integer sid) {
		return userMapper.comment(sid);
	}
	
	@Override
	public void updateUser(User user) {
		userMapper.updateUser(user);
	}
	
	@Override
	public User findByUserNameAndId(String uname, Integer uid) {
		// TODO Auto-generated method stub
		return userMapper.findByUserNameAndId(uname, uid);
	}
	
	@Override
	public User updatePic(String url, Integer uid) {
		// TODO Auto-generated method stub
		return userMapper.updatePic(url, uid);
	}
	
	@Override
	public void send(Integer uid, Integer sid, String comment) {
		// TODO Auto-generated method stub
		userMapper.send(uid, sid, comment);
	}
	
	//后台
	@Override
	public List<User> findAllUserByPage(Integer startRow,Integer pageSize) {
		// TODO Auto-generated method stub
		return userMapper.findAllUserByPage(startRow, pageSize);
	}
	@Override
	public List<User> findAllUser() {
		// TODO Auto-generated method stub
		return userMapper.findAllUser();
	}
	@Override
	public User removeUser(Integer uid) {
		// TODO Auto-generated method stub
		return userMapper.removeUser(uid);
	}
}

