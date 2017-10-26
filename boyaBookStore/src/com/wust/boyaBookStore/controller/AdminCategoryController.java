package com.wust.boyaBookStore.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wust.boyaBookStore.po.Category;
import com.wust.boyaBookStore.service.BookService;
import com.wust.boyaBookStore.service.CategoryService;

import cn.itcast.commons.CommonUtils;
@Controller
public class AdminCategoryController {
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private BookService bookService;

    /**
     * 查询所有分类
     * 
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping("/findAllAdmin")
    public String findAll(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        req.setAttribute("parents", categoryService.findAll());
        return "adminjsps/admin/category/list";
    }

    /**
     * 添加一级分类
     * 
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping("/addParent")
    public String addParent(HttpServletRequest req, Category parent, HttpServletResponse resp) throws Exception, IOException {
        /*
         * 1. 封装表单数据到Category中 2. 调用service的add()方法完成添加 3. 调用findAll()，返回list显示所有分类
         */
        parent.setCid(CommonUtils.uuid());// 设置cid
        categoryService.add(parent);
        return findAll(req, resp);
    }
    @RequestMapping("/addChild")
    public String addChild(HttpServletRequest req,Category child,  String pid , HttpServletResponse resp) throws Exception, IOException {
       
        child.setCid(CommonUtils.uuid());// 设置cid
        Category parent = new Category();
        parent.setCid(pid);
        child.setParent(parent);
        categoryService.add(child);
        return findAll(req, resp);
    }

    /**
     * 添加第二分类：第一步
     * 
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping("/addChildPre")
    public String addChildPre(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pid = req.getParameter("pid");// 当前点击的父分类id
        List<Category> parents = categoryService.findParents();
        req.setAttribute("pid", pid);
        req.setAttribute("parents", parents);

        return "adminjsps/admin/category/add2";
    }

    /**
     * 修改一级分类：第一步
     * 
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping("/editParentPre")
    public String editParentPre(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /*
         * 1. 获取链接中的cid 2. 使用cid加载Category 3. 保存Category 4. 转发到edit页面显示Category
         */
        String cid = req.getParameter("cid");
        Category parent = categoryService.load(cid);
        req.setAttribute("parent", parent);
        return "adminjsps/admin/category/edit";
    }

    /**
     * 修改一级分类：第二步
     * 
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping("/editPatent")
    public String editParent(HttpServletRequest req,  Category parent,HttpServletResponse resp) throws Exception, IOException {
     
        categoryService.edit(parent);
        return findAll(req, resp);
    }

    /**
     * 修改二级分类：第一步
     * 
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping("/editChildPre")
    public String editChildPre(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /*
         * 1. 获取链接参数cid，通过cid加载Category，保存之 2. 查询出所有1级分类，保存之 3. 转发到edit2
         */
        String cid = req.getParameter("cid");
        Category child = categoryService.load(cid);
        req.setAttribute("child", child);
        req.setAttribute("parents", categoryService.findParents());

        return "adminjsps/admin/category/edit2";
    }

    /**
     * 修改二级分类：第二步
     * 
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping("/editChild")
    public String editChild(HttpServletRequest req, Category child ,HttpServletResponse resp) throws Exception, IOException {
        /*
         * 1. 封装表单参数到Category child 2. 把表单中的pid封装到child, ... 3. 调用service.edit()完成修改 4. 返回到list
         */
        String pid = req.getParameter("pid");
        Category parent = new Category();
        parent.setCid(pid);
        child.setParent(parent);

        categoryService.edit(child);
        return findAll(req, resp);
    }

    /**
     * 删除一级分类
     * 
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping("/deletePatent")
    public String deleteParent(HttpServletRequest req, HttpServletResponse resp) throws Exception{
        /*
         * 1. 获取链接参数cid，它是一个1级分类的id 2. 通过cid，查看该父分类下子分类的个数 3. 如果大于零，说明还有子分类，不能删除。保存错误信息，转发到msg 4.
         * 如果等于零，删除之，返回到list
         */
        String cid = req.getParameter("cid");
        int cnt = categoryService.findChildrenCountByParent(cid);
        if (cnt > 0) {
            req.setAttribute("msg", "该分类下还有子分类，不能删除！");
            return "adminjsps/msg";
        } else {
            categoryService.delete(cid);
            return findAll(req, resp);
        }
    }

    /**
     * 删除2级分类
     * 
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping("/deleteChild")
    public String deleteChild(HttpServletRequest req, HttpServletResponse resp) throws Exception, IOException {
        /*
         * 1. 获取cid，即2级分类id 2. 获取该分类下的图书个数 3. 如果大于零，保存错误信息，转发到msg 4. 如果等于零，删除之，返回到list
         */
        String cid = req.getParameter("cid");
        int cnt = bookService.findBookCountByCategory(cid);
        if (cnt > 0) {
            req.setAttribute("msg", "该分类下还存在图书，不能删除！");
            return "adminjsps/msg";
        } else {
            categoryService.delete(cid);
            return findAll(req, resp);
        }
    }
}
