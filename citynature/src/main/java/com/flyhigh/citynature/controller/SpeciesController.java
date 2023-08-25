package com.flyhigh.citynature.controller;

import com.flyhigh.citynature.domain.Species;
import com.flyhigh.citynature.service.Impl.SpeciesServiceImpl;
import com.flyhigh.citynature.service.SpeciesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/species")
public class SpeciesController {

    @Autowired
    private SpeciesServiceImpl speciesServiceimpl;

    @GetMapping("/findAll")
    public List<Species> findAll(){
        System.out.println(speciesServiceimpl.findAll());
        return speciesServiceimpl.findAll();
    }

    @GetMapping("/findByCondition")
    public List<Species> findByCondition(@RequestParam String condition){
        return speciesServiceimpl.findByCondition(condition);
    }
}
