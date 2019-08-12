package org.sgyy.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.sgyy.domain.Song;
import org.sgyy.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class SongController {
	
	@Autowired
	@Qualifier("songService")
	private SongService songService;
	//首页
	@RequestMapping(value="/main")
	public String main(Model model) {
		List<Song> song_list = songService.getAll();
		List<Song> song_new = songService.getNew();
		List<Song> song_hot = songService.getHot();
		model.addAttribute("song_list", song_list);
		model.addAttribute("song_new", song_new);
		model.addAttribute("song_hot", song_hot);
		return "main";
	}
	//搜索
//	@RequestMapping(value="/find")
//	public ModelAndView find(
//			ModelMap model,
//			String content,
//			ModelAndView mv) {
//		List<Song> song_list = songService.getResult("%"+content+"%");
//		model.addAttribute("song_list", song_list);
//		
//		return mv;
//	}
	//搜索和分页
	@RequestMapping("/listUser.do")
	public ModelAndView listUser(String page,String content,Model model,ModelAndView mv){    
		//每页显示的条数
		int pageSize = 10;
		List<Song> song = songService.getResult("%"+content+"%");
		//查到的总用户数
		model.addAttribute("songNum", song.size());
		model.addAttribute("content", content);
		//总页数
		int pageTimes;
		if(song.size()%pageSize == 0){
			pageTimes = song.size()/pageSize;
		}else{
			pageTimes = song.size()/pageSize + 1;
		}
		model.addAttribute("pageTimes", pageTimes);
		//页面初始的时候page没有值
		if(null == page || "" == page){
			page = "1";
		}
		//每页开始的第几条记录            
		int startRow = (Integer.parseInt(page)-1) * pageSize;
		List<Song> song_list = songService.getSongByPage("%"+content+"%", startRow, pageSize);

		model.addAttribute("currentPage", Integer.parseInt(page));
		model.addAttribute("song_list", song_list);
		mv.setViewName("find");
		return mv;
	}
	//播放页面
	@RequestMapping(value="/play")
	public ModelAndView play(
			Integer sid,
			ModelAndView mv,
			HttpSession session) {
		//查看是否有这个sid的歌，如果没有，就默认播放sid为1的歌
		Song s = songService.isStates(sid);
		if(s == null) {
			sid = 1;
		}
		Song song = songService.getPlay(sid);
		songService.hotUp(sid);
		session.setAttribute("song", song);
		mv.setView(new RedirectView("listen?sid="+sid));
		return mv;
	}
	
	//我的收藏页面
	@RequestMapping(value="/person")
	public ModelAndView person(
			HttpSession session,
			String page,
			Integer uid,
			Model model,
			ModelAndView mv) {
		//每页显示的条数
		int pageSize = 15;
		if(session.getAttribute("user") == null) {
			mv.setViewName("loginForm");
		}else {
			List<Song> song = songService.getLikeNum(uid);
			model.addAttribute("songNum", song.size());
			model.addAttribute("uid", uid);
			//总页数
			int pageTimes;
			if(song.size()%pageSize == 0){
				pageTimes = song.size()/pageSize;
			}else{
				pageTimes = song.size()/pageSize + 1;
			}
			model.addAttribute("pageTimes", pageTimes);
			//页面初始的时候page没有值
			if(null == page || "" == page){
				page = "1";
			}
			//每页开始的第几条记录            
			int startRow = (Integer.parseInt(page)-1) * pageSize;
			List<Song> song_list = songService.getLikeList(uid, startRow, pageSize);
			model.addAttribute("currentPage", Integer.parseInt(page));
			model.addAttribute("song_list", song_list);
			mv.setViewName("person");
		}
		return mv;
	}
//	@RequestMapping(value="/person")
//	public String person(
//			HttpSession session,
//			Integer uid,
//			Model model) {
//		if(session.getAttribute("user") == null) {
//			return "loginForm";
//		}else {
//			List<Song> song_list = songService.getLike(uid);
//			model.addAttribute("song_list", song_list);
//			return "person";
//		}
//	}
	//删除我的收藏
	@RequestMapping(value="/del")
	public String del(Integer sid) {
		songService.del(sid);
		return "person";
	}
	//添加收藏
//	@RequestMapping(value="/collect")
//	public ModelAndView collect(
//			Integer sid,
//			Integer uid,
//			ModelAndView mv) {
//		//查看我的收藏是否重复添加
//		if(songService.isCollect(sid, uid) == null) {
//			songService.collect(sid,uid);
//		}
//		return mv;
//	}
	@RequestMapping(value = "/collect.action", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String collect(HttpServletRequest request) {
		String sid = request.getParameter("sid");
		String uid = request.getParameter("uid");
		String reslut = "收藏成功！";
		if(songService.isCollect(sid, uid) == null) {
			songService.collect(sid,uid);
			reslut = "收藏失败！";
		}
		return reslut;
	}
	
	@RequestMapping(value="/admin/manageMusic")
	public ModelAndView manageMusic(String page,
			Model model,
			ModelAndView mv) {
		//每页显示的条数
		int pageSize = 6;
		//查到的总用户数
		List<Song> song_num = songService.findAllSong();
		model.addAttribute("songNum", song_num.size());
		//总页数
		int pageTimes;
		if(song_num.size()%pageSize == 0){
			pageTimes = song_num.size()/pageSize;
		}else{
			pageTimes = song_num.size()/pageSize + 1;
		}
		model.addAttribute("pageTimes", pageTimes);
		//页面初始的时候page没有值
		if(null == page || "" == page){
			page = "1";
		}
		//每页开始的第几条记录            
		int startRow = (Integer.parseInt(page)-1) * pageSize;
		List<Song> song_list = songService.findAllSongByPage(startRow, pageSize);
		
		model.addAttribute("currentPage", Integer.parseInt(page));
		model.addAttribute("song_list", song_list);
		mv.setViewName("/admin/manageMusic");
		return mv;
	}
	//删除音乐
	@RequestMapping(value="admin/removeMusic")
	public String removeMusic(Integer sid) {
		songService.removeMusic(sid);
		return "manageMusic";
	}
	//上传音乐
	@RequestMapping(value="/admin/uploadMusic")
	public ModelAndView uploadMusic(
			@ModelAttribute Song song,
			ModelAndView mv,
			HttpSession session,
			@RequestParam("file") MultipartFile file,
			HttpServletRequest request) throws Exception {
		if(!file.isEmpty()) {
			// 上传文件路径
			String path = "D:/Personal/Desktop/end/music/WebContent/song";
			// 上传文件名
			String filename = file.getOriginalFilename();
		    File filepath = new File(path,filename);
			// 判断路径是否存在，如果不存在就创建一个
		    if (!filepath.getParentFile().exists()) { 
	        	filepath.getParentFile().mkdirs();
	        }
		    // 将上传文件保存到一个目标文件当中
		 	file.transferTo(new File(path+File.separator+ filename));
		 	System.out.println("上传文件路径：" + (path+File.separator+ filename));
		}
		songService.uploadMusic(song);
		mv.setView(new RedirectView("/music/admin/manageMusic"));
		return mv;
	}
}
