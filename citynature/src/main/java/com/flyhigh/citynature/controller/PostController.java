package com.flyhigh.citynature.controller;

import com.flyhigh.citynature.domain.Post;
import com.flyhigh.citynature.service.Impl.PostServiceImpl;
import jakarta.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

import static java.lang.Integer.parseInt;

@RestController
@RequestMapping("/post")
public class PostController {

    @Autowired
    private PostServiceImpl postServiceImpl;

    @Autowired
    private ServletContext context;

    @PostMapping("/submitPost")
    public int submitPost(@RequestParam("userId") String userId, @RequestParam("title") String title, @RequestParam("content") String content, @RequestParam(value = "file", required = false) MultipartFile file){
        Post post = new Post();
        post.setTitle(title);
        post.setContent(content);
        post.setAuthor(parseInt(userId));
        int flag = postServiceImpl.submitPost(post);
        if (file == null)
            System.out.println("0------------------------------------------------");
        if (flag == 1 && file != null){
            int postId = postServiceImpl.getPostIdAfterSubmit();
            // 指定保存文件的路径
            String realPath = context.getRealPath("/"); //绝对路径
            String uploadDir = realPath + "static\\post_images\\";
            File dir = new File(uploadDir);
            if (!dir.exists()) {
                dir.mkdirs();
            }


            File cur_file = new File(uploadDir + postId + ".jpg"); // 假设文件是JPG格式

            try {
                // 保存文件
                file.transferTo(cur_file);
                System.out.println(uploadDir + postId + ".jpg");
                //数据库中存的是图片名
                //下次搜索前需要加入context.getRealPath
                int picture_flag = postServiceImpl.insertPicturePath(postId+".jpg", postId);

            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return flag;
    }
}
