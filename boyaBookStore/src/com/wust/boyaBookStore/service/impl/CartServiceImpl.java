package com.wust.boyaBookStore.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.wust.boyaBookStore.mapper.BookMapper;
import com.wust.boyaBookStore.mapper.CartitemMapper;
import com.wust.boyaBookStore.po.Book;
import com.wust.boyaBookStore.po.Cartitem;
import com.wust.boyaBookStore.po.CartitemExample;
import com.wust.boyaBookStore.po.CartitemExample.Criteria;
import com.wust.boyaBookStore.service.CartService;

import cn.itcast.commons.CommonUtils;
public class CartServiceImpl implements CartService{
    @Autowired
    private CartitemMapper cartitemMapper;
    @Autowired
    private BookMapper bookMapper;
    @Override
    public Cartitem updateQuantity(String cartItemId, int quantity) {
        Cartitem cartitem=new Cartitem();
        cartitem.setCartitemid(cartItemId);
        cartitem.setQuantity(quantity);
        cartitemMapper.updateByPrimaryKeySelective(cartitem);
        Cartitem cartitem2 = cartitemMapper.selectByPrimaryKey(cartItemId);
        Book book = bookMapper.selectByPrimaryKey(cartitem2.getBid());
        cartitem2.setBook(book);
        cartitem2.setSubtotal();
        return cartitem2;
    }

    @Override
    public List<Cartitem> loadCartItems(String cartItemIds) {
        String[] split = cartItemIds.split(",");
        List<String> list=Arrays.asList(split);
        CartitemExample cartitemExample=new CartitemExample();
        Criteria criteria = cartitemExample.createCriteria();
        criteria.andCartitemidIn(list);
        List<Cartitem> example2=new ArrayList<Cartitem>();
        List<Cartitem> example = cartitemMapper.selectByExample(cartitemExample);
        for (Cartitem cartitem : example) {
            Book book = bookMapper.selectByPrimaryKey(cartitem.getBid());
            cartitem.setBook(book);
            cartitem.setSubtotal();
            cartitem.setBid(book.getBid());
            example2.add(cartitem);
        }
        return example2;
    }

    @Override
    public void batchDelete(String cartItemIds) {
        String[] split = cartItemIds.split(",");
        List<String> list=Arrays.asList(split);
        CartitemExample cartitemExample=new CartitemExample();
        Criteria criteria = cartitemExample.createCriteria();
        criteria.andCartitemidIn(list);
        cartitemMapper.deleteByExample(cartitemExample);
    }

    @Override
    public List<Cartitem> myCart(String uid) {
        CartitemExample cartitemExample=new CartitemExample();
        Criteria criteria = cartitemExample.createCriteria();
        criteria.andUidEqualTo(uid);
        cartitemExample.setOrderByClause("orderBy");
        List<Cartitem> list = cartitemMapper.selectByExample(cartitemExample);
        List<Cartitem> example2=new ArrayList<Cartitem>();
        for (Cartitem cartitem : list) {
            Book book = bookMapper.selectByPrimaryKey(cartitem.getBid());
            cartitem.setBook(book);
            cartitem.setSubtotal();
            example2.add(cartitem);
        }
        return example2;
    }

    @Override
    public void add(Cartitem cartItem) {
        try {
            /*
             * 1. 使用uid和bid去数据库中查询这个条目是否存在
             */
            CartitemExample cartitemExample=new CartitemExample();
            Criteria criteria = cartitemExample.createCriteria();
            criteria.andUidEqualTo(cartItem.getUser().getUid());
            criteria.andBidEqualTo(cartItem.getBook().getBid());
            List<Cartitem> example = cartitemMapper.selectByExample(cartitemExample);
            if(example.size()==0) {//如果原来没有这个条目，那么添加条目
                cartItem.setCartitemid(CommonUtils.uuid());;
                cartitemMapper.insertSelective(cartItem);
            } else {//如果原来有这个条目，修改数量
                // 使用原有数量和新条目数量之各，来做为新的数量
                int quantity = cartItem.getQuantity() + example.get(0).getQuantity();
                // 修改这个老条目的数量
                example.get(0).setQuantity(quantity);
                cartitemMapper.updateByPrimaryKeySelective(example.get(0));
            }
        } catch(Exception e) {
            throw new RuntimeException(e);
        } finally {
        }
        
    }

}
