package com.jiang.service;

import com.jiang.dao.UserMapper;
import com.jiang.pojo.Users;
import org.springframework.beans.factory.annotation.Autowired;

/*
@project name ssmbuild
@author jiang
@time   2021-08-08-16:33

*/
public class UserServiceImpl implements UserService{

    private UserMapper userMapper;

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    public Users queryUser(String username , String password) {
        if (username == null || password == null){
            return null;
        }
        return userMapper.queryUser(username,password);
    }

    public int insertUser(Users users) {
        return userMapper.insertUser(users);
    }

    public boolean existUserName(String username) {
        if (userMapper.existUserName(username) == null){
            return false;
        }
        return true;
    }
}
