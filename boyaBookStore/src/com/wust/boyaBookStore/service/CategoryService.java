package com.wust.boyaBookStore.service;

import java.util.List;

import com.wust.boyaBookStore.po.Category;

public interface CategoryService {

    // 查询所有分类
    public List<Category> findAll() throws Exception;

    // 查询一级分类
    public List<Category> findParents();

    // 获取当前图书所属的一级分类下所有2级分类
    public List<Category> findChildren(String pid);

    // 添加分类
    public void add(Category parent);

    // 加载分类
    public Category load(String cid);

    // 编辑分类
    public void edit(Category parent);
   
    //通过cid，查看该父分类下子分类的个数
    public int findChildrenCountByParent(String cid);
   
    //删除一级分类
    public void delete(String cid);

}
