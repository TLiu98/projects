package com.flyhigh.citynature.service.Impl;

//import com.flyhigh.citynature.service.UserService;
import com.flyhigh.citynature.domain.User;
import com.flyhigh.citynature.mapper.UserXmlMapper;
import com.flyhigh.citynature.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserXmlMapper userXmlMapper;

    @Override
    public String login(User user) {
        User return_user = userXmlMapper.findUserbyname(user.getUserName());
        if (return_user == null)
            return "User does not exist.";
        else if (!user.getPassword().equals(return_user.getPassword()))
            return "Password is not correct.";
        return "success";
    }

    @Override
    public int register(User user) {
        return userXmlMapper.InsertUser(user);
    }

    @Override
    public boolean findUserByName(String username) {
        User user = userXmlMapper.findUserbyname(username);
        if (user != null)
            return true;
        return false;
    }
    @Override
    public User findByName(String username){
        User user = userXmlMapper.findUserbyname(username);
        if(user != null){
            return user;
        }else{
            return null;
        }
    }
}
