package com.dak.demo.dao;

import com.dak.demo.dto.DakDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface DakDao {
    public ArrayList<DakDto> getList();
}
