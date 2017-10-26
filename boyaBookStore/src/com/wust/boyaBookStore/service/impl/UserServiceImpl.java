package com.wust.boyaBookStore.service.impl;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.List;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.Session;

import org.springframework.beans.factory.annotation.Autowired;

import com.wust.boyaBookStore.exception.CustomException;
import com.wust.boyaBookStore.mapper.UserMapper;
import com.wust.boyaBookStore.po.User;
import com.wust.boyaBookStore.po.UserExample;
import com.wust.boyaBookStore.po.UserExample.Criteria;
import com.wust.boyaBookStore.service.UserService;

import cn.itcast.commons.CommonUtils;

import cn.itcast.mail.Mail;
import cn.itcast.mail.MailUtils;

/**
 * @ClassName UserServiceImpl
 * @Description TODO(用户逻辑实现类)
 * @author hanyajun
 * @Date 2017年5月10日 下午8:13:17
 * @version 1.0.0
 */
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    /**
     * 修改密码
     * 
     * @param uid
     * @param newPass
     * @param oldPass
     * @throws CustomException
     */
    public void updatePassword(String uid, String newPass, String oldPass) throws CustomException {

        /*
         * 1. 校验老密码
         */
        UserExample userExample = new UserExample();
        Criteria criteria = userExample.createCriteria();
        criteria.andUidEqualTo(uid);
        criteria.andLoginpassEqualTo(oldPass);
        List<User> selectByExample = userMapper.selectByExample(userExample);
        if (selectByExample.size() == 0) {// 如果老密码错误
            throw new CustomException("老密码错误！");
        }
        /*
         * 2. 修改密码
         */
        User user = new User();
        user.setUid(uid);
        user.setLoginpass(oldPass);
        userMapper.updateByPrimaryKeySelective(user);
    }

    /**
     * 登录功能
     * 
     * @param user
     * @return
     */
    public User login(User user) {
        UserExample userExample = new UserExample();
        Criteria criteria = userExample.createCriteria();
        criteria.andLoginpassEqualTo(user.getLoginpass());
        criteria.andLoginnameEqualTo(user.getLoginname());
        List<User> users = userMapper.selectByExample(userExample);
        if (users.size()==0) {
            return null;
        }else{
            return users.get(0);
        }
    }
    public User getUser(User user) {
       return userMapper.selectByPrimaryKey(user.getUid());
    }

    /**
     * 激活功能
     * 
     * @param code
     * @throws CustomException
     */
    public void activatioin(String code) throws CustomException {
        UserExample userExample=new UserExample();
        Criteria criteria = userExample.createCriteria();
        criteria.andActivationcodeEqualTo(code);
        List<User> users = userMapper.selectByExample(userExample);
        if (users == null)
            throw new CustomException("无效的激活码！");
        else if (users.get(0).getStatus())
            throw new CustomException("您已经激活过了，不要二次激活！");
        User user = users.get(0);
        user.setStatus(true);
        userMapper.updateByPrimaryKeySelective(user);// 修改状态
    }

    /**
     * 用户名注册校验
     * 
     * @param loginname
     * @return
     */
    public boolean ajaxValidateLoginname(String loginname) {
        UserExample userExample=new UserExample();
        Criteria criteria = userExample.createCriteria();
        criteria.andLoginnameEqualTo(loginname);
        List<User> list = userMapper.selectByExample(userExample);
        boolean isregerist=list.size()>0?false:true;
        return isregerist;
    }

    /**
     * Email校验
     * 
     * @param email
     * @return
     */
    public boolean ajaxValidateEmail(String email) {
        UserExample userExample=new UserExample();
        Criteria criteria = userExample.createCriteria();
        criteria.andEmailEqualTo(email);
        List<User> list = userMapper.selectByExample(userExample);
        boolean isregerist=list.size()>0?false:true;
        return isregerist;
    }

    /**
     * 注册功能
     * 
     * @param user
     */
    public void regist(User user) {
        /*
         * 1. 数据的补齐
         */
        user.setUid(CommonUtils.uuid());
        user.setStatus(false);
        user.setActivationcode(CommonUtils.uuid() + CommonUtils.uuid());
        userMapper.insertSelective((user));
        /*
         * 3. 发邮件
         */
        /*
         * 把配置文件内容加载到prop中
         */
        Properties prop = new Properties();
        try {
            prop.load(this.getClass().getClassLoader().getResourceAsStream("email_template.properties"));
        } catch (IOException e1) {
            throw new RuntimeException(e1);
        }
        /*
         * 登录邮件服务器，得到session
         */
        String host = prop.getProperty("host");// 服务器主机名
        String name = prop.getProperty("username");// 登录名
        String pass = prop.getProperty("password");// 登录密码
        Session session = MailUtils.createSession(host, name, pass);

        /*
         * 创建Mail对象
         */
        String from = prop.getProperty("from");
        String to = user.getEmail();
        String subject = prop.getProperty("subject");
        // MessageForm.format方法会把第一个参数中的{0},使用第二个参数来替换。
        // 例如MessageFormat.format("你好{0}, 你{1}!", "张三", "去死吧"); 返回“你好张三，你去死吧！”
        String content = MessageFormat.format(prop.getProperty("content"), user.getActivationcode());
        Mail mail = new Mail(from, to, subject, content);
        /*
         * 发送邮件
         */
        try {
            MailUtils.send(session, mail);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void updatePassword2(String uid, String password) {
        User user = new User();
        user.setUid(uid);
        user.setLoginpass(password);
        userMapper.updateByPrimaryKeySelective(user);
     
    }
}
