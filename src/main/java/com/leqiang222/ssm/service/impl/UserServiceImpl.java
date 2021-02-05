package com.leqiang222.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.leqiang222.ssm.entity.Role;
import com.leqiang222.ssm.entity.User;
import com.leqiang222.ssm.dao.UserDao;
import com.leqiang222.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
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
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

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

    public List<User> queryAll(Integer page, Integer size) {
        PageHelper.startPage(page, size);
        return this.userDao.queryAllWithPagehelp();
    }

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


    public void addRoleToUser(Long userId, Long[] roleIds) {
        for(Long roleId:roleIds){
            userDao.addRoleToUser(userId, roleId);
        }
    }

    public List<Role> findOtherRoles(Long userId) {
        return this.userDao.findOtherRoles(userId);
    }

    /**
     * @Description: Spring Security 实现获取用户信息
     * @Param: 
     * @Author-Date: leqiang222 2021/1/26 9:25 下午 
     */
     
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        //
        User userInfo = null;
        try {
            userInfo = this.userDao.queryByUsername(username);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (userInfo == null) {
            return null;
        }

        // 处理自己的用户对象封装成UserDetails
        org.springframework.security.core.userdetails.User user =
                new org.springframework.security.core.userdetails.User(userInfo.getUserName(),
                        userInfo.getPassword(),
                        userInfo.getStatus() == 0 ? false : true,
                        true,
                        true,
                        true,
                        getAuthority(userInfo.getRoles()));

        return user;
    }

    //作用就是返回一个List集合，集合中装入的是角色描述
    public List<SimpleGrantedAuthority> getAuthority(List<Role> roles) {

        List<SimpleGrantedAuthority> list = new ArrayList<SimpleGrantedAuthority>();
        for (Role role : roles) {
            list.add(new SimpleGrantedAuthority(role.getRoleName()));
        }
        return list;
    }
}