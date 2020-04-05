package com.leqiang222.ssm.enums;

import lombok.Data;

public enum ProductStatusEnum {
    close(0, "关闭"),
    open(1, "开启");

    private Integer code;
    private String description;

    ProductStatusEnum(Integer code, String description) {
        this.code = code;
        this.description = description;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
