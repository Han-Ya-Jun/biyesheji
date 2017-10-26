package com.wust.boyaBookStore.mapper;

import com.wust.boyaBookStore.po.Book;
import com.wust.boyaBookStore.po.BookExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BookMapper {
    int countByExample(BookExample example);

    int deleteByExample(BookExample example);

    int deleteByPrimaryKey(String bid);

    int insert(Book record);

    int insertSelective(Book record);

    List<Book> selectByExample(BookExample example);
    
    List<Book> selectByExampleWithPage(BookExample example);

    Book selectByPrimaryKey(String bid);

    int updateByExampleSelective(@Param("record") Book record, @Param("example") BookExample example);

    int updateByExample(@Param("record") Book record, @Param("example") BookExample example);

    int updateByPrimaryKeySelective(Book record);

    int updateByPrimaryKey(Book record);
}