package com.leqiang222.ssm.service.impl;

import com.leqiang222.ssm.entity.User;
import com.leqiang222.ssm.dao.UserDao;
import com.leqiang222.ssm.service.UserService;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (User)表服务实现类
 *
 * @author makejava
 * @since 2020-04-05 19:04:01
 */
@Service("userService")
public class UserServiceImpl implements UserService {
    @Resource
    private UserDao userDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    public User queryById(Long id) {
        return this.userDao.queryById(id);
    }

    /**
     * @Description: 根据账号密码查询用户
     * @Author-Date: leqiang222 2021/1/13 9:26 下午
     */
    public User queryByUserNamePassword(String userName, String password) {
        return this.userDao.queryByUserNamePassword(userName, password);
    }

    public Integer queryUserCount() {
        return this.userDao.queryUserCount();
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    public List<User> queryAllByLimit(int offset, int limit) {
        return this.userDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param user 实例对象
     * @return 实例对象
     */
    public User insert(User user) {
        this.userDao.insert(user);
        return user;
    }

    /**
     * 修改数据
     *
     * @param user 实例对象
     * @return 实例对象
     */
    public User update(User user) {
        this.userDao.update(user);
        return this.queryById(user.getId());
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    public boolean deleteById(Long id) {
        return this.userDao.deleteById(id) > 0;
    }


    public void addRoleToUser(String userId, String[] roleIds) {
        userDao.addRoleToUser(userId, roleIds);
    }

    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        User userInfo = null;
        try {
            User user = new User();
            user.setUserName(s);
            List<User> list = userDao.queryAll(user);
            if (list.size() == 1) {
                userInfo = list.get(0);
            }else {
                userInfo = null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (userInfo == null) {
            return null;
        }

        //处理自己的用户对象封装成UserDetails
        org.springframework.security.core.userdetails.User user =
                new org.springframework.security.core.userdetails.User(userInfo.getUserName(),
                        userInfo.getPassword(),
                        userInfo.getStatus() == 0 ? false : true,
                        true,
                        true,
                        true,
                        null);

        return user;
    }
}