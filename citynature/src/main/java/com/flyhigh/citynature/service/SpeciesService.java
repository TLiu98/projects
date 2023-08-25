package com.flyhigh.citynature.service;

import com.flyhigh.citynature.domain.Species;

import java.util.List;

public interface SpeciesService {

    public List<Species> findAll();

    public List<Species> findByCondition(String condition);
}
