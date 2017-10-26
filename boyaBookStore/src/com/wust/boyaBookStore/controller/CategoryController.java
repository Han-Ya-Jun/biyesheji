package com.wust.boyaBookStore.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.wust.boyaBookStore.po.Category;
import com.wust.boyaBookStore.service.CategoryService;


/**
 * @ClassName CategoryController
 * @Description TODO(分类持久层)
 * @author hanyajun
 * @Date 2017年5月10日 下午9:18:54
 * @version 1.0.0
 */
@Controller
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    /**
     * 查询所有分类
     */
    @RequestMapping("/findAll")
    public String findAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /*
         * 1. 通过service得到所有的分类 2. 保存到request中，转发到left.jsp
         */
        try {
            List<Category> parents = categoryService.findAll();
            req.setAttribute("parents", parents);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "jsps/left";
    }
    
    @ModelAttribute("parents2")
    public List<Category> getclassType() throws Exception {
        List<Category> parents2 = categoryService.findAll();
        return parents2;
    }
}
