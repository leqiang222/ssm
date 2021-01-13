package com.leqiang222.ssm.controller;

import com.leqiang222.ssm.entity.User;
import com.leqiang222.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 账号管理
 */
@Controller
@RequestMapping("/account")
public class AccountController {
    @Autowired
    private UserService userService;

    @RequestMapping("/login.do")
    public ModelAndView loginByUserNamePassword(String userName, String password) throws Exception {
        ModelAndView mv = new ModelAndView();
        User userInfo = userService.queryByUserNamePassword(userName, password);
        mv.addObject("user", userInfo);
        mv.setViewName("main");
        return mv;
    }
}
