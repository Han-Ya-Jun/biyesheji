package com.wust.boyaBookStore.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wust.boyaBookStore.po.Admin;
import com.wust.boyaBookStore.service.AdminService;


/**
 * 
 * 
 * @ClassName AdminController
 * @Description TODO(管理员)
 * @author hanyajun
 * @Date 2017年5月14日 下午6:10:10
 * @version 1.0.0
 */
@Controller
public class AdminController {
    @Autowired
    private AdminService adminService;
    
    /**
     * 登录功能
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping("/adminlogin")
    public String login(HttpServletRequest req,  Admin form ,HttpServletResponse resp)
            throws ServletException, IOException {
        Admin admin = adminService.login(form);
        if(admin == null) {
            req.setAttribute("msg", "用户名或密码错误！");
            return "/adminjsps/login.jsp";
        }
        req.getSession().setAttribute("admin", admin);
        return "redirect:/adminjsps/admin/index.jsp";
    }
}
