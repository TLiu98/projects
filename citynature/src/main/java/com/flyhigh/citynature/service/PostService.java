package com.flyhigh.citynature.service;

import com.flyhigh.citynature.domain.Post;

public interface PostService {

    public int submitPost(Post post);

    public int getPostIdAfterSubmit();

    public int insertPicturePath(String path, int postId);

}
