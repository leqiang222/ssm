package com.leqiang222.test;

import com.leqiang222.ssm.dao.OrdersDao;
import com.leqiang222.ssm.dao.ProductDao;
import com.leqiang222.ssm.dao.UserDao;
import com.leqiang222.ssm.entity.Orders;
import com.leqiang222.ssm.entity.Product;
import com.leqiang222.ssm.entity.User;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class Test03SpringMabatis {
//    @Autowired
//    private ProductDao productDao;
//    @Autowired
//    private OrdersDao ordersDao;
//    @Autowired
//    private UserDao userDao;

    @Before
    public void before() {
        System.out.println("llq001: 开始测试");
    }

    @After
    public void after() {
        System.out.println("llq002: 结束测试");
    }

    @Test
    public void testFindAll01() throws Exception {
//        List<Product> listProduct = productDao.queryAll(null);
//        System.out.println(listProduct);
//
//
//        User user = userDao.queryById(1L);
//        System.out.println(user);

//        Product product = new Product();
//        product.setCityName("3");
//        product.setProductNum("rrr-01");
//        productDao.insert(product);
    }
}
