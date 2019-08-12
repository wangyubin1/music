package org.sgyy.service;

import java.util.List;

import org.sgyy.domain.User;

/**
 * User服务层接口
 * */
public interface UserService {
	
	User login(String uname,String upwd);

	void register(User user);

	User findByUserName(String uname);
	
	List<User> comment(Integer sid);
	
	void updateUser(User user);
	
	User findByUserNameAndId(String uname, Integer uid);
	
	User updatePic(String url, Integer uid);
	
	void send(Integer uid, Integer sid, String comment);
	
	//后台
	List<User> findAllUserByPage(Integer startRow,Integer pageSize);
	List<User> findAllUser();
	User removeUser(Integer user);

}

