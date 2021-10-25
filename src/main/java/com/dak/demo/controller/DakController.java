package com.dak.demo.controller;

import com.dak.demo.service.DakMainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DakController {

	@Autowired
	private DakMainService service;
	
	@RequestMapping(value = "/hello")
	public ModelAndView hello() throws Exception{
		ModelAndView mav = new ModelAndView();
		String address = "dak/test";
		mav.setViewName(address);
		return mav;
	}
	
	@RequestMapping(value = "/main")
	public ModelAndView main() throws Exception{
		ModelAndView mav = new ModelAndView();
		String address = "dak/main";
		mav.setViewName(address);
		return mav;
	}
}
