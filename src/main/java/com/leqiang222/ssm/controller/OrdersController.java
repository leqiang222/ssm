package com.leqiang222.ssm.controller;

import com.github.pagehelper.PageInfo;
import com.leqiang222.ssm.entity.Orders;
import com.leqiang222.ssm.service.OrdersService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Orders)表控制层
 *
 * @author makejava
 * @since 2020-04-05 15:02:23
 */
@Controller
@RequestMapping("orders")
public class OrdersController {
    /**
     * 服务对象
     */
    @Resource
    private OrdersService ordersService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public Orders selectOne(String id) {
        return this.ordersService.queryById(id);
    }

    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page,
                                @RequestParam(name = "size", required = true, defaultValue = "5") Integer size)
            throws Exception {

        List<Orders> ordersList = ordersService.queryAllByLimit((page - 1) * size, size);
        Integer total = ordersService.queryOrdersCount();

        ModelAndView mv = new ModelAndView();

        //PageInfo就是一个分页Bean
        PageInfo pageInfo = new PageInfo(ordersList);
        pageInfo.setPageSize(size); // 一页个数
        pageInfo.setPageNum(page); // 第几页
        pageInfo.setTotal(total); // 总个数
        Integer pages = total % size == 0? total / size: total / size + 1;
        pageInfo.setPages(pages); // 总页数

        mv.addObject("att_pageInfo", pageInfo);
        mv.setViewName("orders-page-list");

        return mv;
    }

    @RequestMapping("/findById.do")
    public ModelAndView findById(@RequestParam(name = "id", required = true) String ordersId) throws Exception {
        ModelAndView mv = new ModelAndView();
        Orders orders = ordersService.queryById(ordersId);
        mv.addObject("att_orders",orders);
        mv.setViewName("orders-show");
        return mv;
    }
}