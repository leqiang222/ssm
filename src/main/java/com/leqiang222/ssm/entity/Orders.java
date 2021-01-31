package com.leqiang222.ssm.entity;

import com.leqiang222.ssm.utils.DateUtils;
import lombok.Data;
import lombok.ToString;

import java.util.Date;
import java.io.Serializable;
import java.util.List;

/**
 * (Orders)实体类
 *
 * @author makejava
 * @since 2020-04-05 15:02:23
 */
@Data
@ToString
public class Orders implements Serializable {
    private static final long serialVersionUID = 746738294436250157L;
    
    private Integer id;
    
    private String orderNum;
    
    private Date orderTime;
    
    private Integer peopleCount;
    
    private String orderDesc;
    
    private Integer payType;
    private String payTypeStr;
    
    private Integer orderStatus;
    
    private String productId;

    private Long userId;

    private Product product;

    private Member member;

    private List<Traveller> travellers;

    // MARK
    private String orderTimeStr;
    private String orderStatusStr;

    public String getOrderTimeStr() {
        if(orderTime!=null){
            orderTimeStr= DateUtils.date2String(orderTime,"yyyy-MM-dd HH:mm");
        }
        return orderTimeStr;
    }

    public String getOrderStatusStr() {
        //订单状态(0 未支付 1 已支付)
        if(orderStatus==0){
            orderStatusStr="未支付";
        }else if(orderStatus==1){
            orderStatusStr="已支付";
        }
        return orderStatusStr;
    }

    public String getPayTypeStr() {
        //支付方式(0 支付宝 1 微信 2其它)
        if(payType==0){
            payTypeStr="支付宝";
        }else if(payType==1){
            payTypeStr="微信";
        }else if(payType==2){
            payTypeStr="其它";
        }
        return payTypeStr;
    }
}