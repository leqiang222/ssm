package com.leqiang222.ssm.controller;

import com.github.pagehelper.PageInfo;
import com.leqiang222.ssm.entity.SysLog;
import com.leqiang222.ssm.service.SysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @Description: SysLogController$
 * @Author leqiang222
 * @Date: 2021/2/17$ 1:43 下午$
 */
@Controller
@RequestMapping("/sysLog")
public class SysLogController {
    @Autowired
    private SysLogService sysLogService;

    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page,
                                @RequestParam(name = "size", required = true, defaultValue = "20") Integer size) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<SysLog> sysLogs = sysLogService.findAll(page, size);
        PageInfo pageInfo = new PageInfo(sysLogs);
        mv.addObject("att_pageInfo", pageInfo);
        mv.setViewName("syslog-list");
        return mv;
    }
}
