package com.leqiang222.ssm.entity;

import com.leqiang222.ssm.utils.DateUtils;
import lombok.Data;

import java.util.Date;

/**
 * @Description: SysLog$
 * @Author leqiang222
 * @Date: 2021/2/17$ 1:12 下午$
 */

@Data
public class SysLog {
    private Integer id;
    private Date visitTime;
    private String visitTimeStr;
    private String username;
    private String ip;
    private String url;
    private double executionTime; // 执行市场
    private String method;

    public String getVisitTimeStr() {
        if(visitTime != null){
            visitTimeStr= DateUtils.date2String(visitTime,"yyyy-MM-dd HH:mm:ss");
        }
        return visitTimeStr;
    }
}
