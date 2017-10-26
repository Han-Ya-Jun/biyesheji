package com.wust.boyaBookStore.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import com.wust.boyaBookStore.mapper.BookMapper;
import com.wust.boyaBookStore.mapper.CategoryMapper;
import com.wust.boyaBookStore.po.Book;
import com.wust.boyaBookStore.po.BookExample;
import com.wust.boyaBookStore.po.BookExample.Criteria;
import com.wust.boyaBookStore.po.Category;
import com.wust.boyaBookStore.po.PageBean;
import com.wust.boyaBookStore.po.PageConstants;
import com.wust.boyaBookStore.service.BookService;

public class BookServiceImpl implements BookService {

    @Autowired
    private BookMapper bookMapper;
    @Autowired
    private CategoryMapper categoryMapper;
    @Override
    public Book load(String bid) {
        BookExample bookExample = new BookExample();
        Criteria criteria = bookExample.createCriteria();
        criteria.andBidEqualTo(bid);
        List<Book> list = bookMapper.selectByExample(bookExample);
        Book book = list.get(0);  
        Category category = categoryMapper.selectByPrimaryKey(book.getCid());
        book.setCategory(category);
        return book;
    }

    @Override
    public PageBean<Book> findByCategory(String cid, int pc) {
        BookExample bookExample = new BookExample();
        Criteria criteria = bookExample.createCriteria();
        criteria.andCidEqualTo(cid);
        PageBean<Book> pageBean = getpageBeanByExample(bookExample, pc);
        return pageBean;
    }

    @Override
    public PageBean<Book> findByAuthor(String author, int pc) {
        BookExample bookExample = new BookExample();
        Criteria criteria = bookExample.createCriteria();
        criteria.andAuthorLike("%" + author + "%");
        PageBean<Book> pageBean = getpageBeanByExample(bookExample, pc);
        return pageBean;
    }

    @Override
    public PageBean<Book> findByPress(String press, int pc2) {
        BookExample bookExample = new BookExample();
        Criteria criteria = bookExample.createCriteria();
        criteria.andPressLike("%" + press + "%");
        PageBean<Book> pageBean = getpageBeanByExample(bookExample, pc2);
        return pageBean;
    }

    private PageBean<Book> getpageBeanByExample(BookExample bookExample, int pc) {
        int sum = bookMapper.countByExample(bookExample);
        bookExample.setPc((pc - 1) * PageConstants.BOOK_PAGE_SIZE);
        bookExample.setPagesize(PageConstants.BOOK_PAGE_SIZE);
        List<Book> books = bookMapper.selectByExampleWithPage(bookExample);
        PageBean<Book> pb = new PageBean<Book>();
        pb.setBeanList(books);
        pb.setTr(sum);
        pb.setPc(pc);
        pb.setPs(PageConstants.BOOK_PAGE_SIZE);
        return pb;
    }

    @Override
    public PageBean<Book> findByBname(String bname, int pc2) {
        BookExample bookExample = new BookExample();
        Criteria criteria = bookExample.createCriteria();
        criteria.andBnameLike("%" + bname + "%");
        PageBean<Book> pageBean = getpageBeanByExample(bookExample, pc2);
        return pageBean;
    }

    @Override
    public PageBean<Book> findByCombination(Book criteria, int pc2) {
        BookExample bookExample = new BookExample();
        Criteria criteria2 = bookExample.createCriteria();
        if (null == criteria) {
            criteria2.andBidIsNotNull();
        } 
        if (criteria.getBname()!= null&&criteria.getBname().trim().length()>0) {
            criteria2.andBnameLike("%" + criteria.getBname() + "%");
        } 
        if (criteria.getAuthor()!= null&&criteria.getAuthor().trim().length()>0) {
            criteria2.andAuthorLike("%" + criteria.getAuthor() + "%");
        }
        if (criteria.getPress() != null&&criteria.getPress().trim().length()>0) {
            criteria2.andPressLike("%" + criteria.getPress() + "%");
        }
        PageBean<Book> pageBean = getpageBeanByExample(bookExample, pc2);
        return pageBean;
    }

    @Override
    public void delete(String bid) {
        bookMapper.deleteByPrimaryKey(bid);
    }

    @Override
    public void edit(Book book) {
      bookMapper.updateByPrimaryKeySelective(book); 
    }

    @Override
    public void add(Book book) {
      bookMapper.insert(book);
        
    }

    @Override
    public int findBookCountByCategory(String cid) {
        BookExample bookExample = new BookExample();
        Criteria criteria = bookExample.createCriteria();
        criteria.andCidEqualTo(cid);
        return bookMapper.countByExample(bookExample);
    }

    @Override
    public List<Book> findBookBytype(int status) {
        BookExample bookExample = new BookExample();
        Criteria criteria = bookExample.createCriteria();
        criteria.andIsnewEqualTo(status);
        return bookMapper.selectByExample(bookExample);
    }
}
