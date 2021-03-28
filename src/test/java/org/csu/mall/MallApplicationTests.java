package org.csu.mall;

import org.csu.mall.entity.User;
import org.csu.mall.persistence.UserMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class MallApplicationTests {

    @Autowired
    private UserMapper userMapper;

    @Test
    void contextLoads() {
    }

    @Test
    void testDemo(){
        User user = userMapper.selectById(1);

        System.out.println(user);
    }

}
