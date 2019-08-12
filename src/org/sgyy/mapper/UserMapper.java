package org.sgyy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.sgyy.domain.User;

public interface UserMapper {
	
	@Select("select * from user where uname = #{uname} and upwd = #{upwd}")
	User findWithUnameAndUpwd(@Param("uname")String uname,
			@Param("upwd") String upwd);
	
	@Insert("insert into user(uname,upwd,sex,email,tel) "
			+ "values(#{uname},#{upwd},#{sex},#{email},#{tel})")
	void addUser(User user);

	@Select("select * from user where uname = #{uname}")
	User findByUserName(@Param("uname")String uname);
	
	//评论
	@Select("select * from user u,comment c where c.sid = #{sid} and c.uid = u.uid order by c.ctime asc")
	List<User> comment(@Param("sid")Integer sid);
	//修改个人信息
	@Update("update user set uname = #{uname}, upwd = #{upwd}, sex = #{sex},"
			+ "email = #{email}, tel = #{tel}, url = #{url} where uid = #{uid}")
	void updateUser(User user);
	
	@Select("select * from user where uname = #{uname} and uid != #{uid}")
	User findByUserNameAndId(@Param("uname")String uname, @Param("uid")Integer uid);
	//修改头像
	@Update("update user set url = #{url} where uid = #{uid}")
	User updatePic(@Param("url")String url, @Param("uid")Integer uid);
	//评论
	@Insert("insert into comment(uid,sid,comment) "
			+ "values(#{uid},#{sid},#{comment})")
	void send(
			@Param("uid")Integer uid,
			@Param("sid")Integer sid,
			@Param("comment")String comment);
	
	//后台
	@Select("select * from user order by uid asc limit #{startRow}, #{pageSize}")
	List<User> findAllUserByPage(
			@Param("startRow")Integer startRow,
			@Param("pageSize")Integer pageSize);
	@Select("select * from user")
	List<User> findAllUser();
	
	@Delete("delete from user where uid = #{uid}")
	User removeUser(@Param("uid")Integer uid);
}

