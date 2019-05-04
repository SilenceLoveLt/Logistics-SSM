package com.yyk.entity;

import java.util.Date;

public class SysOrder {
    private String orderId;

    private Integer id;

    private String userName;

    private String shippAddre;

    private String shippPhone;

    private String payMethod;

    private String goodsCood;

    private String goodsName;

    private String goodsType;

    private Integer freight;

    private Integer goodsWeight;

    private Integer goodsVolume;

    private Integer goodsNum;

    private String consigneeName;

    private String receAddr;

    private String recePhone;

    private Integer orderStatus;

    private Integer status;

    private Date createTime;

    private Date updateTime;

    private String remark;

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getShippAddre() {
        return shippAddre;
    }

    public void setShippAddre(String shippAddre) {
        this.shippAddre = shippAddre == null ? null : shippAddre.trim();
    }

    public String getShippPhone() {
        return shippPhone;
    }

    public void setShippPhone(String shippPhone) {
        this.shippPhone = shippPhone == null ? null : shippPhone.trim();
    }

    public String getPayMethod() {
        return payMethod;
    }

    public void setPayMethod(String payMethod) {
        this.payMethod = payMethod == null ? null : payMethod.trim();
    }

    public String getGoodsCood() {
        return goodsCood;
    }

    public void setGoodsCood(String goodsCood) {
        this.goodsCood = goodsCood == null ? null : goodsCood.trim();
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName == null ? null : goodsName.trim();
    }

    public String getGoodsType() {
        return goodsType;
    }

    public void setGoodsType(String goodsType) {
        this.goodsType = goodsType == null ? null : goodsType.trim();
    }

    public Integer getFreight() {
        return freight;
    }

    public void setFreight(Integer freight) {
        this.freight = freight;
    }

    public Integer getGoodsWeight() {
        return goodsWeight;
    }

    public void setGoodsWeight(Integer goodsWeight) {
        this.goodsWeight = goodsWeight;
    }

    public Integer getGoodsVolume() {
        return goodsVolume;
    }

    public void setGoodsVolume(Integer goodsVolume) {
        this.goodsVolume = goodsVolume;
    }

    public Integer getGoodsNum() {
        return goodsNum;
    }

    public void setGoodsNum(Integer goodsNum) {
        this.goodsNum = goodsNum;
    }

    public String getConsigneeName() {
        return consigneeName;
    }

    public void setConsigneeName(String consigneeName) {
        this.consigneeName = consigneeName == null ? null : consigneeName.trim();
    }

    public String getReceAddr() {
        return receAddr;
    }

    public void setReceAddr(String receAddr) {
        this.receAddr = receAddr == null ? null : receAddr.trim();
    }

    public String getRecePhone() {
        return recePhone;
    }

    public void setRecePhone(String recePhone) {
        this.recePhone = recePhone == null ? null : recePhone.trim();
    }

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}