package com.leqiang222.ssm.entity;

import lombok.Data;

/**
 * @Description: 会员
 * @Author leqiang222
 * @Date: 2021/1/23$ 1:30 下午$
 */
@Data
public class Member {
    private String id;
    private String name;
    private String nickname;
    private String phoneNum;
    private String email;
}
