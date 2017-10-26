package com.wust.boyaBookStore.service;

import java.util.List;

import com.wust.boyaBookStore.po.Book;
import com.wust.boyaBookStore.po.PageBean;

/**
 * @ClassName bookService
 * @Description TODO(图书类接口)
 * @author hanyajun
 * @Date 2017年5月11日 下午11:05:00
 * @version 1.0.0
 */
public interface BookService {

    // 根据bid查找书籍
    public Book load(String bid) throws Exception;
    //查询新书
    public List<Book> findBookBytype(int status);
    // 按分类查
    public PageBean<Book> findByCategory(String cid, int pc);

    // 按作者查
    public PageBean<Book> findByAuthor(String author, int pc);

    // 按出版社查
    public PageBean<Book> findByPress(String press, int pc2);

    // 按书名查
    public PageBean<Book> findByBname(String bname, int pc2);

    // 多条件组合查询
    public PageBean<Book> findByCombination(Book criteria, int pc2);

    // 删除书籍
    public void delete(String bid);

    // 编辑书籍
    public void edit(Book book);

    // 添加书籍
    public void add(Book book);

    // 获取该分类下图书的个数
    public int findBookCountByCategory(String cid);

}
