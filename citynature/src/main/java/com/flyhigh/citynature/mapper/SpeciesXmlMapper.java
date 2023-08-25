package com.flyhigh.citynature.mapper;

import com.flyhigh.citynature.domain.Species;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface SpeciesXmlMapper {

    public List<Species> findAll();

    public List<Species> findByCondition(String condition);
}
