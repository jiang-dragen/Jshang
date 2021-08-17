package com.jiang.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jiang.pojo.Books;
import com.jiang.pojo.Page;
import com.jiang.service.BookService;
import com.jiang.utils.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/*
@project name ssmbuild
@author jiang
@time   2021-06-22-20:10

*/
@Controller
@RequestMapping("/book")
public class BookController {
    @Autowired
    @Qualifier("BookServiceImpl")
    private BookService bookService;

    @RequestMapping("/page")
    public ModelAndView page(ModelAndView modelAndView , HttpServletRequest req,
                             @RequestParam(value = "pageNo",defaultValue = "1") String pageNo){

        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.PAGE_SIZE);

        Page<Books> pageBook = bookService.page(Integer.parseInt(pageNo), pageSize);
        pageBook.setUrl("managerBookController/page");

        modelAndView.addObject("page",pageBook);
        modelAndView.addObject("page",pageBook);
        modelAndView.setViewName("allBook");

        return modelAndView;
    }

    @RequestMapping("/allBooks")
    public String list(@RequestParam(value = "pn" , defaultValue = "1") Integer pn, Model model) {

        PageHelper.startPage(pn, 5);

        List<Books> list = bookService.queryAllBooks();
        //  封装查询后的信息
        PageInfo info = new PageInfo(list, 5);
        model.addAttribute("pageInfo", info);

        return "allBook";
    }

    @RequestMapping("/toAddBook")
    public String toAddPage(){
        return "addBook";
    }

    @RequestMapping("/addBook")
    public String addPage(Books books){

        bookService.addBook(books);

        return "redirect:/book/allBooks";
    }


    @RequestMapping("/deleteBook/{bookId}")
    public String deleteBook(@PathVariable("bookId") int id){

//        System.out.println("---------已进入delete-------");
        bookService.deleteBookById(id);

        return "redirect:/book/allBooks";
    }

    @RequestMapping("/toUpdate/{bookId}")
    public String toUpdatePage(Model model , @PathVariable("bookId") int id){
        Books books = bookService.queryBookById(id);

        model.addAttribute("books",books);//将查询到的books信息放入请求对象中
        return "updateBook";
    }

    @RequestMapping("/updateBook")
    public String updateBook(Books books){

        System.out.println(books);

        bookService.updateBook(books);

        List<Books> books1 = bookService.queryAllBooks();

        return "redirect:/book/allBooks";
    }
}
