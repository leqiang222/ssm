package com.leqiang222.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.leqiang222.ssm.dao.SysLogDao;
import com.leqiang222.ssm.entity.SysLog;
import com.leqiang222.ssm.service.SysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description: SysLogServiceImpl$
 * @Author leqiang222
 * @Date: 2021/2/17$ 1:14 下午$
 */
@Service("sysLogService")
public class SysLogServiceImpl implements SysLogService {
    @Autowired
    SysLogDao sysLogDao;

    public int save(SysLog sysLog) {
        return this.sysLogDao.save(sysLog);
    }

    @Override
    public List<SysLog> findAll(Integer page, Integer size) {
        PageHelper.startPage(page, size);
        return this.sysLogDao.findAll();
    }
}
