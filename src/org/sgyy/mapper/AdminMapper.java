package org.sgyy.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.sgyy.domain.Admin;

public interface AdminMapper {
	
	@Select("select * from admin where aid = #{aid} and apwd = #{apwd}")
	Admin findWithUnameAndUpwd(@Param("aid")Integer aid,
			@Param("apwd") String apwd);

}
