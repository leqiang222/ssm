package com.leqiang222.ssm.entity;

import java.io.Serializable;

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
}