package com.flyhigh.citynature.mapper;

import com.flyhigh.citynature.domain.Post;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface PostXmlMapper {

    public int submitPost(Post post);

    public int getPostIdAfterSubmit();

    public int insertPicturePath(String path, int postId);

}
