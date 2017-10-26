package com.wust.boyaBookStore.po;

import java.math.BigDecimal;


public class Orderitem {

    private String orderitemid;

    private Integer quantity;

    private BigDecimal subtotal;

    private String bid;

    private String bname;

    private BigDecimal currprice;
    private Order order;// 所属的订单

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    private String imageB;
    private Book book;// 所关联的Book

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    private String oid;

    public String getOrderitemid() {
        return orderitemid;
    }

    public void setOrderitemid(String orderitemid) {
        this.orderitemid = orderitemid == null ? null : orderitemid.trim();
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(BigDecimal subtotal) {
        this.subtotal = subtotal;
    }

    public String getBid() {
        return bid;
    }

    public void setBid(String bid) {
        this.bid = bid == null ? null : bid.trim();
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname == null ? null : bname.trim();
    }

    public BigDecimal getCurrprice() {
        return currprice;
    }

    public void setCurrprice(BigDecimal currprice) {
        this.currprice = currprice;
    }

    public String getImageB() {
        return imageB;
    }

    public void setImageB(String imageB) {
        this.imageB = imageB == null ? null : imageB.trim();
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid == null ? null : oid.trim();
    }
}
