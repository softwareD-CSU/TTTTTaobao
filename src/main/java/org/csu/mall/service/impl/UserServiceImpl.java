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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

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
    public CommonResponse<User> getUserinfo() {
        return null;
    }

    @Override
    public CommonResponse<String> getForgetQuestion(String username) {
        return null;
    }

    @Override
    public CommonResponse<String> checkForgetQuestion(String username, String question, String answer) {
        return null;
    }

    @Override
    public CommonResponse<String> resetForgetPassword(String username, String passwordNew, String forgetToken) {
        return null;
    }

    @Override
    public CommonResponse<String> resetPassword(String passwordOld, String passwordNew) {
        return null;
    }

    @Override
    public CommonResponse<User> updateInformation(User user) {
        return null;
    }

    @Override
    public CommonResponse<User> getInformation() {
        return null;
    }

    @Override
    public CommonResponse<String> logout() {
        return null;
    }

    public static void main(String[] args) {
        String token = UUID.randomUUID().toString();
        System.out.println(token);
    }
}
