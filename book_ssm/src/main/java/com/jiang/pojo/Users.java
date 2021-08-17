package com.jiang.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
@project name ssmbuild
@author jiang
@time   2021-08-08-16:09

*/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Users {

     public Integer id;
     public String username;
     public String password;
     public String email;

     public Users(String username,String password){
          this.username = username;
          this.password = password;
     }
}
