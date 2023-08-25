package com.flyhigh.citynature.service.Impl;

import com.flyhigh.citynature.domain.Species;
import com.flyhigh.citynature.mapper.SpeciesXmlMapper;
import com.flyhigh.citynature.service.SpeciesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SpeciesServiceImpl implements SpeciesService {

    @Autowired
    private SpeciesXmlMapper speciesXmlMapper;

    @Override
    public List<Species> findAll() {
        return speciesXmlMapper.findAll();
    }

    @Override
    public List<Species> findByCondition(String condition) {
        String xmlCondition = "%" + condition + "%"; //模糊查询需要转换数据格式
        return speciesXmlMapper.findByCondition(xmlCondition);
    }
}
