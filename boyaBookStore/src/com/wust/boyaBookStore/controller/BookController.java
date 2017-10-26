package com.wust.boyaBookStore.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wust.boyaBookStore.po.Book;
import com.wust.boyaBookStore.po.Comment;
import com.wust.boyaBookStore.po.PageBean;
import com.wust.boyaBookStore.service.BookService;
import com.wust.boyaBookStore.service.CommentService;


/**
 * @ClassName BookController
 * @Description TODO(图书操作控制器)
 * @author hanyajun
 * @Date 2017年5月11日 下午10:50:21
 * @version 1.0.0
 */
@Controller
public class BookController {

    @Autowired
    private BookService bookService;
    @Autowired
    private CommentService commentService;
    /**
     * 获取当前页码
     * 
     * @param req
     * @return
     */
    private int getPc(String param) {
        int pc = 1;
        if (param != null && !param.trim().isEmpty()) {
            try {
                pc = Integer.parseInt(param);
            } catch (RuntimeException e) {
            }
        }
        return pc;
    }

    /**
     * 截取url，页面中的分页导航中需要使用它做为超链接的目标！
     * 
     * @param req
     * @return
     */
    /*
     * http://localhost:8080/goods/BookServlet?methed=findByCategory&cid=xxx&pc=3 /goods/BookServlet +
     * methed=findByCategory&cid=xxx&pc=3
     */
    private String getUrl(HttpServletRequest req) {
        String url = req.getRequestURI() + "?" + req.getQueryString();
        /*
         * 如果url中存在pc参数，截取掉，如果不存在那就不用截取。
         */
        int index = url.lastIndexOf("&pc=");
        if (index != -1) {
            url = url.substring(0, index);
        }
        return url;
    }

    /**
     * 按bid查询
     * 
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping("/loadbook")
    public String load(HttpServletRequest req, String bid,String pc) throws ServletException, IOException {
        Book book = null;
        try {
            book = bookService.load(bid);
            int pc2 = getPc(pc);
            String url = getUrl(req);
            PageBean<Comment> commentpageBean = commentService.getCommentBybid(bid, pc2);
            commentpageBean.setUrl(url);
            req.setAttribute("pb", commentpageBean);
            req.setAttribute("commenttotal", commentpageBean.getBeanList().size());
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } // 通过bid得到book对象
        req.setAttribute("book", book);// 保存到req中
        return "jsps/book/desc2";// 转发到desc.jsp
    }

    /**
     * 按分类查
     * 
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping("/findByCategoryBook")
    public String findByCategory(HttpServletRequest req, String cid,String pc) throws Exception {
        /*
         * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
         */
        int pc2 = getPc(pc);
        /*
         * 2. 得到url：...
         */
        String url = getUrl(req);
        /*
         * 4. 使用pc和cid调用service#findByCategory得到PageBean
         */
        PageBean<Book> pb = bookService.findByCategory(cid, pc2);
        /*
         * 5. 给PageBean设置url，保存PageBean，转发到/jsps/book/list.jsp
         */
        pb.setUrl(url);
        req.setAttribute("pb", pb);
        return "jsps/book/list";
    }

    /**
     * 按作者查
     * 
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping("/findByAuthor")
    public String findByAuthor(HttpServletRequest req, String pc, HttpServletResponse resp)
            throws ServletException, IOException {
        /*
         * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
         */
        int pc2 = getPc(pc);
        /*
         * 2. 得到url：...
         */
        String url = getUrl(req);
        /*
         * 3. 获取查询条件，本方法就是cid，即分类的id
         */
        String author = req.getParameter("author");
        /*
         * 4. 使用pc和cid调用service#findByCategory得到PageBean
         */
        PageBean<Book> pb = bookService.findByAuthor(author, pc2);
        /*
         * 5. 给PageBean设置url，保存PageBean，转发到/jsps/book/list.jsp
         */
        pb.setUrl(url);
        req.setAttribute("pb", pb);
        return "jsps/book/list";
    }

    /**
     * 按出版社查询
     * 
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping("/findByPress")
    public String findByPress(HttpServletRequest req, String pc, HttpServletResponse resp)
            throws ServletException, IOException {
        /*
         * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
         */
        int pc2 = getPc(pc);
        /*
         * 2. 得到url：...
         */
        String url = getUrl(req);
        /*
         * 3. 获取查询条件，本方法就是cid，即分类的id
         */
        String press = req.getParameter("press");
        /*
         * 4. 使用pc和cid调用service#findByCategory得到PageBean
         */
        PageBean<Book> pb = bookService.findByPress(press, pc2);
        /*
         * 5. 给PageBean设置url，保存PageBean，转发到/jsps/book/list.jsp
         */
        pb.setUrl(url);
        req.setAttribute("pb", pb);
        return "jsps/book/list";
    }

    /**
     * 按图名查
     * 
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping("/findByname")
    public String findByBname(HttpServletRequest req,String pc, HttpServletResponse resp) throws ServletException, IOException {
        /*
         * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
         */
        int pc2 = getPc(pc);
        /*
         * 2. 得到url：...
         */
        String url = getUrl(req);
        /*
         * 3. 获取查询条件，本方法就是cid，即分类的id
         */
        String bname = req.getParameter("bname");
        /*
         * 4. 使用pc和cid调用service#findByCategory得到PageBean
         */
        PageBean<Book> pb = bookService.findByBname(bname, pc2);
        /*
         * 5. 给PageBean设置url，保存PageBean，转发到/jsps/book/list.jsp
         */
        pb.setUrl(url);
        req.setAttribute("pb", pb);
        return "jsps/book/list";
    }

    /**
     * 多条件组合查询
     * 
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping("/findBycombination")
    public String findByCombination(HttpServletRequest req, String pc,Book criteria)
            throws ServletException, IOException {
        /*
         * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
         */
        int pc2 = getPc(pc);
        /*
         * 2. 得到url：...
         */
        String url = getUrl(req);
        /*
         * 3. 获取查询条件，本方法就是cid，即分类的id
         */
        /*
         * 4. 使用pc和cid调用service#findByCategory得到PageBean
         */
        PageBean<Book> pb = bookService.findByCombination(criteria, pc2);
        /*
         * 5. 给PageBean设置url，保存PageBean，转发到/jsps/book/list.jsp
         */
        pb.setUrl(url);
        req.setAttribute("pb", pb);
        return "jsps/book/list";
    }
}
