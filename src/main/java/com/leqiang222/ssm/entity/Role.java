package com.leqiang222.ssm.entity;

import lombok.Data;
import lombok.ToString;

import java.io.Serializable;
import java.util.List;

/**
 * (Role)实体类
 *
 * @author makejava
 * @since 2020-04-06 11:22:39
 */
@Data
@ToString
public class Role implements Serializable {
    private static final long serialVersionUID = -20951317211142455L;
    
    private Long id;
    
    private String roleName;
    
    private String roleDesc;

    private List<Permission> permissions;
}