package com.leqiang222.ssm.dao;

import com.leqiang222.ssm.entity.Permission;

/**
 * @Description: PermissioDao$
 * @Author leqiang222
 * @Date: 2021/1/25$ 11:21 下午$
 */
public interface PermissionDao {
    Permission queryById(String id);
}
