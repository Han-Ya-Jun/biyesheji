package com.wust.boyaBookStore.service.impl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import com.wust.boyaBookStore.mapper.CategoryMapper;
import com.wust.boyaBookStore.po.Category;
import com.wust.boyaBookStore.po.CategoryExample;
import com.wust.boyaBookStore.po.CategoryExample.Criteria;
import com.wust.boyaBookStore.service.CategoryService;
public class CategoryServiceImpl implements CategoryService{
    @Autowired
    private CategoryMapper categorymapper;
    @Override
    public List<Category> findAll() throws Exception {
        CategoryExample categoryExample=new CategoryExample();
        Criteria criteria = categoryExample.createCriteria();
        categoryExample.setOrderByClause("orderBy");
        criteria.andPidIsNull();
        List<Category> parents = categorymapper.selectByExample(categoryExample);
        
        /*
         *  循环遍历所有的一级分类，为每个一级分类加载它的二级分类 
         */
        
        for(Category parent : parents) {
            // 查询出当前父分类的所有子分类
            CategoryExample categoryExample2=new CategoryExample();
            categoryExample2.setOrderByClause("orderBy");
            Criteria criteria2 = categoryExample2.createCriteria();
            criteria2.andPidEqualTo(parent.getCid());
            List<Category> children =categorymapper.selectByExample(categoryExample2);
            // 设置给父分类
            parent.setChildren(children);
        }
        return parents;
       
    }
    @Override
    public List<Category> findParents() {
        CategoryExample categoryExample=new CategoryExample();
        categoryExample.setOrderByClause("orderBy");
        Criteria criteria = categoryExample.createCriteria();
        criteria.andPidIsNull();
        List<Category> parents = categorymapper.selectByExample(categoryExample);
        return parents;
    }
    @Override
    public List<Category> findChildren(String pid) {
        CategoryExample categoryExample=new CategoryExample();
        categoryExample.setOrderByClause("orderBy");
        Criteria criteria = categoryExample.createCriteria();
        criteria.andPidEqualTo(pid);
        List<Category> parents = categorymapper.selectByExample(categoryExample);
        return parents;
    }
    @Override
    public void add(Category parent) {
     
        if(parent.getParent() != null) {
           parent.setPid(parent.getParent().getCid());
        }
       categorymapper.insertSelective(parent);
    }
    @Override
    public Category load(String cid) {
      
        Category category = categorymapper.selectByPrimaryKey(cid);
       
        return category;
    }
    @Override
    public void edit(Category parent) {

        if(parent.getParent() != null) {
            parent.setPid(parent.getParent().getCid());
        }
        categorymapper.updateByPrimaryKeySelective(parent);
    }
    @Override
    public int findChildrenCountByParent(String cid) {
        CategoryExample categoryExample=new CategoryExample();
        Criteria criteria = categoryExample.createCriteria();
        criteria.andCidEqualTo(cid);
        int byExample = categorymapper.countByExample(categoryExample);
        return byExample;
    }
    @Override
    public void delete(String cid) {
        // TODO Auto-generated method stub
        
    }
   
}
