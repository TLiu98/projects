package com.flyhigh.citynature;

import com.flyhigh.citynature.domain.Post;
import com.flyhigh.citynature.domain.Species;
import com.flyhigh.citynature.domain.User;
import com.flyhigh.citynature.mapper.PostXmlMapper;
import com.flyhigh.citynature.mapper.SpeciesXmlMapper;
import com.flyhigh.citynature.mapper.UserXmlMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Date;
import java.util.List;

@SpringBootTest
class CitynatureApplicationTests {

    @Autowired
    private UserXmlMapper userMapper;

    @Autowired
    private SpeciesXmlMapper speciesXmlMapper;

    @Autowired
    public PostXmlMapper postXmlMapper;

    @Test
    public void findAll() {
//        List<User> userList = userMapper.findAll();
//        System.out.println(userList);
    }

    @Test
    public void InsertUser() {
        User user = new User();
        user.setUserName("test1");
        user.setPassword("123");
        user.setBirthday(new Date());
        user.setState("MA");
        user.setCity("Boston");
        user.setZipCode("02148");
        int i = userMapper.InsertUser(user);
        System.out.println(i);
    }

    @Test
    public void findAllSpecies(){
        List<Species> species = speciesXmlMapper.findAll();
        System.out.println(species);
    }

    @Test
    public void submitPost(){
        Post post = new Post();
        post.setTitle("test");
        post.setAuthor(18);
        int flag = postXmlMapper.submitPost(post);
        int id = 0;
        if (flag == 1)
            id = postXmlMapper.getPostIdAfterSubmit();
        System.out.println(id);
    }
}