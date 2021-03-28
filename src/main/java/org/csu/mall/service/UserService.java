package org.csu.mall.service;

import org.csu.mall.common.CommonResponse;
import org.csu.mall.entity.User;

public interface UserService {

    CommonResponse<User> login(String username, String password);

    CommonResponse<String> register(User user);

    CommonResponse<String> checkField(String type , String value);

    CommonResponse<User> getUserinfo();

    CommonResponse<String> getForgetQuestion(String username);

    CommonResponse<String> checkForgetQuestion(String username,String question, String answer);

    CommonResponse<String> resetForgetPassword(String username,String passwordNew, String forgetToken);

    CommonResponse<String> resetPassword(String passwordOld,String passwordNew);

    CommonResponse<User> updateInformation(User user);

    CommonResponse<User> getInformation();

    CommonResponse<String> logout();
}
