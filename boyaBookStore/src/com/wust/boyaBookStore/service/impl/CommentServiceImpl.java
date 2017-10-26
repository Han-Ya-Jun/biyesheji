package com.wust.boyaBookStore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.wust.boyaBookStore.mapper.CommentMapper;
import com.wust.boyaBookStore.po.Comment;
import com.wust.boyaBookStore.po.CommentExample;
import com.wust.boyaBookStore.po.CommentExample.Criteria;
import com.wust.boyaBookStore.po.PageBean;
import com.wust.boyaBookStore.po.PageConstants;
import com.wust.boyaBookStore.service.CommentService;

public class CommentServiceImpl implements CommentService{
    @Autowired
    private CommentMapper commentMapper;
    @Override
    public PageBean<Comment> getCommentBybid(String bid,int pc) {
        CommentExample commentExample=new CommentExample();
        Criteria criteria = commentExample.createCriteria();
        criteria.andBidEqualTo(bid);
        int sum = commentMapper.countByExample(commentExample); 
        commentExample.setPc((pc - 1) * PageConstants.comment_PAGE_SIZE);
        commentExample.setPagesize(PageConstants.comment_PAGE_SIZE);
        List<Comment> Comment = commentMapper.selectByExampleWithPage(commentExample);
        PageBean<Comment> pb = new PageBean<Comment>();
        pb.setBeanList(Comment);
        pb.setTr(sum);
        pb.setPc(pc);
        pb.setPs(PageConstants.comment_PAGE_SIZE);
        return pb;
    }
    @Override
    public void addcomment(Comment comment) {
       commentMapper.insert(comment);  
    }

}
