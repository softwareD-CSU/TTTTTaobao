package org.csu.mall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import org.apache.commons.lang3.StringUtils;
import org.csu.mall.common.CommonResponse;
import org.csu.mall.common.Constant;
import org.csu.mall.common.ResponseCode;
import org.csu.mall.entity.User;
import org.csu.mall.persistence.UserMapper;
import org.csu.mall.service.UserService;
import org.csu.mall.util.MD5Util;
import org.csu.mall.util.TokenCache;
import org.csu.mall.util.TokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.UUID;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public CommonResponse<User> login(String username, String password) {
//
//        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
//        queryWrapper.eq("username", username);
//        int rows = userMapper.selectCount(queryWrapper);

        int rows = userMapper.selectCount(Wrappers.<User>query().eq("username",username));
        if(rows == 0){
            return CommonResponse.createForError("用户名不存在");
        }

        //todo 密码要进行md5的处理
        String md5Password = MD5Util.md5Encrypt32Upper(password);

        User user = userMapper.selectOne(
                Wrappers.<User>query().eq("username",username).eq("password",md5Password));
        if(user == null){
            return CommonResponse.createForError("用户名或密码错误");
        }

        //去除密码
        user.setPassword(StringUtils.EMPTY);
        return CommonResponse.createForSuccess(user);
    }

    @Override
    public CommonResponse<String> register(User user){
        int rows = userMapper.selectCount(Wrappers.<User>query().eq("username",user.getUsername()));
        if(rows > 0){
            return CommonResponse.createForError("用户名已存在");
        }
        rows = userMapper.selectCount(Wrappers.<User>query().eq("email",user.getEmail()));
        if(rows > 0){
            return CommonResponse.createForError("邮箱已存在");
        }

        //设置用户角色
        user.setRole(Constant.Role.CUSTOMER);
        //密码的加密处理
        user.setPassword(MD5Util.md5Encrypt32Upper(user.getPassword()));
        user.setCreateTime(LocalDateTime.now());
        user.setUpdateTime(LocalDateTime.now());

         rows = userMapper.insert(user);

         if( rows == 0){
             return CommonResponse.createForError("注册失败");
         }

        return CommonResponse.createForSuccessMessage("注册成功");
    }

    @Override
    public CommonResponse<String> checkField(String type , String value){
        if(StringUtils.isNotBlank(type)){
            if(Constant.USERNAME.equals(type)){
                int rows = userMapper.selectCount(Wrappers.<User>query().eq("username",value));
                if(rows > 0){
                    return CommonResponse.createForError("用户名已存在");
                }
            }
            if(Constant.EMAIL.equals(type)){
                int rows = userMapper.selectCount(Wrappers.<User>query().eq("email",value));
                if(rows > 0){
                    return CommonResponse.createForError("邮箱已存在");
                }
            }
        }else{
            return CommonResponse.createForError(ResponseCode.ILLEGAL_ARGUMENT.getCode(), ResponseCode.ILLEGAL_ARGUMENT.getDescription());
        }
        return CommonResponse.createForSuccessMessage("字段校验成功");
    }

    @Override
    public CommonResponse<User> getUserinfo(String username) {
        User user = userMapper.selectOne(Wrappers.<User>query().eq("username",username));

        //去除密码
        user.setPassword(StringUtils.EMPTY);
        return CommonResponse.createForSuccess(user);
    }

    @Override
    public CommonResponse<String> getForgetQuestion(String username){
        User user = userMapper.selectOne(Wrappers.<User>query().eq("username",username));
        if(user == null){
            return CommonResponse.createForError("用户名错误");
        }
        return CommonResponse.createForSuccess(user.getQuestion);
    }

    @Override
    public CommonResponse<String> checkForgetQuestion(String username, String question, String answer){
        User user = userMapper.selectOne(
                Wrappers.<User>query().eq("username",username).eq("question",question));
        if(user == null){
            return CommonResponse.createForError("用户名或问题错误");
        }
        if(answer.equals(user.getAnswer)){

            String token = TokenUtils.token(username);
            TokenCache.setToken("checkForgetQuestionfor"+username,token);

            return CommonResponse.createForSuccess(token);
        }else {
            return CommonResponse.createForError("问题答案错误");
        }

    }

    @Override
    public CommonResponse<String> resetForgetPassword(String username, String passwordNew, String forgetToken) {
        String token = TokenCache.getToken("checkForgetQuestionfor"+username);
        if (token.equals(forgetToken)){

            if (TokenUtils.verify(token)){

                User user = userMapper.selectOne(Wrappers.<User>query().eq("username",username));
                user.setPassword(MD5Util.md5Encrypt32Upper(passwordNew));

                user.setUpdateTime(LocalDateTime.now());
                userMapper.updateById(user);
                return CommonResponse.createForSuccessMessage("修改密码成功");

            }else {
                return CommonResponse.createForError("token已经失效");
            }

        }else {
            return CommonResponse.createForError("修改密码操作失效");
        }
    }

    @Override
    public CommonResponse<String> resetPassword(String username, String passwordOld, String passwordNew) {

        int rows = userMapper.selectCount(Wrappers.<User>query().eq("username",username));
        if(rows == 0){
            return CommonResponse.createForError("用户名不存在");
        }

        //todo 密码要进行md5的处理
        String md5Password = MD5Util.md5Encrypt32Upper(passwordOld);

        User user = userMapper.selectOne(
                Wrappers.<User>query().eq("password",md5Password));
        if(user == null){
            return CommonResponse.createForError("旧密码输入错误");
        }else {

            user.setPassword(MD5Util.md5Encrypt32Upper(passwordNew));
            user.setUpdateTime(LocalDateTime.now());
            userMapper.updateById(user);
            return CommonResponse.createForSuccessMessage("修改密码成功");
        }
    }

    @Override
    public CommonResponse<User> updateInformation(User user) {

        int rows = userMapper.selectCount(Wrappers.<User>query().eq("email",user.getEmail()));
        if(rows > 0){
            return CommonResponse.createForError("邮箱已存在");
        }
        User update_user = userMapper.selectOne(Wrappers.<User>query().eq("username",user.getUsername));
        if(update_user == null){
            return CommonResponse.createForError("用户名不存在");
        }
        update_user.setEmail(user.getEmail);
        update_user.setPhone(user.getPhone);
        update_user.setQuestion(user.getQuestion);
        update_user.setAnswer(user.getAnswer);
        update_user.setUpdateTime(LocalDateTime.now());

        userMapper.updateById(update_user);

        return CommonResponse.createForSuccessMessage("更新个人信息成功");
    }

    @Override
    public CommonResponse<User> getInformation(String username) {
        User user = userMapper.selectOne(Wrappers.<User>query().eq("username",username));
        //去除密码
        user.setPassword(StringUtils.EMPTY);
        return CommonResponse.createForSuccess(user);
    }

    @Override
    public CommonResponse<String> logout() {
        return CommonResponse.createForSuccessMessage("退出成功");
    }

    public static void main(String[] args) {
        String token = UUID.randomUUID().toString();
        System.out.println(token);
    }
}
