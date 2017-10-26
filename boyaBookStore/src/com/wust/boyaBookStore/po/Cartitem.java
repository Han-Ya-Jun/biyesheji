package com.wust.boyaBookStore.po;

import java.math.BigDecimal;

public class Cartitem {

    private String cartitemid;

    private Integer quantity;

    private String bid;

    private String uid;
    
    private Book book;// 条目对应的图书

    private User user;
    
    private double subtotal;
    
  


    public User getUser() {
        return user;
    }

    
    public void setUser(User user) {
        this.user = user;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    private Integer orderby;

    public String getCartitemid() {
        return cartitemid;
    }

    
    public void setSubtotal() {
        BigDecimal b1 = new BigDecimal(book.getCurrprice() + "");
        BigDecimal b2 = new BigDecimal(quantity + "");
        BigDecimal b3 = b1.multiply(b2);
        subtotal= b3.doubleValue();
    }


    // 添加小计方法
    public double getSubtotal() {
        /*
         * 使用BigDecimal不会有误差 要求必须使用String类型构造器
         */
       
        return subtotal;
    }

    public void setCartitemid(String cartitemid) {
        this.cartitemid = cartitemid == null ? null : cartitemid.trim();
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getBid() {
        return bid;
    }

    public void setBid(String bid) {
        this.bid = bid == null ? null : bid.trim();
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid == null ? null : uid.trim();
    }

    public Integer getOrderby() {
        return orderby;
    }

    public void setOrderby(Integer orderby) {
        this.orderby = orderby;
    }
}
