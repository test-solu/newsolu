package com.dak.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DakController {
	
	@RequestMapping(value = "/hello")
	public ModelAndView hello() throws Exception{
		ModelAndView mav = new ModelAndView();
		String address = "dak/test";
		mav.setViewName(address);
		return mav;
	}
}
