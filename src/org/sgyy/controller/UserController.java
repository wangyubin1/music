package org.sgyy.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.sgyy.domain.User;
import org.sgyy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

/**
 * 处理用户请求控制器
 * */
@Controller
public class UserController {
	
	/**
	 * 自动注入UserService
	 * */
	@Autowired
	@Qualifier("userService")
	private UserService userService;

	/**
	 * 处理/login请求
	 * */
	@PostMapping(value="/login")
	public ModelAndView login(
			String uname,
			String upwd,
			ModelAndView mv,
			HttpSession session){
		// 根据登录名和密码查找用户，判断用户登录
		User user = userService.login(uname, upwd);
		if(user != null){
			// 登录成功，将user对象设置到HttpSession作用范围域
			session.setAttribute("user", user);
			// 转发到main请求
			mv.setView(new RedirectView("/music/main"));
		}else{
			// 登录失败，设置失败提示信息，并跳转到登录页面
			mv.addObject("message", "登录名或密码错误，请重新输入!");
			mv.setViewName("loginForm");
		}
		return mv;
	}
	//注册
	@PostMapping(value="/register")
	public ModelAndView signup(@ModelAttribute User user,
			ModelAndView mv) {
		String uname = user.getUname();
		if(userService.findByUserName(uname) == null) {
			userService.register(user);
			mv.setView(new RedirectView("/music/loginForm"));
		}else {
			mv.addObject("message", "该用户已存在");
			mv.setViewName("register");
		}
		return mv;
	}
	//退出登录
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "loginForm";
	}
	//评论
	@RequestMapping(value="/listen")
	public String listen(
			Integer sid,
			Model model,
			HttpSession session) {
		if(session.getAttribute("song") == null) {
			return "loginForm";
		}else {
			List<User> comment = userService.comment(sid);
			model.addAttribute("comment", comment);
			model.addAttribute("num", comment.size());
			return "listen";
		}
	}
	@RequestMapping(value="/comment")
	public void comment(
			Integer uid,
			Integer sid,
			String comment) {
		userService.send(uid, sid, comment);
	}
	//个人信息
	@RequestMapping(value="/updateUser")
	public ModelAndView updateUser(
			@ModelAttribute User user,
			ModelAndView mv,
			HttpSession session,
			@RequestParam("file") MultipartFile file,
			HttpServletRequest request) throws Exception {
		String uname = user.getUname();
		int uid = user.getUid();
		//如果文件不为空，写入上传路径
		if(!file.isEmpty()) {
			// 上传文件路径
			String path = "D:/Personal/Desktop/end/music/WebContent/images/pic";
			// 上传文件名
			String filename = file.getOriginalFilename();
		    File filepath = new File(path,filename);
		    user.setUrl("images/pic/" + filename);
			// 判断路径是否存在，如果不存在就创建一个
		    if (!filepath.getParentFile().exists()) { 
	        	filepath.getParentFile().mkdirs();
	        }
		    // 将上传文件保存到一个目标文件当中
		 	file.transferTo(new File(path+File.separator+ filename));
		 	System.out.println("上传文件路径：" + (path+File.separator+ filename));
		}
		//判断用户名是否已存在
		if(userService.findByUserNameAndId(uname, uid) == null) {
			userService.updateUser(user);
			session.setAttribute("user", user);
			mv.setView(new RedirectView("/music/gerenxinxi"));
		}else {
			mv.addObject("message", "修改失败");
			mv.setViewName("gerenxinxi");
		}
		return mv;
	}
//	@PostMapping(value="/ajax")
//	@ResponseBody
//	public Map<String,Object> ajax(String uname) {
//		String i = userService.ajax(uname);
//		Map<String,Object> result = new HashMap<String, Object>();
//		result.put("uid",i);
//		System.out.println(result);
//		return result;
//	}

	@RequestMapping(value="/admin/right")
	public ModelAndView right(String page,
			Model model,
			ModelAndView mv) {
		//每页显示的条数
		int pageSize = 6;
		//查到的总用户数
		List<User> user_num = userService.findAllUser();
		model.addAttribute("userNum", user_num.size());
		//总页数
		int pageTimes;
		if(user_num.size()%pageSize == 0){
			pageTimes = user_num.size()/pageSize;
		}else{
			pageTimes = user_num.size()/pageSize + 1;
		}
		model.addAttribute("pageTimes", pageTimes);
		//页面初始的时候page没有值
		if(null == page || "" == page){
			page = "1";
		}
		//每页开始的第几条记录            
		int startRow = (Integer.parseInt(page)-1) * pageSize;
		List<User> user_list = userService.findAllUserByPage(startRow, pageSize);
		
		model.addAttribute("currentPage", Integer.parseInt(page));
		model.addAttribute("user_list", user_list);
		mv.setViewName("/admin/right");
		return mv;
	}
	//删除用户
	@RequestMapping(value="admin/removeUser")
	public String removeUser(Integer uid) {
		userService.removeUser(uid);
		return "right";
	}
}

