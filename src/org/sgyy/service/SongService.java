package org.sgyy.service;

import java.util.List;

import org.sgyy.domain.Song;

public interface SongService {
	//歌曲推荐
	List<Song> getAll();
	//最新歌曲
	List<Song> getNew();
	//热门歌曲
	List<Song> getHot();
	//搜索歌曲
	List<Song> getResult(String content);
	//搜索页分页
	List<Song> getSongByPage(String content, Integer startRow,Integer pageSize);
	//播放页面
	Song getPlay(Integer sid);
	//查看是否有这个sid的歌，如果没有，就默认播放sid为1的歌
	Song isStates(Integer sid);
	//我的收藏
	List<Song> getLikeNum(Integer uid);
	List<Song> getLikeList(Integer uid, Integer startRow,Integer pageSize);
	//我的收藏删除
	Song del(Integer sid);
	//我的收藏添加
	void collect(String sid, String uid);
	//查看我的收藏是否重复添加
	String isCollect(String sid,String uid);
	
	
	List<Song> findAllSongByPage(Integer startRow, Integer pageSize);
	List<Song> findAllSong();
	Song removeMusic(Integer sid);
	void uploadMusic(Song song);
	void hotUp(Integer sid);
	

}
