package com.leqiang222.ssm.dao;

import com.leqiang222.ssm.entity.User;
import com.sun.org.apache.xml.internal.utils.NSInfo;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (User)表数据库访问层
 *
 * @author makejava
 * @since 2020-04-05 19:04:01
 */
public interface UserDao {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    User queryById(Long id);

    User queryByUsername(String username);

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
     * @Description: 查询指定行数据，service使用pagehelp插件，无需limit、offset
     * @Author-Date: leqiang222 2021/1/24 11:04 下午
     */

    List<User> queryAllWithPagehelp();

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<User> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param user 实例对象
     * @return 对象列表
     */
    List<User> queryAll(User user); 

    /**
     * 新增数据
     *
     * @param user 实例对象
     * @return 影响行数
     */
    int insert(User user);

    /**
     * 修改数据
     *
     * @param user 实例对象
     * @return 影响行数
     */
    int update(User user);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(Long id);

    /**
     * 给用户添加角色数组
     * @param userId
     * @param roleIds
     */
    void addRoleToUser(@Param("userId") String userId, @Param("roleId") String[] roleIds);
}