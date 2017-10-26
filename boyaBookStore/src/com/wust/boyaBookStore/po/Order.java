package com.wust.boyaBookStore.po;

import java.math.BigDecimal;
import java.util.List;


public class Order {

    private String oid;

    private String ordertime;

    private BigDecimal total;

    private Integer status;

    private String address;

    private String uid;

    private User owner;

    public List<Orderitem> getOrderItemList() {
        return orderItemList;
    }

    public void setOrderItemList(List<Orderitem> orderItemList) {
        this.orderItemList = orderItemList;
    }

    private List<Orderitem> orderItemList;

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid == null ? null : oid.trim();
    }

    public String getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(String ordertime) {
        this.ordertime = ordertime == null ? null : ordertime.trim();
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid == null ? null : uid.trim();
    }
}
