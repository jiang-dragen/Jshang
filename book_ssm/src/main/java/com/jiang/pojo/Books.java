package com.jiang.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
@project name ssmbuild
@author jiang
@time   2021-06-21-20:35

*/
@Data//除了有参构造都有
@AllArgsConstructor//加有参构造，但是无参构造没了
@NoArgsConstructor//加无参构造
public class Books {

    private int bookID;
    private String bookName;
    private int bookCounts;
    private String detail;


}
