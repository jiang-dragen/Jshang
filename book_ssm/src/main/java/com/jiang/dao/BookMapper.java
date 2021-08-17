package com.jiang.dao;

import com.jiang.pojo.Books;
import com.jiang.pojo.Users;
import org.apache.ibatis.annotations.Param;

import java.awt.print.Book;
import java.util.List;

/*
@project name ssmbuild
@author jiang
@time   2021-06-21-21:00

*/
public interface BookMapper {
    //增加一本书
    int addBook(Books books);

    //删除一本书
    int deleteBookById(int id);

    //更新一本书
    int updateBook(Books books);

    //查询一本书
    Books queryBookById(@Param("bookId")int id);

    //查询全部的书
    List<Books> queryAllBooks();

    Integer queryForPageTotalCount();

    List<Books> queryForPageItems(@Param("begin") int begin, @Param("pageSize") int pageSize);

    Integer queryForPageTotalCountByPrice(@Param("min") int min, @Param("max")int max);

    List<Books> queryForPageItemsByPrice(@Param("begin") int begin, @Param("pageSize") int pageSize, @Param("min") int min, @Param("max") int max);

}
