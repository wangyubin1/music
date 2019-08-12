package org.sgyy.service.impl;

import java.util.List;

import org.sgyy.domain.Song;
import org.sgyy.mapper.SongMapper;
import org.sgyy.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service("songService")
public class SongServiceImpl implements SongService{
	
	@Autowired
	private SongMapper songMapper;
	//首页随机推荐
	@Override
	public List<Song> getAll(){
		return songMapper.findAll();
	}
	//首页新歌推荐
	@Override
	public List<Song> getNew(){
		return songMapper.findNew();
	}
	//首页热歌推荐
	@Override
	public List<Song> getHot(){
		return songMapper.findHot();
	}
	//搜索页
	@Override
	public List<Song> getResult(String content){
		return songMapper.search(content);
	}
	//搜索页分页
	@Override
	public List<Song> getSongByPage(String content, Integer startRow,Integer pageSize){
		return songMapper.getSongByPage(content, startRow, pageSize);
	}
	//播放页面
	@Override
	public Song getPlay(Integer sid){
		return songMapper.play(sid);
	}
	//查看是否有这个sid的歌，如果没有，就默认播放sid为1的歌
	@Override
	public Song isStates(Integer sid) {
		return songMapper.isStates(sid);
	}
	//我的收藏
	@Override
	public List<Song> getLikeNum(Integer uid) {
		return songMapper.likeNum(uid);
	}
	@Override
	public List<Song> getLikeList(Integer uid, Integer startRow,Integer pageSize) {
		return songMapper.likeList(uid, startRow, pageSize);
	}
	//我的收藏删除
	@Override 
	public Song del(Integer sid) {
		return songMapper.del(sid);
	}
	//我的收藏添加
	@Override 
	public void collect(String sid,String uid) {
		songMapper.collect(sid,uid);
	}
	//查看我的收藏是否重复添加
	@Override 
	public String isCollect(String sid,String uid) {
		return songMapper.isCollect(sid,uid);
	}
	
	@Override
	public void hotUp(Integer sid){
		songMapper.hotUp(sid);
	}
	//后台
	@Override
	public List<Song> findAllSongByPage(Integer startRow,Integer pageSize) {
		// TODO Auto-generated method stub
		return songMapper.findAllSongByPage(startRow, pageSize);
	}
	@Override
	public List<Song> findAllSong() {
		// TODO Auto-generated method stub
		return songMapper.findAllSong();
	}

	//音乐删除
	@Override 
	public Song removeMusic(Integer sid) {
		return songMapper.removeMusic(sid);
	}
	
	//上传音乐
	@Override 
	public void uploadMusic(Song song) {
		songMapper.uploadMusic(song);
	}
}
