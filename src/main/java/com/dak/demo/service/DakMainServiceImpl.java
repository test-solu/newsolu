package com.dak.demo.service;

import com.dak.demo.dao.DakDao;

import com.dak.demo.dto.DakDto;
import com.dak.demo.dto.DakNaverBestDto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//http 통신
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.HttpEntity;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.apache.http.impl.client.CloseableHttpClient;

import java.util.ArrayList;

@Service
public class DakMainServiceImpl implements DakMainService{
	
	private static final Logger logger = LoggerFactory.getLogger(DakMainServiceImpl.class);

    @Autowired
    DakDao dao;

    @Override
    public ArrayList<DakDto> getList() {
        return dao.getList();
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
	
	
	
	
    
}
