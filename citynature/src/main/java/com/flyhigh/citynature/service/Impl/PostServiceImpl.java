package com.flyhigh.citynature.service.Impl;

import com.flyhigh.citynature.domain.Post;
import com.flyhigh.citynature.mapper.PostXmlMapper;
import com.flyhigh.citynature.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PostServiceImpl implements PostService {

    @Autowired
    private PostXmlMapper postXmlMapper;

    @Override
    public int submitPost(Post post) {
        return postXmlMapper.submitPost(post);
    }

    @Override
    public int getPostIdAfterSubmit() {
        return postXmlMapper.getPostIdAfterSubmit();
    }

    @Override
    public int insertPicturePath(String path, int postId) {
        return postXmlMapper.insertPicturePath(path, postId);
    }
}
