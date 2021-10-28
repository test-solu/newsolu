package com.dak.demo.service;

import com.dak.demo.dto.DakDto;
import com.dak.demo.dto.DakNaverBestDto;

import java.util.ArrayList;

public interface DakMainService {
    public ArrayList<DakDto> getList(String keyword);
    public ArrayList<DakNaverBestDto> getCategory();
    public ArrayList<DakNaverBestDto> getNewBest(int seq);
    public String getExtended(String keyword);
    public String getMyprice(String keyword,String device);
    public void insert_my_keyword(String keyword);
}
