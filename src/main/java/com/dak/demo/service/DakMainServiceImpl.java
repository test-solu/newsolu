package com.dak.demo.service;

import com.dak.demo.dao.DakDao;

import com.dak.demo.dto.DakDto;
import com.dak.demo.dto.DakNaverBestDto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//http 통신
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.HttpEntity;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.apache.http.impl.client.CloseableHttpClient;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;

@Service
public class DakMainServiceImpl implements DakMainService{
	
	private static final Logger logger = LoggerFactory.getLogger(DakMainServiceImpl.class);

    @Autowired
    DakDao dao;

    @Override
    public ArrayList<DakDto> getList(DakNaverBestDto dnbt) {
        return dao.getList(dnbt);
    }

	@Override
	public ArrayList<DakNaverBestDto> getCategory() {
		logger.info(" [ getCategory : service ] ");
		return dao.getCategory();
	}

	@Override
	public ArrayList<DakNaverBestDto> getNewBest(int seq) {
		logger.info(" [ getNewBest : service ] ");
		return dao.getNewBest(seq);
	}

	@Override
	public String getExtended(String keyword) {
		logger.info(" [ getExtended : service ] ");
		String result = "";
		String reqURL = "http://sqldb.solu-tion.co.kr:8080/naver/keywordstool/1018467/" + keyword;
		CloseableHttpClient httpClient = HttpClients.createDefault();
		try {
			HttpGet request = new HttpGet(reqURL);
			CloseableHttpResponse response = httpClient.execute(request);
			HttpEntity entity = response.getEntity();
			result = EntityUtils.toString(entity);
			response.close();
			httpClient.close();
		} catch (Exception e) {
			result += e.getMessage();
		}
		return result;
	}

	@Override
	public String getMyprice(String keyword, String device) {
		logger.info(" [ getMyprice : service ] ");
		String reqURL = "http://sqldb.solu-tion.co.kr:8080/naver/Estimate/average/1018467/keyword";
		String result = "";
		int cnt = 0;
		
		if(device.equals("PC")) {
			cnt = 11;
		} else {
			cnt = 6;
		}
		
		try {
			HttpPost post = new HttpPost(reqURL);
			StringBuilder json = new StringBuilder();
			ArrayList<StringBuilder> list = new ArrayList<StringBuilder>();
			for (int i = 1; i < cnt; i++) {
				StringBuilder in_json = new StringBuilder();
				in_json.append("{");
				in_json.append("\"key\":\""+keyword+"\",");
				in_json.append("\"position\":\""+i+"\"");
				in_json.append("}");
				list.add(in_json);
			}
			json.append("{");
			json.append("\"device\":\""+device+"\",");
			json.append("\"items\":" + list);
			json.append("}");
			//logger.info(json.toString());
			post.setEntity(new StringEntity(json.toString(), "UTF-8"));
			CloseableHttpClient httpClient = HttpClients.createDefault();
			CloseableHttpResponse response = httpClient.execute(post);
			result = EntityUtils.toString(response.getEntity(), StandardCharsets.UTF_8);
			response.close();
			httpClient.close();
		} catch (Exception e) {
			result += e.getMessage();
		}
		
		return result;
	}

	@Override
	public void insert_my_keyword(DakNaverBestDto dnbt) {
		logger.info(" [ insert_my_keyword : service ] ");
		dao.insert_my_keyword(dnbt);
	}

	@Override
	public void insert_my_email(DakNaverBestDto dnbt) {
		logger.info(" [ insert_my_email : service ] ");
		dao.insert_my_email(dnbt);
		
	}

	
	
	
	
	
    
}
