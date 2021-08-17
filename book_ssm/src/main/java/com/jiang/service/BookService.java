package com.jiang.service;

import com.jiang.pojo.Books;
import com.jiang.pojo.Page;
import org.apache.ibatis.annotations.Param;

import java.awt.print.Book;
import java.util.List;

/*
@project name ssmbuild
@author jiang
@time   2021-06-21-21:34

*/
public interface BookService {
    //增加一本书
    int addBook(Books books);

    //删除一本书
    int deleteBookById(int id);

    //更新一本书
    int updateBook(Books books);

    //查询一本书
    Books queryBookById(@Param("bookId") int id);

    //查询全部的书
    List<Books> queryAllBooks();

    Page<Books> page(int pageNo, int pageSize);

    Page<Books> pageByPrice(int pageNo, int pageSize, int min, int max);
}
