package com.dak.demo.controller;

import com.dak.demo.dto.DakNaverBestDto;
import com.dak.demo.service.DakMainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class DakController {

	@Autowired
	private DakMainService service;

	private static final Logger logger = LoggerFactory.getLogger(DakController.class);
	
	@RequestMapping(value = "/hello")
	public ModelAndView hello() throws Exception{
		ModelAndView mav = new ModelAndView();
		String address = "dak/test";

		//logger.info("test : " + service.getList());
		//mav.addObject("nkt_list",service.getList());

		mav.setViewName(address);
		return mav;
	}
	
	@RequestMapping(value = "/main")
	public ModelAndView main(){
		logger.info(" [ main ] ");
		ModelAndView mav = new ModelAndView();
		String address = "dak/main";
		ArrayList<DakNaverBestDto> cateList = service.getCategory();
		mav.addObject("cateList", cateList);
		mav.addObject("cateList_leng", cateList.size());
		
		mav.setViewName(address);
		return mav;
	}
	
	@RequestMapping(value = "/getNewBest")
	@ResponseBody
	public ArrayList<DakNaverBestDto> getNewBest(@RequestParam(value = "f_seq")int f_seq){
		logger.info(" [ getNewBest ] ");
		ArrayList<DakNaverBestDto> newblist = new ArrayList<DakNaverBestDto>();
		DakNaverBestDto dnb = new DakNaverBestDto();
		try {
			newblist = service.getNewBest(f_seq);
		} catch (Exception e) {
			dnb.setKeyword(e.getMessage());
			newblist.add(dnb);
		}
		return newblist;
	}
	
	@RequestMapping(value = "/getExtended")
	@ResponseBody
	public String getExtended(@RequestParam(value = "keyword")String keyword){
		logger.info(" [ getExtended ] ");
		String result = "";
		try {
			result = service.getExtended(keyword);
		} catch (Exception e) {
			result = e.getMessage();
		}
		
		return result;
	}
	
}
