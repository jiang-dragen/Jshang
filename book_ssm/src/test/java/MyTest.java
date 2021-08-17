import com.jiang.dao.UserMapper;
import com.jiang.pojo.Books;
import com.jiang.pojo.Users;
import com.jiang.service.BookService;
import com.jiang.service.BookServiceImpl;
import com.jiang.service.UserService;
import com.jiang.service.UserServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;


/*
@project name ssmbuild
@author jiang
@time   2021-06-23-0:26

*/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class  MyTest {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserService userService;

    @Test
    public void test1(){

        /*boolean user = userMapper.queryUser("admin", "123456");

        System.out.println(user);*/

        Users admin = userService.queryUser("", "");

        System.out.println(admin);
    }

    @Test
    public void insert(){
         int user = userService.insertUser(new Users(null, "jiang", "123456", "jiang1@qq.com"));

        System.out.println(user);
    }


}
