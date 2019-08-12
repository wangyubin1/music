package org.sgyy.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.RedirectView;

/**
 * 页面跳转控制器
 * */
@Controller
public class FormController{

	@RequestMapping(value="/loginForm")
	public String loginForm(){
		return "loginForm";
	}
	
	@RequestMapping(value="/register")
	public String register() {
		return "register";
	}
	
	@RequestMapping(value="/gerenxinxi")
	public String gerenxinxi(HttpSession session) {
		if(session.getAttribute("user") == null) {
			return "loginForm";
		}
		return "gerenxinxi";
	}
	
	@RequestMapping(value="/admin/login")
	public String aa() {
		return "admin/login";
	}
	
	@RequestMapping(value="/admin/top")
	public String top(){
		// 动态跳转页面
		return "admin/top";
	}
	
	@RequestMapping(value="/admin/left")
	public String left(){
		// 动态跳转页面
		return "admin/left";
	}
	
	@RequestMapping(value="/admin/adminLogin")
	public String adminLogin(HttpSession session){
		// 动态跳转页面
		if(session.getAttribute("admin") == null) {
			return "admin/login";
		}
		return "admin/adminIndex";
	}
	
	@RequestMapping(value="/admin/putMusic")
	public String putMusic(){
		// 动态跳转页面
		return "admin/putMusic";
	}
//	@RequestMapping(value="/main")
//	public String main() {
//		return "main";
//	}
}


