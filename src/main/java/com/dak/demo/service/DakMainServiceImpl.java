package com.dak.demo.service;

import com.dak.demo.dao.DakDao;
import com.dak.demo.dto.DakDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class DakMainServiceImpl implements DakMainService{

    @Autowired
    DakDao dao;

    @Override
    public ArrayList<DakDto> getList() {
        return dao.getList();
    }
}
