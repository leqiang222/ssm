package com.leqiang222.ssm.dao;

import com.leqiang222.ssm.entity.SysLog;

import java.util.List;

/**
 * @Description: SysLogDao$
 * @Author leqiang222
 * @Date: 2021/2/17$ 1:31 下午$
 */
public interface SysLogDao {
    int save(SysLog sysLog);

    List<SysLog> findAll();
}
