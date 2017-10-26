package com.wust.boyaBookStore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.wust.boyaBookStore.mapper.BookMapper;
import com.wust.boyaBookStore.mapper.OrderMapper;
import com.wust.boyaBookStore.mapper.OrderitemMapper;
import com.wust.boyaBookStore.po.Book;
import com.wust.boyaBookStore.po.Order;
import com.wust.boyaBookStore.po.OrderExample;
import com.wust.boyaBookStore.po.OrderExample.Criteria;
import com.wust.boyaBookStore.po.Orderitem;
import com.wust.boyaBookStore.po.OrderitemExample;
import com.wust.boyaBookStore.po.PageBean;
import com.wust.boyaBookStore.po.PageConstants;
import com.wust.boyaBookStore.service.OrderService;
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private OrderitemMapper orderitemMapper;
    @Autowired
    private BookMapper bookMapper;
    @Override
    public PageBean<Order> findAll(int pc) {
       OrderExample orderExample=new OrderExample();
       Criteria criteria = orderExample.createCriteria();
       criteria.andOidIsNotNull();
       int total = orderMapper.countByExample(orderExample);
       orderExample.setPc((pc-1)*PageConstants.ORDER_PAGE_SIZE);
       orderExample.setPagesize(PageConstants.ORDER_PAGE_SIZE);
       List<Order> list = orderMapper.selectByExampleWithPage(orderExample);
      PageBean<Order>pageBean=new PageBean<Order>();
       pageBean.setBeanList(list);
       pageBean.setPc(pc);
       pageBean.setTr(total);
       pageBean.setPs(PageConstants.BOOK_PAGE_SIZE);
       return pageBean;
    }
    @Override
    public PageBean<Order> findByStatus(int status, int pc) {
        OrderExample orderExample=new OrderExample();
        Criteria criteria = orderExample.createCriteria();
        criteria.andStatusEqualTo(status);
        int total = orderMapper.countByExample(orderExample);
        orderExample.setPc((pc-1)*PageConstants.ORDER_PAGE_SIZE);
        orderExample.setPagesize(PageConstants.ORDER_PAGE_SIZE);
        List<Order> list = orderMapper.selectByExampleWithPage(orderExample);
        PageBean<Order> pageBean=new PageBean<>();
        pageBean.setBeanList(list);
        pageBean.setPc(pc);
        pageBean.setTr(total);
        pageBean.setPs(PageConstants.BOOK_PAGE_SIZE);
        return pageBean;
    }
    @Override
    public Order load(String oid) {
       Order order = orderMapper.selectByPrimaryKey(oid);
       OrderitemExample orderitemExample=new OrderitemExample();
       com.wust.boyaBookStore.po.OrderitemExample.Criteria criteria = orderitemExample.createCriteria();
       criteria.andOidEqualTo(oid);
       
       List<Orderitem> list = orderitemMapper.selectByExample(orderitemExample);
       for (int i=0;i<list.size();i++) {
           Book book = bookMapper.selectByPrimaryKey(list.get(i).getBid());
           list.get(i).setBook(book);
           Order order2 = orderMapper.selectByPrimaryKey(list.get(i).getOid());
           list.get(i).setOrder(order2);
        }
        order.setOrderItemList(list);
        return order;
    }
    @Override
    public void updateStatus(String oid, int i) {
        Order order=new Order();
        order.setOid(oid);
        order.setStatus(i);
        orderMapper.updateByPrimaryKeySelective(order);
        
    }
    @Override
    public void createOrder(Order order) {
       
        /*
         * 1. 插入订单
         */
         orderMapper.insertSelective(order);
        
        /*
         * 2. 循环遍历订单的所有条目,让每个条目生成一个Object[]
         * 多个条目就对应Object[][]
         * 执行批处理，完成插入订单条目
         */
        int len = order.getOrderItemList().size();
        for(int i = 0; i < len; i++){
            Orderitem item = order.getOrderItemList().get(i);
            
           orderitemMapper.insertSelective(item);
        }
    }
    @Override
    public PageBean<Order> myOrders(String uid, int pc) {
        OrderExample orderExample=new OrderExample();
        Criteria criteria = orderExample.createCriteria();
        criteria.andUidEqualTo(uid);
        int total = orderMapper.countByExample(orderExample);
        orderExample.setPc((pc-1)*PageConstants.ORDER_PAGE_SIZE);
        orderExample.setPagesize(PageConstants.ORDER_PAGE_SIZE);
        orderExample.setOrderByClause("ordertime");
        List<Order> list = orderMapper.selectByExampleWithPage(orderExample);
        PageBean<Order> pageBean=new PageBean<>();
        pageBean.setBeanList(list);
        pageBean.setPc(pc);
        pageBean.setTr(total);
        pageBean.setPs(PageConstants.BOOK_PAGE_SIZE);
        return pageBean;
    }

}
