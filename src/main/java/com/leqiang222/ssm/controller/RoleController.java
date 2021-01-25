package com.leqiang222.ssm.controller;

import com.alibaba.fastjson.JSON;
import com.leqiang222.ssm.entity.Role;
import com.leqiang222.ssm.service.RoleService;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Role)表控制层
 *
 * @author makejava
 * @since 2020-04-06 11:22:39
 */
@RestController
@RequestMapping("role")
public class RoleController {
    /**
     * 服务对象
     */
    @Resource
    private RoleService roleService;

    @RequestMapping("/findAll.do")
    public ModelAndView findAll() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Role> roleList = roleService.findAll();
        mv.addObject("att_roleList", roleList);
        mv.addObject("att_json", JSON.toJSONString(roleList));
        mv.setViewName("role-list");

        return mv;
    }

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @RequestMapping("/findById.do")
    public ModelAndView findById(Long id) {
        ModelAndView mv = new ModelAndView();
        Role role = roleService.queryById(id);
        mv.addObject("att_role", role);
        mv.addObject("att_json", JSON.toJSONString(role));
        mv.setViewName("role-show");

        return mv;
    }

}