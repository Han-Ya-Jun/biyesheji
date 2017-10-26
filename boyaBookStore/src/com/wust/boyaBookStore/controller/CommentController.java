package com.wust.boyaBookStore.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wust.boyaBookStore.po.Comment;
import com.wust.boyaBookStore.service.CommentService;

import cn.itcast.commons.CommonUtils;

/**
 * 
 * @ClassName CommentController
 * @Description TODO(评论控制器)
 * @author hanyajun
 * @Date 2017年5月20日 上午2:46:02
 * @version 1.0.0
 */
@Controller
public class CommentController {
  @Autowired
  private CommentService commentService;
  
  @RequestMapping("/addcomment")
  public String load(HttpServletRequest req,Comment comment) throws ServletException, IOException {
     
       comment.setId(CommonUtils.uuid());
       comment.setTime(String.format("%tF %<tT", new Date()));
        commentService.addcomment(comment);
       return "redirect:loadbook.action?bid="+comment.getBid();// 转发到desc.jsp
  }

}
