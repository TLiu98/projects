package com.flyhigh.citynature;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.flyhigh.citynature.mapper")
public class CitynatureApplication {

    public static void main(String[] args) {
        SpringApplication.run(CitynatureApplication.class, args);
    }

}