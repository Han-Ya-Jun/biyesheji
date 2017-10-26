package com.wust.boyaBookStore.service;

import com.wust.boyaBookStore.exception.CustomException;
import com.wust.boyaBookStore.po.User;

/**
 * @ClassName UserService
 * @Description TODO(用户模块逻辑层)
 * @author hanyajun
 * @Date 2017年5月10日 下午8:11:29
 * @version 1.0.0
 */
public interface UserService {

    // 修改密码
    public void updatePassword(String uid, String newPass, String oldPass) throws CustomException;

    // 用户登录
    public User login(User user) throws Exception;
    
    // 用户登录
    public User getUser(User user) throws Exception;

    // 用户激活
    public void activatioin(String code) throws CustomException;

    // 用户注册校验
    public boolean ajaxValidateLoginname(String loginname) throws Exception;

    // 注册邮箱校验
    public boolean ajaxValidateEmail(String email) throws Exception;

    // 用户注册
    public void regist(User user) throws Exception;

    // 修改密码
    public void updatePassword2(String uid, String password);
}
