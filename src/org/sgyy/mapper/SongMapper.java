package org.sgyy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.sgyy.domain.Song;

public interface SongMapper {
	//歌曲推荐
	@Select("select * from song where sid >= ((select max(sid) from song)-(select min(sid) from "
			 + "song)) * rand() + (select min(sid) from song) limit 10;")
	List<Song> findAll();
	//最新歌曲
	@Select("select * from song order by sid desc limit 5")
	List<Song> findNew();
	//热听歌曲
	@Select("select * from song order by snum desc limit 5")
	List<Song> findHot();
	//搜索歌曲
	@Select("select * from song where sname like #{content} or sauthor like #{content}")
	List<Song> search(@Param("content")String content);
	//搜索页分页
	@Select("select * from song where sname like #{content} or sauthor like #{content} limit #{startRow}, #{pageSize}")
	List<Song> getSongByPage(@Param("content")String content,
			@Param("startRow")Integer startRow,
			@Param("pageSize")Integer pageSize);
	//播放页面
	@Select("select * from song where sid = #{sid}")
	Song play(@Param("sid")Integer sid);
	//查看是否有这个sid的歌
	@Select("select sid from song where sid = #{sid}")
	Song isStates(@Param("sid")Integer sid);
	//我的收藏
	@Select("select * from song s,likes l where l.uid = #{uid} and l.sid = s.sid order by ltime asc")
	List<Song> likeNum(@Param("uid")Integer uid);
	@Select("select * from song s,likes l where l.uid = #{uid} and l.sid = s.sid order by ltime asc limit #{startRow}, #{pageSize}")
	List<Song> likeList(@Param("uid")Integer uid,
			@Param("startRow")Integer startRow,
			@Param("pageSize")Integer pageSize);
	//我的收藏删除
	@Delete("delete from likes where sid = #{sid}")
	Song del(@Param("sid")Integer sid);
	//我的收藏添加
	@Insert("insert into likes(sid,uid) values(#{sid},#{uid})")
	void collect(@Param("sid")String sid,@Param("uid")String uid);
	//查看我的收藏是否重复添加
	@Select("select * from likes where sid = #{sid} and uid = #{uid}")
	String isCollect(@Param("sid")String sid,@Param("uid")String uid);
	
	@Update("update song set snum = snum+1 where sid = #{sid}")
	void hotUp(@Param("sid")Integer sid);
	
	//后台
	@Select("select * from song order by sid asc limit #{startRow}, #{pageSize}")
	List<Song> findAllSongByPage(
			@Param("startRow")Integer startRow,
			@Param("pageSize")Integer pageSize);
	@Select("select * from song")
	List<Song> findAllSong();
	
	@Delete("delete from song where sid = #{sid}")
	Song removeMusic(@Param("sid")Integer sid);
	
	@Insert("insert into song(sname,sauthor) values(#{sname},#{sauthor})")
	void uploadMusic(Song Song);
}
