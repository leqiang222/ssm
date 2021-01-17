package com.leqiang222.ssm.entity;

import com.leqiang222.ssm.enums.ProductStatusEnum;
import com.leqiang222.ssm.utils.DateUtils;
import lombok.Data;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.io.Serializable;

/**
 * (Product)实体类
 *
 * @author makejava
 * @since 2020-04-05 14:39:36
 */
@Data
@ToString
public class Product implements Serializable {
    private static final long serialVersionUID = -46566765393584295L;
    
    private String id;
    
    private String productNum;
    
    private String productName;
    
    private String cityName;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date departureTime;
    
    private Double productPrice;
    
    private String productDesc;
    
    private Integer productStatus;

    // MARK:
    private String departureTimeStr;

    private String productStatusStr;

    public String getDepartureTimeStr() {
        if(departureTime != null){
            departureTimeStr= DateUtils.date2String(departureTime,"yyyy-MM-dd HH:mm:ss");
        }
        return departureTimeStr;
    }

    public String getProductStatusStr() {
        if (ProductStatusEnum.open.getCode() == productStatus) {
            return ProductStatusEnum.open.getDescription();
        }
        if (ProductStatusEnum.close.getCode() == productStatus) {
            return ProductStatusEnum.close.getDescription();
        }

        return "未知";
    }
}