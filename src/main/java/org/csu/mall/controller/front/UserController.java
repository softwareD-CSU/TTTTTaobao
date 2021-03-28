package org.csu.mall.controller.front;

import org.csu.mall.common.CommonResponse;
import org.csu.mall.common.Constant;
import org.csu.mall.entity.User;
import org.csu.mall.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user/")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("test")
    @ResponseBody
    public CommonResponse<String> test(){
        return new CommonResponse<>(1,"测试成功");
    }


    @PostMapping("login")
    @ResponseBody
    public CommonResponse<User> login(String username, String password, HttpSession session) {
        CommonResponse<User> response = userService.login(username, password);
        if (response.isSuccess()) {
            session.setAttribute(Constant.CURRENT_USER, response.getData());
        }
        return response;
    }

    @PostMapping("regitster")
    @ResponseBody
    public CommonResponse<String> register(User user){
        return userService.register(user);
    }

    @GetMapping("check_field")
    @ResponseBody
    public CommonResponse<String> checkField(String type , String value){
        return userService.checkField(type,value);
    }
}
