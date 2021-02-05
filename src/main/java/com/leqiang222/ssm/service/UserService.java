package com.leqiang222.ssm.service;

import com.leqiang222.ssm.entity.Role;
import com.leqiang222.ssm.entity.User;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

/**
 * (User)表服务接口
 *
 * @author makejava
 * @since 2020-04-05 19:04:01
 */
public interface UserService extends UserDetailsService {

    List<User> queryAll(Integer page, Integer size);

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    User queryById(Long id);

    /**
     * @Description: 根据账号密码查询用户
     * @Author-Date: leqiang222 2021/1/13 9:26 下午
     */
    User queryByUserNamePassword(String userName, String password);

    /**
     * @Description: 查询user表个数
     * @Author-Date: leqiang222 2021/1/13 10:13 下午
     */
    Integer queryUserCount();

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<User> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param user 实例对象
     * @return 实例对象
     */
    User insert(User user);

    /**
     * 修改数据
     *
     * @param user 实例对象
     * @return 实例对象
     */
    User update(User user);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean deleteById(Long id);

    /**
     * 给用户添加角色数组
     * @param userId
     * @param roleIds
     */
    void addRoleToUser(Long userId, Long[] roleIds);

    /**
     * @Description: 查找没勾上的角色
     * @Param: 
     * @Author-Date: leqiang222 2021/2/5 11:46 下午 
     */
     
    List<Role> findOtherRoles(Long userId);
}