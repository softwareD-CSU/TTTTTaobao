package org.csu.mall.controller.front;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
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


    @GetMapping("get_user_info")
    @ResponseBody
    public CommonResponse<User> getUserinfo(HttpSession session) {
        User user = (User)session.getAttribute(Constant.CURRENT_USER);
        if(user == null){
            return CommonResponse.createForNeedLogin("用户未登录,无法获取当前用户信息");
        }
        return userService.getUserinfo(user.getUsername);
    }

    @PostMapping("forget_get_question")
    @ResponseBody
    public CommonResponse<String> getForgetQuestion(String username){
        return userService.getForgetQuestion(username);
    }

    @PostMapping("forget_check_answer")
    @ResponseBody
    public CommonResponse<String> checkForgetQuestion(String username, String question, String answer) {
        return userService.checkForgetQuestion(username, question,answer);
    }

    @PostMapping("forget_reset_password")
    @ResponseBody
    public CommonResponse<String> resetForgetPassword(String username, String passwordNew, String forgetToken) {
        return userService.resetForgetPassword(username,passwordNew,forgetToken);
    }

    @PostMapping("reset_password")
    @ResponseBody
    public CommonResponse<String> resetPassword(String passwordOld, String passwordNew,HttpSession session) {
        User currentUser = (User)session.getAttribute(Constant.CURRENT_USER);
        if(currentUser == null){
            return CommonResponse.createForNeedLogin("用户未登录,无法获取当前用户信息");
        }
        return userService.resetPassword(currentUser.getUsername,passwordOld,passwordNew);
    }

    @PostMapping("update_information")
    @ResponseBody
    public CommonResponse<User> updateInformation(User user, HttpSession session) {
        User currentUser = (User)session.getAttribute(Constant.CURRENT_USER);
        if(currentUser == null) {
            return CommonResponse.createForNeedLogin("用户未登录,无法获取当前用户信息");
        }
        return userService.updateInformation(user);
    }

    @GetMapping("get_information")
    @ResponseBody
    public CommonResponse<User> getInformation(HttpSession session) {
        User currentUser = (User)session.getAttribute(Constant.CURRENT_USER);
        if(currentUser == null) {
            return CommonResponse.createForNeedLogin("用户未登录,无法获取当前用户信息,status=10,强制登录");
        }
        return userService.getInformation(currentUser.getUsername);
    }

    @GetMapping("logout")
    @ResponseBody
    public CommonResponse<String> logout(HttpSession session) {
        User currentUser = (User)session.getAttribute(Constant.CURRENT_USER);
        if(currentUser == null) {
            return CommonResponse.createForNeedLogin("用户未登录");
        }
        if(userService.logout().isSuccess()) {
            session.setAttribute(Constant.CURRENT_USER, null);
            return userService.logout();
        }else {
            return CommonResponse.createForError("服务端异常");
        }

    }

}
