package com.leqiang222.ssm.controller;

import com.leqiang222.ssm.entity.User;
import com.leqiang222.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * (User)表控制层
 *
 * @author makejava
 * @since 2020-04-05 19:04:01
 */
@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;


//    //给用户添加角色
//    @RequestMapping("/login.do")
//    public String addRoleToUser(@RequestParam(name = "username", required = true) String username,
//                                @RequestParam(name = "password", required = true) String password) {
//        UserDetails userDetails = userService.loadUserByUsername(username);
//
//    }

    //给用户添加角色
    @RequestMapping("/addRoleToUser.do")
    public String addRoleToUser(@RequestParam(name = "userId", required = true) String userId,
                                @RequestParam(name = "ids", required = true) String[] roleIds) {
        userService.addRoleToUser(userId, roleIds);
        return "redirect:findAll.do";
    }

    @RequestMapping("/findAll.do")
    public ModelAndView findAll() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<User> userList = userService.queryAllByLimit(0,0);
        mv.addObject("userList", userList);
        mv.setViewName("user-list");
        return mv;
    }

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public User selectOne(Long id) {
        return this.userService.queryById(id);
    }

}