package com.wust.boyaBookStore.mapper;

import com.wust.boyaBookStore.po.Cartitem;
import com.wust.boyaBookStore.po.CartitemExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CartitemMapper {
    int countByExample(CartitemExample example);

    int deleteByExample(CartitemExample example);

    int deleteByPrimaryKey(String cartitemid);

    int insert(Cartitem record);

    int insertSelective(Cartitem record);

    List<Cartitem> selectByExample(CartitemExample example);

    Cartitem selectByPrimaryKey(String cartitemid);

    int updateByExampleSelective(@Param("record") Cartitem record, @Param("example") CartitemExample example);

    int updateByExample(@Param("record") Cartitem record, @Param("example") CartitemExample example);

    int updateByPrimaryKeySelective(Cartitem record);

    int updateByPrimaryKey(Cartitem record);
}