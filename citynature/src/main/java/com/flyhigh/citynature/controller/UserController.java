package com.flyhigh.citynature.controller;

import com.flyhigh.citynature.commons.R;
import com.flyhigh.citynature.domain.User;
import com.flyhigh.citynature.service.Impl.UserServiceImpl;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserServiceImpl userServiceImpl;

    @PostMapping("/login")//GetMapping ->@RequestParam
    public ResponseEntity<Map<String, String>> loginUser(HttpServletRequest request, @RequestBody User user) {
        String result = userServiceImpl.login(user);
        //System.out.println(user.getUserName());
        //System.out.println(result);
        Map <String, String> response = new HashMap<>();
        User findUser = userServiceImpl.findByName(user.getUserName()); // get id by returning user
        if("success".equals(result)){
            response.put("message", "success");
            HttpSession session = request.getSession();
            session.setAttribute("username", user.getUserName());
            session.setAttribute("login_status", 1);//1 means login, 0 means logout.
            session.setAttribute("userId", findUser.getUserId());
            System.out.println("success");
            return ResponseEntity.ok(response);
        } else if (result.equals("User does not exist.")) {
            response.put("message", "User does not exist.");
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
        }
        response.put("message", "Password is not correct.");
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
    }

    @PostMapping("/register")
    public ResponseEntity<Map<String, String>> registerUser(@RequestBody User user){
        int flag = userServiceImpl.register(user);
        Map <String, String> response = new HashMap<>();
        if (flag == 1){
            response.put("message", "success");
            return ResponseEntity.ok(response);
        }
        response.put("message", "error");
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
    }

    @GetMapping("/verifyUsernameDuplication")
    public boolean verifyUsernameDuplication(@RequestParam String username){
        //System.out.println(userServiceImpl.findUserByName(username));
        return userServiceImpl.findUserByName(username);
    }

    @GetMapping("/verifyLoginStatus")
    public Map<String, String> verifyLoginStatus(HttpServletRequest request){
        HttpSession session = request.getSession();
        Map <String, String> response = new HashMap<>();
        if (session.getAttribute("username") != null){
            response.put("username", (String)session.getAttribute("username"));

            System.out.println(String.valueOf(session.getAttribute("userId")));

            response.put("userId", String.valueOf(session.getAttribute("userId")));
            return response;
        }
        return response;
    }
    @GetMapping("/findUserInfoByName")
    public  User findUserInfoByName(HttpServletRequest request){
        HttpSession session = request.getSession();
        User user = userServiceImpl.findByName((String)session.getAttribute("username"));
        return user;
    }
}