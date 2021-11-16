package com.dak.demo.controller;

import com.dak.demo.dto.DakDto;
import com.dak.demo.dto.DakNaverBestDto;
import com.dak.demo.service.DakMainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class DakController {

	@Autowired
	private DakMainService service;

	private static final Logger logger = LoggerFactory.getLogger(DakController.class);
	
	/**
	 * 테스트 페이지 호출 
	 * 아예 삭제 하셔도 됩니다.
	 * 
	 */
	@RequestMapping(value = "/hello")
	public ModelAndView hello() throws Exception{
		ModelAndView mav = new ModelAndView();
		String address = "dak/test";
		mav.setViewName(address);
		return mav;
	}
	
	
	/**
	 * ModelAndView
	 * jeff
	 * 기능 설명 : 메일페이지 호출(첫 li 카테고리 호출)
	 */
	@RequestMapping(value = "/main")
	public ModelAndView main(){
		logger.info(" [ main ] ");
		ModelAndView mav = new ModelAndView();
		String address = "dak/main";
		ArrayList<DakNaverBestDto> cateList = new ArrayList<DakNaverBestDto>();
		try {
			cateList = service.getCategory();
		} catch (Exception e) {
			logger.info("main error : " + e.getMessage());
		}
		mav.addObject("cateList", cateList);
		mav.addObject("cateList_leng", cateList.size());
		
		mav.setViewName(address);
		return mav;
	}
	
	/**
	 * ArrayList<DakNaverBestDto>
	 * jeff
	 * 기능 설명 : 신규 인기 검색어 호출
	 */
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
	
	/**
	 * String
	 * jeff
	 * 기능 설명 : 확장 키워드 호출
	 */
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
	
	/**
	 * String
	 * jeff
	 * 기능 설명 : 디바이스별 검색어 순위 가격 확인 
	 */
	@RequestMapping(value = "/getMyprice")
	@ResponseBody
	public String getMyprice(@RequestParam(value = "keyword")String keyword){
		logger.info(" [ getMyprice ] ");
		StringBuilder result = new StringBuilder();
		String pc_result = "";
		String mobile_result = "";
		try {
			pc_result = service.getMyprice(keyword,"PC");
			mobile_result = service.getMyprice(keyword,"MOBILE");
			result.append("{");
			result.append("\"pc\":" + pc_result);
			result.append(",\"Mobile\":" + mobile_result);
			result.append("}");
		} catch (Exception e) {
			result.append(e.getMessage());
		}
		
		return result.toString();
	}
	
	/**
	 * ArrayList<DakDto>
	 * jeff
	 * 기능 설명 : 검색 한 키워드 db 저장 및 재호출
	 */
	@RequestMapping(value = "/check_my_keyword")
	@ResponseBody
	public ArrayList<DakDto> check_my_keyword(@RequestParam(value = "keyword")String keyword){
		logger.info(" [ check_my_keyword ] " + keyword);
		ArrayList<DakDto> result = new ArrayList<>();
		Thread th = new Thread();
		DakNaverBestDto dnbt = new DakNaverBestDto();
		String sGuid = UUID.randomUUID().toString();
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String inDate = format.format(time);
		try {
			dnbt.setKeyword(keyword);
			dnbt.setSGuid(sGuid);
			dnbt.setInDate(inDate);
			service.insert_my_keyword(dnbt);
			th.sleep(15000);
			result = service.getList(dnbt);
			String re = result.get(0).getResult();
			while(!re.equals("OK")) {
				result = service.getList(dnbt);
				re = result.get(0).getResult();
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return result;
	}
	
	@RequestMapping(value = "/insertMyEmail")
	@ResponseBody
	public String insertMyEmail(@RequestParam(value = "email")String email) {
		logger.info(" [ insertMyEmail ] " + email);
		String result = "구독신청 완료 하였습니다.";
		DakNaverBestDto dntb = new DakNaverBestDto();
		dntb.setWebEmail(email);
		try {
			service.insert_my_email(dntb);
		} catch (Exception e) {
			result = e.getMessage();
		}
		return result;
	}
	
}
