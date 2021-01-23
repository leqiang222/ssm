package com.leqiang222.ssm.dao;

import com.leqiang222.ssm.entity.Orders;
import org.springframework.stereotype.Repository;

/**
 * @Description: MemberDao$
 * @Author leqiang222
 * @Date: 2021/1/23$ 4:37 下午$
 */
@Repository(value = "memberDao")
public interface MemberDao {
    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Orders queryById(String id);
}
