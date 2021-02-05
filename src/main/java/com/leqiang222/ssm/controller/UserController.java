package com.leqiang222.ssm.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.leqiang222.ssm.entity.Role;
import com.leqiang222.ssm.entity.User;
import com.leqiang222.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

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

    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page,
                                @RequestParam(name = "size", required = true, defaultValue = "5") Integer size) throws Exception {


        List<User> userList = userService.queryAll(page, size);

        PageInfo pageInfo = new PageInfo(userList);

        ModelAndView mv = new ModelAndView();
        mv.addObject("att_pageInfo", pageInfo);
        mv.addObject("att_json", JSON.toJSONString(userList));
        mv.setViewName("user-list");

        return mv;
    }

    /**
     * 查询指定id的用户
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping("/findById.do")
    public ModelAndView findById(Integer id) throws Exception {
        ModelAndView mv = new ModelAndView();

        User userInfo = userService.queryById(Long.valueOf(id));

        mv.addObject("user", userInfo);
        mv.addObject("att_json", JSON.toJSONString(userInfo));
        mv.setViewName("user-show");
        return mv;
    }


    /**
     * 查找所有用户
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAll2.do")
    public ModelAndView findAll2(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page,
                                @RequestParam(name = "size", required = true, defaultValue = "5") Integer size) throws Exception {
        List<User> userList = userService.queryAllByLimit((page - 1) * size,size);

        PageInfo pageInfo = new PageInfo(userList);

        ModelAndView mv = new ModelAndView();
        mv.addObject("att_pageInfo", pageInfo);
        mv.addObject("att_json", JSON.toJSONString(userList));
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





    /**
     * 查询用户以及用户可以添加的角色
     * @return
     * @throws Exception
     */
    @RequestMapping("/findUserByIdAndAllRole.do")
    public ModelAndView findUserByIdAndAllRole(@RequestParam(name = "id", required = true) Long userId) throws Exception {
        ModelAndView mv = new ModelAndView();
        //1.根据用户id查询用户
        User userInfo = userService.queryById(Long.valueOf(userId));
//        //2.根据用户id查询可以添加的角色
        List<Role> otherRoles = userService.findOtherRoles(userId);
        mv.addObject("att_user", userInfo);
        mv.addObject("att_roleList", otherRoles);
        mv.addObject("att_json", JSON.toJSONString(otherRoles));
        mv.setViewName("user-role-add");
        return mv;
    }


//    //查询用户以及用户可以添加的角色
//    @RequestMapping("/findUserByIdAndAllRole.do")
//    public ModelAndView findUserByIdAndAllRole(@RequestParam(name = "id", required = true) String userid) throws Exception {
//        ModelAndView mv = new ModelAndView();
//        //1.根据用户id查询用户
//        User userInfo = userService.queryById(Long.valueOf(userid));
//        //2.根据用户id查询可以添加的角色
//        List<Role> otherRoles = userService.findOtherRoles(userid);
//        mv.addObject("user", userInfo);
//        mv.addObject("roleList", otherRoles);
//        mv.setViewName("user-role-add");
//        return mv;
//    }


    /**
     * 给用户添加角色
     * @param userId
     * @param roleIds
     * @return
     */
    @RequestMapping("/addRoleToUser.do")
    public String addRoleToUser(@RequestParam(name = "userId", required = true) Long userId,
                                @RequestParam(name = "ids", required = true) Long[] roleIds) {
        userService.addRoleToUser(userId, roleIds);
        return "redirect:findAll.do";
    }

}