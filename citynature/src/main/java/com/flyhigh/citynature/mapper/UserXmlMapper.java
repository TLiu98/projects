package com.flyhigh.citynature.mapper;

import com.flyhigh.citynature.domain.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface UserXmlMapper {
    public List<User> findAll();

    public User findUserbyname(String username);

    public int InsertUser(User user);
}
