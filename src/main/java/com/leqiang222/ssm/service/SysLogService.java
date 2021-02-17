package com.leqiang222.ssm.service;

import com.github.pagehelper.PageInfo;
import com.leqiang222.ssm.entity.SysLog;

import java.util.List;

/**
 * @Description: SysLogService$
 * @Author leqiang222
 * @Date: 2021/2/17$ 1:14 下午$
 */
public interface SysLogService {

    int save(SysLog sysLog);

    List<SysLog> findAll(Integer page, Integer size);
}
