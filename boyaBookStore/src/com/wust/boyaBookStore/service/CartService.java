package com.wust.boyaBookStore.service;

import java.util.List;

import com.wust.boyaBookStore.po.Cartitem;

public interface CartService {
   
    public Cartitem updateQuantity(String cartItemId, int quantity);
    
    public List<Cartitem> loadCartItems(String cartItemIds);
    //批量删除
    public void batchDelete(String cartItemIds);
    //通过用户查询购物车条目
    public List<Cartitem> myCart(String uid);
    //添加购物车
    public void add(Cartitem cartItem);

}
