package com.jiang.controller;

import com.google.code.kaptcha.Constants;
import com.jiang.pojo.Users;
import com.jiang.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/*
@project name ssmbuild
@author jiang
@time   2021-08-11-17:38

*/
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/toRegister")
    public String toRegister() {
        return "user/register";
    }

    @RequestMapping("/login")
    public String login(@Param("username") String username, @Param("password") String password, Model model ,HttpServletRequest request) {

        Users b = userService.queryUser(username, password);
        if (b != null) {
            request.getSession().setAttribute("username",b);
            return "redirect:/book/allBooks";
        } else {
            String msg = "密码或账号错误";
            model.addAttribute("msg",msg);
            return "user/login";
        }
    }

    @RequestMapping("/registerCode")
    public ModelAndView register(Users user, @RequestParam("code") String code, HttpServletRequest request, ModelAndView modelAndView) {
        //获取session中验证码
        String token = (String) request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
        //删除session中的验证码,以便下一次验证
        request.getSession().removeAttribute(Constants.KAPTCHA_SESSION_KEY);


        if (token != null && token.equals(code)) {
            if (userService.existUserName(user.getUsername())) {
                modelAndView.addObject("msg", "用户名已存在");
                modelAndView.addObject("username", user.getUsername());
                modelAndView.addObject("password", user.getPassword());

                modelAndView.setViewName("user/register");

                return modelAndView;
            } else {

                userService.insertUser(user);

                modelAndView.setViewName("user/register_success");

                return modelAndView;
            }
        } else {

            modelAndView.addObject("msg", "验证码错误");
            modelAndView.addObject("username", user.getUsername());
            modelAndView.addObject("password", user.getPassword());
            modelAndView.setViewName("user/register");
            return modelAndView;

        }
    }

    @RequestMapping("/ajaxRegister")
    @ResponseBody
    public String ajaxRegister(String username){
        boolean existUserName = userService.existUserName(username);

        String msg = "";

        if (existUserName){
            msg = "true";
        }else {
            msg = "false";
        }

        return msg;
    }

    @GetMapping("/index")
    public String index(){
        return "user/login";
    }
}
