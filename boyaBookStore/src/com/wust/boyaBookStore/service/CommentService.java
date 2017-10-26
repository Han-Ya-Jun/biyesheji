package com.wust.boyaBookStore.service;

import com.wust.boyaBookStore.po.Comment;
import com.wust.boyaBookStore.po.PageBean;

/**
 * @ClassName CommentService
 * @Description TODO(评论服务接口)
 * @author hanyajun
 * @Date 2017年5月20日 上午2:10:28
 * @version 1.0.0
 */
public interface CommentService {

    public PageBean<Comment> getCommentBybid(String bid, int pc);

    public void addcomment(Comment comment);
}
