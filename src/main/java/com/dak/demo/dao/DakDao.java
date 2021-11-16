package com.dak.demo.dao;

import com.dak.demo.dto.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface DakDao {
    public ArrayList<DakDto> getList(DakNaverBestDto dnbt);
    public ArrayList<DakNaverBestDto> getCategory();
    public ArrayList<DakNaverBestDto> getNewBest(int seq);
    public void insert_my_keyword(DakNaverBestDto dnbt);
    public void insert_my_email(DakNaverBestDto dnbt);
}
