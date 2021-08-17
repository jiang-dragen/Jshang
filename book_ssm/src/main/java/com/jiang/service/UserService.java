package com.jiang.service;

import com.jiang.pojo.Users;

/*
@project name ssmbuild
@author jiang
@time   2021-08-08-16:32

*/
public interface UserService {

     Users queryUser(String username , String password);

     int insertUser(Users users);

     boolean existUserName(String username);

}
