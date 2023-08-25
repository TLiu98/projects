package com.flyhigh.citynature.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.flyhigh.citynature.domain.User;
import com.flyhigh.citynature.mapper.UserXmlMapper;

public interface UserService {

    public String login(User user);
    public int register(User user);

    public boolean findUserByName(String username);

    public User findByName(String username);
}
