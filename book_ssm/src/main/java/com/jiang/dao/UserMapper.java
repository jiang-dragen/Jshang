package com.jiang.dao;

import com.jiang.pojo.Users;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/*
@project name ssmbuild
@author jiang
@time   2021-08-08-16:12

*/

public interface UserMapper {

    Users queryUser(@Param("username") String username , @Param("password") String password);

    int insertUser(Users users);

    Users existUserName(@Param("username") String username);

}
