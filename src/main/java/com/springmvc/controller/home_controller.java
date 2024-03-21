package com.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class home_controller {
	//URL 패턴 함수에 매핑
	@RequestMapping(value ="/home", method = RequestMethod.GET)
	//뷰 이름 String으로 리턴
	public String home() {	
		//뷰 이름. String으로 리턴
		return "home";	
	}
}
