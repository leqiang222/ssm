package com.leqiang222.ssm.entity;

import lombok.Data;
import lombok.ToString;

import java.io.Serializable;
import java.util.List;

/**
 * (User)实体类
 *
 * @author makejava
 * @since 2020-04-05 19:04:01
 */
@Data
@ToString
public class User implements Serializable {
    private static final long serialVersionUID = -22644420123121709L;
    
    private Long id;
    
    private String userName;
    
    private String email;
    
    private String password;
    
    private String phoneNum;
    
    private Integer status;

    private List<Role> roles;

    // MARK:
    private String statusStr;

    public String getStatusStr() {
        //状态0 未开启 1 开启
        if (status == 0) {
            statusStr = "未开启";
        } else if (status == 1) {
            statusStr = "开启";
        }
        return statusStr;
    }

}