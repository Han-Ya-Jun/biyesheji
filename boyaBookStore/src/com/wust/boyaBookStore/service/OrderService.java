package com.wust.boyaBookStore.service;

import com.wust.boyaBookStore.po.Order;
import com.wust.boyaBookStore.po.PageBean;

public interface OrderService {

    // 查询所有订单
    public PageBean<Order> findAll(int pc);
    // 按状态查询订单
    public PageBean<Order> findByStatus(int status, int pc);
    //查看订单详情
    public Order load(String oid);
    //更新订单状态
    public void updateStatus(String oid, int i);
    //创建订单
    public void createOrder(Order order);
    //得到我的订单
    public PageBean<Order> myOrders(String uid, int pc);

}
